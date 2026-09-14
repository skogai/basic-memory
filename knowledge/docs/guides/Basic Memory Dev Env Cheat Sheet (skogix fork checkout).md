---
title: Basic Memory Dev Env Cheat Sheet (skogix fork checkout)
type: guide
permalink: docs/guides/basic-memory-dev-env-cheat-sheet-skogix-fork-checkout
tags:
- basic-memory
- dev-environment
- cheat-sheet
- skogai
---

# Basic Memory Dev Env Cheat Sheet (skogix fork checkout)

Checkout: `/home/skogix/.local/src/basic-memory`

Rewritten note — an earlier version of this was saved via a different MCP
connection (`bm2`) that turned out to be routed to the Podman/Postgres-backed
`basic-memory` container, not this host's filesystem. It never showed up on
disk anywhere findable and is presumed stranded in the container's volumes.
This is the durable replacement, saved through the properly-connected local
`mcp__basic-memory` server.

## Where things live

- **Two parallel config stores exist on this machine**, selected by whether
  `XDG_CONFIG_HOME` is set in the calling shell (`resolve_data_dir()` in
  `src/basic_memory/config_models.py`):
  - `~/.basic-memory/config.json` — used when `XDG_CONFIG_HOME` is unset
  - `~/.config/basic-memory/config.json` — used when `XDG_CONFIG_HOME` is set
    (this is the case in normal login/tmux/Claude Code shells here, since
    `XDG_CONFIG_HOME=/home/skogix/.config`)
  - **This explains the original "stray `docs` project" mystery**: it wasn't
    stray, it's just that whichever config a given shell/tool resolves to
    determines which projects and which `default_project` you see. As of
    2026-09-11 both files list the same three projects (`main`,
    `skogai-routing`, `docs`) with `default_project: "docs"` — they've mostly
    converged, but `kebab_filenames` still differs (`true` in
    `~/.basic-memory/config.json`, `false` in `~/.config/basic-memory/config.json`)
    along with a couple of minor settings. **Not yet consolidated** — worth
    deciding whether to keep two stores intentionally or merge them.
  - `main` project path `/home/skogix/basic-memory` is **currently an empty
    directory** (0 bytes, last modified ~2026-09-11 during/around a reboot).
    Flagged, not yet investigated — don't assume `main` has content.
  - `docs` project path `/home/skogix/docs` is real, populated, and itself a
    git repo — safe to treat as durable.
- A **separate, always-on containerized deployment** exists via Podman
  quadlet: `~/.config/containers/systemd/basic-memory/basic-memory.container`
  runs `basic-memory mcp --transport streamable-http --port 8000` (published
  `9902:8000`), backed by Postgres (`basic-memory-postgres.service`,
  pgvector), with config in the `basic-memory-config` volume and a bind mount
  from `/home/skogix/.local/src/basic-memory/knowledge` (**this host path does
  not exist** — so that bind mount is effectively empty/broken on this host).
  This is entirely separate state from the local SQLite CLI setup and from
  either config file above. Any MCP connection that ends up talking to this
  container (e.g. `bm2` in this session) writes into the Postgres/volume
  store, not `~/basic-memory` or `~/docs`.

## Install (dev checkout, from CONTRIBUTING.md + justfile)

```bash
git clone https://github.com/basicmachines-co/basic-memory.git
cd basic-memory
just install          # = uv sync (installs the `dev` dependency-group only)
source .venv/bin/activate
just test             # SQLite + Postgres (Postgres via testcontainers, needs Docker)
```

## Gotcha: `just install` doesn't match CI's typecheck install

- `just install` runs plain `uv sync`, which only pulls the `dev`
  dependency-group.
- CI's typecheck job (`.github/workflows/test.yml`) runs
  `uv pip install -e ".[dev,milvus,pdf]"` — the `milvus` and `pdf` **extras**
  from `pyproject.toml` aren't installed by `just install`.
- Symptom: `just fast-check` fails typecheck with
  `unresolved-import: pymilvus` / `pymilvus.exceptions`.
- Fix: `uv sync --extra milvus --extra pdf` to match CI locally.

## Gotcha: `uv run` silently rebuilds `.venv` and drops extras

- `.python-version` pins 3.14. If `.mcp.json` or any invocation pins a
  different interpreter (was `--python 3.13`, since fixed — see below), or if
  the existing `.venv` disagrees with `.python-version` for any reason, a
  bare `uv run ...` / `uv sync` will **delete and rebuild `.venv` from
  scratch**, silently dropping the milvus/pdf extras installed above.
- Confirmed firsthand: a plain `uv run pytest ...` printed "Removed virtual
  environment... Creating virtual environment... Installed 191 packages"
  mid-session.
- This is documented as a known footgun in comments across
  `.github/workflows/test.yml`, `release.yml`, `claude.yml`.
- No structural fix applied (would mean changing default dependency groups
  for everyone, out of scope without explicit sign-off). Just re-run
  `uv sync --extra milvus --extra pdf` after any bare `uv run`/`uv sync` if
  typecheck starts failing on `pymilvus` again.

## Resolved: `.mcp.json` Python pin (fixed)

- Was: `"args": ["run", "--python", "3.13", "basic-memory", "mcp"]` — stale
  pin, didn't match repo's actual `.python-version` (3.14). Confirmed
  unintentional by Emil ("nothing is intentional... clean up do as you see
  fit").
- Fixed: dropped the explicit `--python 3.13` override so it inherits from
  `.python-version` — single source of truth, avoids drift.
- Status: fixed in working tree, **not yet git-committed**.

## Resolved: `kebab_filenames` test-isolation bug (fixed)

- `tests/conftest.py`'s autouse `isolate_data_dir_env` fixture cleared
  `BASIC_MEMORY_CONFIG_DIR`/`XDG_CONFIG_HOME` but never patched `HOME`. Tests
  that build schema/config objects directly (bypassing the `config_home`/
  `app_config` fixtures) call `ConfigManager()`, which falls back to
  `Path.home() / ".basic-memory"` — i.e. the real dev machine's config, with
  `kebab_filenames: true` here.
- Symptom: 3 failures in
  `tests/indexing/test_accepted_note_mutation_runner.py` (directory-casing
  assertions), machine-dependent rather than code-dependent.
- Fixed: `isolate_data_dir_env` now also does
  `monkeypatch.setenv("HOME", str(tmp_path))` (plus `USERPROFILE` on
  Windows).
- Verified: `uv run pytest tests/indexing/test_accepted_note_mutation_runner.py -p pytest_mock -q --no-cov`
  → 42 passed (previously 3 failed).
- Status: fixed in working tree, **not yet git-committed**.

## Quick command reference

| Task | Command |
|---|---|
| Install (dev group only) | `just install` |
| Install matching CI (typecheck) | `uv sync --extra milvus --extra pdf` |
| Fast static check (lint/format/typecheck) | `just fast-check` |
| Unit tests, SQLite | `just test-unit-sqlite` |
| Full test gate | `just test` |
| Typecheck only | `just typecheck` |
| End-to-end file↔DB check | `just doctor` |
| List configured projects | `basic-memory project list` |
| Show effective config | `basic-memory config list` |

## Open / not yet acted on

- Two parallel config stores (`~/.basic-memory/` vs `~/.config/basic-memory/`)
  — decide whether to consolidate or document as intentional.
- `main` project directory (`/home/skogix/basic-memory`) is empty — worth
  checking whether that's expected or data went missing.
- `.mcp.json` and `tests/conftest.py` fixes are uncommitted — confirm before
  `git commit`/push.
- The original cheat-sheet note written via `bm2` is presumed stranded inside
  the Podman container's Postgres/volume-backed store and was not recovered;
  this note supersedes it.
