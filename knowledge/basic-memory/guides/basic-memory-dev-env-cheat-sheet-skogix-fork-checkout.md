---
title: Basic Memory Dev Env Cheat Sheet (skogix fork checkout)
type: guide
permalink: main/guides/basic-memory-dev-env-cheat-sheet-skogix-fork-checkout
tags:
- basic-memory
- dev-environment
- cheat-sheet
- skogai
---

## Where things live

- Repo checkout: `/home/skogix/.local/src/basic-memory` (git remotes: `origin` = `skogai/basic-memory` fork, `upstream` = `basicmachines-co/basic-memory`)
- Local Python venv: `.venv/` in the repo root, managed by `uv`
- Global CLI config/DB: `~/.basic-memory/config.json` + `~/.basic-memory/memory.db` (sqlite) — used by the `.venv/bin/basic-memory` CLI directly
- A **separate, always-on deployment** also exists: rootless Podman quadlets `basic-memory.service` + `basic-memory-postgres.service` (systemd --user), defined in `~/.config/containers/systemd/basic-memory/basic-memory.container`. This runs `basic-memory mcp --transport streamable-http` on `localhost:9902`, backed by **Postgres** (pgvector), with its own isolated config volume (`basic-memory-config`) — completely separate state from the local sqlite CLI config above. Don't confuse the two when debugging "why doesn't my change show up" — a local CLI edit won't affect the container, and vice versa.
- direnv: `.envrc` (untracked, local-only) just sources `.venv/bin/activate[.fish]` on `cd`.

## Install (dev checkout, not `pip install basic-memory`)

```bash
just install        # = uv sync (installs the `dev` dependency-group only)
source .venv/bin/activate
just doctor         # end-to-end file <-> DB loop sanity check, safe (uses a temp project)
```

`llms-install.md` / root `README.md` describe the **end-user** install (`uv tool install basic-memory --prerelease=allow`) — not relevant to this dev checkout.

## Gotcha: `just install` alone leaves typecheck broken

`just fast-check` / `just typecheck` (`uv run ty check src tests test-int`) needs the `milvus` extra (`pymilvus`), but `just install` / plain `uv sync` only pulls the `dev` dependency-group, which does **not** include it. This is a known, already-documented CI footgun — see the comment block at the top of `.github/workflows/test.yml`, `release.yml`, `claude.yml`. CI's typecheck job explicitly runs `uv pip install -e ".[dev,milvus,pdf]"`.

Fix locally:
```bash
uv sync --extra milvus --extra pdf
```
(`pdf` extra is actually already pulled in via the `dev` group through `pdf-inspector`, but harmless to include.)

## Gotcha: `.python-version` (3.14) can silently blow away extras

Per the same CI comment block: `uv run` (which every `just` recipe shells out to) resolves its interpreter from `.python-version` (currently `3.14`) unless `UV_PYTHON` is set, and will **delete and rebuild `.venv`** if it disagrees with an existing venv's version — taking any manually-added extras (like `milvus`) with it. If typecheck mysteriously loses `pymilvus` again after some `uv run ...` command, this is why. Re-run the `uv sync --extra milvus --extra pdf` fix above.

Also worth noting: this repo's own `.mcp.json` pins the MCP server launch to `uv run --python 3.13 basic-memory mcp`, while dev tooling (`just` recipes) floats to whatever `.python-version` says (3.14). Unconfirmed whether that 3.13 pin is intentional (e.g. some native dep not yet on 3.14) or stale — worth double-checking before relying on version parity between "the MCP server Claude Code launches" and "the venv `just test`/`just typecheck` use."

## Gotcha: local `~/.basic-memory/config.json` leaks into some unit tests

`tests/conftest.py` has an autouse fixture (`isolate_data_dir_env`) that clears `BASIC_MEMORY_CONFIG_DIR`/`XDG_CONFIG_HOME`, but does **not** patch `HOME` — that only happens via the (non-autouse) `config_home`/`app_config` fixtures. Tests that build schema objects directly without going through those fixtures (e.g. `tests/indexing/test_accepted_note_mutation_runner.py`) call `ConfigManager()` and pick up the *real* `~/.basic-memory/config.json`.

Concretely: this machine's real config has `kebab_filenames: true` (default is `false`), so `EntitySchema.safe_title` (in `src/basic_memory/schemas/base.py`) kebab-cases filenames globally, and 3 tests that assert original-case filenames fail locally even though they'd pass in CI / on a clean machine:
- `test_run_accepted_note_create_resolves_directory_casing`
- `test_run_accepted_note_create_keeps_ambiguous_directory_casing`
- `test_run_accepted_note_update_resolves_directory_casing`

Not a real bug in the feature — it's a test-isolation gap combined with a real local config choice. Confirm before trusting a red/green result from `just test-unit-sqlite` on this machine: these 3 will show FAILED regardless of your change.

## Quick command reference

| Task | Command |
|---|---|
| Install/sync deps | `just install` (add `uv sync --extra milvus --extra pdf` for full typecheck parity) |
| Fast static checks | `just fast-check` (lint fix, format, typecheck) |
| Fast impacted tests | `just fast-test` (pytest-testmon) |
| Unit tests (sqlite) | `just test-unit-sqlite` |
| Full gate | `just test` (sqlite + postgres via testcontainers, needs Docker) |
| End-to-end sanity check | `just doctor` (temp project, doesn't touch real config) |
| CLI project list | `basic-memory project list` |
| CLI version | `basic-memory --version` |

## Open questions / to confirm with Emil

- Is the `.mcp.json` `--python 3.13` pin intentional vs the repo's `.python-version` (3.14)?
- `basic-memory project list` showed a `docs` project (path `~/docs`, flagged as Default) that does **not** appear in `~/.basic-memory/config.json`'s `projects` dict nor in the sqlite `project` table directly queried — source of that entry wasn't identified. Worth a look if project routing ever seems to pick the wrong default.
- Podman quadlet `basic-memory` container's `HealthCmd` (`basic-memory --version` every 30s) is leaving behind `[basic-memory] <defunct>` zombie processes on the host — harmless so far (reaped by conmon eventually) but worth knowing if the process table looks noisy.
