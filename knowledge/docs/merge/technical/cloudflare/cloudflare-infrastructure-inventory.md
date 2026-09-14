---
title: Cloudflare Infrastructure Inventory
type: note
permalink: infrastructure/cloudflare-infrastructure-inventory
tags:
  - infrastructure
  - cloudflare
  - inventory
  - network
  - status
---

# Cloudflare Infrastructure Inventory

*Last updated: 2024-11-14*

## Account Details

- Account ID: `ae931e241550e8326149eeda10ada60d`
- Email: emil@skogsund.se
- Created: 2024-06-06

## AI/ML Stack

### AI Search (AutoRAG)

**Active:**

- `skogai` - R2 source, currently indexing (538 files, 16.6MB)
  - Status: Processing (394 queued, 12 processing, 132 successful)
  - Source bucket: `skogai` (EU jurisdiction)
  - Embedding model: Default (set at creation, cannot change)
  - Connected to AI Gateway: `skogai`

**Missing/TODO:**

- Test queries once indexing completes
- Document chunk size/overlap settings
- Query rewriting config (currently default)
- Reranking config (disabled by default)

### AI Gateway

**Active:**

- `skogai`
  - Rate limit: 50 req/60s (fixed window)
  - Cache TTL: 300s
  - Log retention: 10M events (delete oldest)
  - Authentication: enabled
  - All guardrails: FLAG status (S1-S13 for prompt & response)

### Vectorize

- Auto-created by AI Search
- Index tied to `skogai` RAG
- Details not directly queryable via MCP

## Storage

### R2 Buckets

**Active:**

1. `skogai` (2025-05-08) - 538 objects, 16.6MB - **RAG source, EU jurisdiction**
1. `html-bucket` (2025-05-10) - 1 object, 153KB
1. `mcp` (2025-08-05) - empty
1. `lobe` (2024-12-07) - 1 object, 205B
1. `rosa-helikopter` (2024-12-10) - 2 objects, 76.56MB

**Auth Status:**

- Working rclone config for EU jurisdiction endpoint
- Multiple R2 API tokens active (17 total - mix of Account and User tokens)
- Most recent: "skog-api build token" (2025-11-07)

### D1 Databases

**Active:**

1. `skog-api` (2025-11-07) - 0 tables, 28KB
1. `skogauth-db` (2025-05-08) - 2 tables, 36KB
1. `skogai` (2025-05-08) - 1 table, 32KB
1. `skograg-database` (2025-03-04) - 2 tables, 32KB
1. `SkogRAG` (2025-01-18) - 0 tables, 12KB

**Missing:**

- Schema documentation for populated databases
- Purpose/usage documentation for each DB

### KV Namespaces

**Active:**

1. `TASKMANAGER_KV` (2e9d3210...)
1. `TEXT_CONTENT` (9a2442b6...)
1. `skogauth` (d01e8cd8...)
1. Anonymous: `e4110deae3dd4f01b328ba80f43a00cd` (b73f608d...)

## Workers (20 deployed)

### Recently Active

- `llm-chat` (modified: 2025-11-14 02:10) - **most recent**
- `skog-api` (created: 2025-11-07)

### AI/ML Workers

- `ai-container` (2025-09-27)
- `cloudflare-container` (2025-09-27)
- `cloudflare-agent` (2025-05-12)
- `llm-chat-app-template` (2025-07-11)

### Task Management

- `mcp-taskmanager-prod` (2025-08-26)
- `skogai-taskmanager` (2025-08-26)
- `dev-skogai-taskmanager` (2025-08-26)
- `mcp-taskmanager` (2025-08-26)

### Auth/Identity

- `skogauth` (2025-05-08, modified 2025-09-27)
- `verificay` (2025-08-25, modified 2025-09-27)

### Chat/Communication

- `skogai-chat` (2025-05-03)

### Sales/Business

- `sales-skogsund-se` (2025-09-16)
- `resultat-raketen` (2025-09-16)

### Database/Storage Workers

- `skogdb` (2025-05-03, modified 2025-07-19)
- `skograg` (2025-01-19)

### MCP/Integration

- `mcp-client` (2025-05-10)

### Misc/Testing

- `y-gui` (2025-08-05)
- `test` (2025-08-23)

## Network/Connectivity

### Hyperdrive

**Status:** None configured

### Tunnels/WARP

**Known:**

- `cloudflared` installed locally
- Argo tunnel tokens exist in vault (not shown)
- Connection issues after switching to EU jurisdiction

**Missing Documentation:**

- Active tunnel configurations
- Domain routing setup
- WARP Connector vs cloudflared approach decision

## Domains & DNS

**Status:** Not inventoried yet

**TODO:**

- List managed domains
- DNS records inventory
- SSL/TLS certificate status
- Page Rules / Rulesets

## Access/Security

### Zero Trust

**Status:** Unknown - not checked

**TODO:**

- Access applications list
- Gateway policies
- WARP client deployment
- Device enrollment status

### API Tokens (Non-R2)

**Known from vault:**

- `CLOUDFLARE_ACCOUNT_ID`
- `CLOUDFLARE_AI_API_KEY`
- `CLOUDFLARE_API_KEY`
- `CLOUDFLARE_DNS_API_KEY`
- `CLOUDFLARE_API_TOKEN`
- `CLOUDFLARE_API_KEY_GLOBAL`
- `CLOUDFLARE_API_ZONE_ID`
- `CLOUDFLARE_API_KEY_WORKERS`
- `CLOUDFLARE_API_TOKEN_WORKERS`
- `CLOUDFLARE_ORIGIN_CA`

Additional sets for tunnels/network configuration exist.

## Data Pipeline Status

### Current Active Flow

```
Local markdown (18k files) 
  → rclone sync 
    → R2 bucket `skogai` (EU)
      → AI Search indexing (in progress)
        → Vectorize index
          → Queryable via Workers/API
```

### Sync Status

- rclone: Working (EU endpoint configured)
- Upload: In progress (538/18000 files)
- Indexing: Active (132 successful, 394 queued, 12 processing)
- Next sync: Auto every 6 hours OR manual "Sync Index" button

## Known Issues

1. **Jurisdiction confusion:** Created EU bucket but AI Search might be watching default-jurisdiction bucket
1. **Token sprawl:** 33+ Cloudflare tokens, 17 R2 tokens - unclear which are actually needed
1. **Tunnel connectivity:** Lost after EU jurisdiction switch
1. **Network gaps:** DNS, routing, tunnel config not documented
1. **Service naming:** Inconsistent naming (skogai/skograg/SkogRAG across different services)

## Next Steps

### Immediate

- [ ] Verify AI Search is watching correct EU bucket
- [ ] Complete file upload (17.5k files remaining)
- [ ] Test RAG queries once indexing completes
- [ ] Document tunnel/network configuration

### Short-term

- [ ] Inventory domains & DNS
- [ ] Map out which Workers are actually in use
- [ ] Clean up unused D1 databases
- [ ] Consolidate/revoke unnecessary API tokens
- [ ] Fix tunnel connectivity

### Long-term

- [ ] Establish naming convention across services
- [ ] Document all integration points
- [ ] Set up monitoring/alerting
- [ ] Create runbooks for common operations
