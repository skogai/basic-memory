---
title: Cloudflare Infrastructure - Draft 3 Delta Only
type: note
permalink: testing/differential-engine/cloudflare-infrastructure-draft-3-delta-only
---

# Cloudflare Infrastructure - SkogAI

Account: `ae931e241550e8326149eeda10ada60d` (emil@skogsund.se)

## Storage

### R2 Buckets

| Bucket            | Purpose          | Notes                              |
| ----------------- | ---------------- | ---------------------------------- |
| `skogai`          | RAG source       | EU jurisdiction, 538 files, 16.6MB |
| `html-bucket`     | Static HTML      | 1 file                             |
| `rosa-helikopter` | Media            | 76.56MB                            |
| `mcp`             | MCP integration  | Empty                              |
| `lobe`            | Lobe integration | Minimal                            |

### D1 Databases

| Database           | Purpose      | Status                   |
| ------------------ | ------------ | ------------------------ |
| `skogauth-db`      | Auth data    | 2 tables, active         |
| `skogai`           | Main data    | 1 table, active          |
| `skograg-database` | RAG metadata | 2 tables, active         |
| `skog-api`         | API backend  | Empty, new               |
| `SkogRAG`          | Legacy       | Unused, delete candidate |

### KV Namespaces

- `TASKMANAGER_KV` — task state
- `TEXT_CONTENT` — content cache
- `skogauth` — auth sessions

## Workers (20 deployed)

**Active/Important:**

- `llm-chat` — main LLM interface (most recent: 2025-11-14)
- `skog-api` — API endpoint
- `skogauth` — authentication
- `skogai-chat` — chat interface
- `skogdb` — database API
- `skograg` — RAG API

**Task Management (4 similar, consolidate?):**

- `mcp-taskmanager-prod`, `skogai-taskmanager`, `dev-skogai-taskmanager`, `mcp-taskmanager`

**Probably unused:**

- `test`, `y-gui`, `llm-chat-app-template`

## AI Stack

### AutoRAG (`skogai`)

- Source: R2 `skogai` bucket (EU)
- Status: Indexing (132 done, 394 queued, 12 processing)
- Gateway: `skogai`
- ⚠️ Verify it's watching EU bucket, not default jurisdiction

### AI Gateway (`skogai`)

- Rate: 50 req/60s
- Cache: 300s TTL
- Guardrails: All FLAG (S1-S13)

## Data Pipeline

```
~/markdown (18k files) → rclone → R2 `skogai` (EU) → AutoRAG → Vectorize
```

Sync: auto/6h or manual. Currently 538/18000 uploaded.

## Known Issues

1. **EU jurisdiction confusion** — AutoRAG might be watching wrong bucket
1. **Token sprawl** — 33+ tokens, 17 R2 tokens, need audit
1. **Tunnel broken** — lost connectivity after EU switch
1. **Naming mess** — `skogai`/`skograg`/`SkogRAG` inconsistent

## Tokens (in vault)

```
CLOUDFLARE_ACCOUNT_ID
CLOUDFLARE_AI_API_KEY
CLOUDFLARE_API_KEY
CLOUDFLARE_DNS_API_KEY
CLOUDFLARE_API_TOKEN
CLOUDFLARE_API_KEY_GLOBAL
CLOUDFLARE_API_ZONE_ID
CLOUDFLARE_API_KEY_WORKERS
CLOUDFLARE_API_TOKEN_WORKERS
CLOUDFLARE_ORIGIN_CA
```

R2: "skog-api build token" (2025-11-07) + 16 others

## TODO

- [ ] Verify AutoRAG → EU bucket connection
- [ ] Finish upload (17.5k files remaining)
- [ ] Test RAG queries
- [ ] Fix tunnel
- [ ] Audit/consolidate tokens
- [ ] Delete `SkogRAG` database
- [ ] Consolidate taskmanager workers
