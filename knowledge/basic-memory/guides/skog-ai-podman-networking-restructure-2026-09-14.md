---
title: SkogAI Podman Networking Restructure (2026-09-14)
type: guide
permalink: main/guides/skog-ai-podman-networking-restructure-2026-09-14
tags:
- podman
- cloudflare-tunnel
- quadlet
- networking
- mcphub
- basic-memory
---

## Why this exists

Before today, "skognet" was used as a name for four unrelated things (a Podman
bridge network, a Cloudflare tunnel, an IP route subnet, and a DNS hostname),
which made the actual topology impossible to reason about. This note is the
result of untangling that and moving to a systemd-quadlet-managed, one-directory-
per-service layout under `~/.config/containers/systemd/`.

## Naming disambiguation (the confusion that started this)

| Name | What it actually is |
|---|---|
| Podman network `skognet` (old) | A bridge network — retired in favor of per-service `.network` quadlets |
| Cloudflare tunnel `skognet` | WARP-routing only, no ingress rules — backs private route `10.10.50.0/24` |
| Cloudflare tunnel `skogai` | The one that carries **HTTP ingress** to services like MCPHub |
| Cloudflare tunnel `skogix-workstation-service` | Backs private route `10.10.4.5/32` — the workstation itself |
| `skogix-workstation.skogai.se` (public DNS) | Points at the edge for tunnel `skognet`; resolving the bare hostname `skogix-workstation` locally returns **synthetic** (local interface) answers, not this |

Lesson: identical names across Podman networks, Cloudflare tunnels, IP routes,
and DNS records do **not** imply any connection between the underlying objects.
Each has to be checked independently.

## Current working topology

```
Cloudflare tunnel "skogai"
  └─ connector: container skogai-tunnel (quadlet-managed)
        networks: skogai-tunnel.network, (+ any service network it needs to reach)
        started via: Exec=tunnel --no-autoupdate run skogai
        (runs by tunnel NAME, not --token — token/cert never touches argv or logs)

skogai-mcphub (MCPHub) — bridges three networks:
  - mcphub_mcphub-network  → talks to mcphub-postgres (private, DB only)
  - skogai-tunnel.network  → reachable BY the tunnel connector by container name
  - basic-memory.network   → reaches the basic-memory container by container name

basic-memory + basic-memory-postgres — own isolated "basic-memory" network,
  postgres never exposed beyond it.
```

Pattern used repeatedly: **when service A needs to reach service B by container
name, give A a second `Network=` line in its quadlet pointing at B's network.**
The network being reached does NOT need to know about A. Postgres instances stay
single-network on purpose (never bridged onto the tunnel network).

## Quadlet layout

`~/.config/containers/systemd/` — one directory per service, e.g.:

```
skogai-tunnel/
  skogai-tunnel.container   # Exec=tunnel --no-autoupdate run skogai
  skogai-tunnel.network     # NetworkName=skogai-tunnel
  skogai-tunnel.env
mcphub/
  skogai-mcphub.container   # Network= lines: mcphub_mcphub-network, skogai-tunnel.network, basic-memory.network
  skogai-mcphub-postgres.container
basic-memory/
  basic-memory.container    # Image=basic-memory.build (local Dockerfile build via quadlet .build unit)
  basic-memory.network
  basic-memory-postgres.container
```

`EnvironmentFile=` paths must be relative to the quadlet file's own directory
(or `%h/...` absolute) — a stale absolute path left over from a flat-layout
migration silently breaks the unit (found and fixed on mcphub-postgres).

Referencing `Network=some-name.network` in a `.container` file works across
subdirectories — quadlet resolves by unit basename, not path, and
auto-generates the `Requires=`/`After=` dependency on the corresponding
`-network.service`.

## Bugs found and fixed today

1. **MCPHub → tunnel**: `skogai-mcphub` wasn't declared on any network the
   tunnel connector could reach it by name on. Fix: added
   `Network=skogai-tunnel.network` to its quadlet (second network leg,
   postgres untouched).

2. **`basic-memory` crash-looping (~2851 restarts)**: bind-mount source
   `/home/skogix/.local/src/basic-memory/knowledge` didn't exist on the host.
   `mkdir -p` fixed it immediately — the Dockerfile Build/Exec setup was fine.

3. **Stale systemd network state**: `basic-memory-network.service` showed
   `active (exited)` for 14h, but the underlying Podman network had actually
   been removed at some point. Systemd's one-shot network unit never
   re-verifies the resource exists after its first successful run — a
   `systemctl --user restart basic-memory-network.service` recreated it.
   **Takeaway: `active (exited)` on a `.network` quadlet only means "the
   create command succeeded once," not "the network exists right now."**

4. **`memory` MCP server config**: was pointed at an external
   `https://memory.skogai.se/mcp` via SSE + incomplete OAuth
   (`pendingAuthorization` stuck, `clientSecret` in plaintext). Once
   `skogai-mcphub` could reach `basic-memory` by name (fix #1's pattern
   applied again), repointed the server config to
   `http://basic-memory:8000/mcp` (`type: streamable-http`), no OAuth needed.
   Went from `disconnected (502)` to `connected`, 21 tools.

## Verified end-to-end (2026-09-14)

`skogportal` → `skogmcp` → tunnel `skogai` → `skogai-mcphub` → both
`sequential-thinking` and `memory` (basic-memory) connected and callable from
a live Claude Code session. `context7` also connected via the same path.

## Still open / not urgent

- `memory` server config still has an unused `oauth.clientSecret` field
  (`"skogsund1!"` — a real, human-chosen password) left over from the old
  external-URL setup. No longer needed now that the connection is internal;
  should be cleared and the password rotated since it printed to a
  transcript.
- MCPHub group `claude-public` references a server named `basic-memory`,
  which doesn't exist — the real server is named `memory`. Group is
  currently silently missing that member. Fix: `groups remove-server
  claude-public basic-memory` + `groups add-server claude-public memory`.
- `newt` (Pangolin, `pangolin.aldervall.se`) is a fourth remote-access
  mechanism alongside Cloudflare Tunnel/WARP and Tailscale — not yet
  reconciled with this topology, may be intentional redundancy or a leftover.
- Container sprawl: ~17 orphaned auto-named `cloudflared` containers and 3
  zero-connection Cloudflare tunnels (`Aldervall`, `dns-tunnel`,
  `my-test-tunnel`) from earlier ad-hoc testing, not yet cleaned up.
- `newt.quadlet.container` has `NEWT_SECRET`/`NEWT_ID` in plaintext
  `Environment=` lines, with a commented-out `# Secret=...` line suggesting
  an unfinished migration to `podman secret`.

## Useful commands from today

```bash
# who's on a given podman network, without needing exec tools inside minimal images
podman network inspect <network> --format '{{range .Containers}}{{.Name}} {{range .Interfaces}}{{range .Subnets}}{{.IPNet}}{{end}}{{end}}{{"\n"}}{{end}}'

# reload + bring up a quadlet-managed service after editing its .container file
systemctl --user daemon-reload
systemctl --user restart <service>.service

# check tunnel identity/connections independent of DNS
cloudflared tunnel list
cloudflared tunnel info <name>
```

## Related

- relates_to [[Basic Memory Dev Env Cheat Sheet (skogix fork checkout)]] — that note covers the basic-memory dev/fork environment itself; this note covers the surrounding network/tunnel topology it now runs inside.
