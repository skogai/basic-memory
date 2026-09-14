---
title: Cloudflare Infrastructure - Draft 2 Starved Agent
type: note
permalink: testing/differential-engine/cloudflare-infrastructure-draft-2-starved-agent
---

# Cloudflare Infrastructure Setup Guide

## Overview

This guide covers setting up and managing Cloudflare infrastructure for AI/ML workloads. Cloudflare provides edge computing, storage, and AI services that can be orchestrated via Workers and MCP servers.

## Prerequisites

Before getting started, ensure you have:

- A Cloudflare account with appropriate permissions
- The Wrangler CLI installed (`npm install -g wrangler`)
- API tokens with necessary scopes
- rclone configured for R2 sync (if using object storage)

## Account Setup

You'll need your Account ID from the Cloudflare dashboard. This is found in the right sidebar of any zone or account page.

To verify your setup:

```bash
wrangler whoami
```

## Storage Resources

### R2 Object Storage

R2 provides S3-compatible object storage with zero egress fees.

**Common commands:**

```bash
wrangler r2 bucket list
wrangler r2 bucket create <name>
wrangler r2 object put <bucket>/<key> --file <path>
```

**Jurisdiction options:** Default (US) or EU for GDPR compliance.

### D1 Databases

D1 is serverless SQLite at the edge.

**Common commands:**

```bash
wrangler d1 list
wrangler d1 create <name>
wrangler d1 execute <database> --command "<sql>"
```

### KV Namespaces

Key-value storage for read-heavy workloads.

**Common commands:**

```bash
wrangler kv:namespace list
wrangler kv:namespace create <name>
wrangler kv:key put --namespace-id <id> <key> <value>
```

## Workers

Deploy serverless functions at the edge.

**Common commands:**

```bash
wrangler init <name>
wrangler deploy
wrangler tail <worker>
```

Workers can bind to D1, R2, KV, and other services via `wrangler.toml`.

## AI/ML Stack

### AI Gateway

Provides caching, rate limiting, and observability for AI API calls. Configure via dashboard:

- Rate limits (requests per time window)
- Cache TTL
- Logging retention
- Guardrails for content filtering

### AutoRAG (AI Search)

Indexes content from R2 buckets for retrieval-augmented generation.

**Setup steps:**

1. Create R2 bucket with source documents
1. Create AI Search instance pointing to bucket
1. Wait for indexing to complete
1. Query via API or MCP server

**Note:** Embedding model is set at creation and cannot be changed.

### Vectorize

Vector database auto-created by AI Search. Not directly manageable via MCP.

## Network & Connectivity

### Tunnels

Cloudflare Tunnel provides secure ingress without opening ports.

```bash
cloudflared tunnel create <name>
cloudflared tunnel route dns <tunnel> <hostname>
cloudflared tunnel run <name>
```

### WARP Connector

Alternative to tunnels for private network connectivity.

## Security

### API Tokens

Create tokens with minimal required permissions:

- Account level for Workers, R2, D1
- Zone level for DNS
- User level for account management

### Zero Trust

Configure access policies for internal services via dashboard.

## Troubleshooting

### Common Issues

- **Auth errors**: Verify API token permissions and account ID
- **R2 region issues**: Ensure rclone config matches bucket jurisdiction
- **Tunnel connectivity**: Check cloudflared service status

## Resources

- https://developers.cloudflare.com/
- https://developers.cloudflare.com/workers/wrangler/
