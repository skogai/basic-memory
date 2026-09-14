---
title: Cloudflare MCP Setup Guide - Current Environment
type: note
permalink: guides/cloudflare-mcp-setup-guide-current-environment
tags:
  - '["cloudflare"'
  - '"mcp"'
  - '"setup"'
  - '"configuration"'
  - '"infrastructure"]'
---

# Cloudflare MCP Setup Guide - Current Environment

## Overview

This guide covers the Cloudflare MCP servers currently available in our environment and the information needed to use them effectively. We have access to two main server categories: **Developer Platform** tools and **AutoRAG** capabilities.

## Available MCP Servers

### 1. Cloudflare Developer Platform

**Purpose**: Manage Cloudflare infrastructure resources **Scope**: Workers, D1 databases, R2 storage, KV namespaces, Hyperdrive configs

### 2. Cloudflare AutoRAG

**Purpose**: Query vector databases and knowledge stores **Scope**: Document search, AI-powered search across indexed content

## Required Configuration Information

### Account Setup Questions

**Primary Questions to Answer:**

1. **Which Cloudflare account should be the active account?**

   - Need account ID for both Developer Platform and AutoRAG
   - May have multiple accounts (personal, work, projects)
   - Account selection affects resource visibility and permissions

1. **What existing resources do we have?**

   - D1 databases (names, purposes, schemas)
   - R2 buckets (names, contents, access patterns)
   - KV namespaces (names, data types stored)
   - Workers (names, functions, deployment status)
   - Hyperdrive configurations (database connections)
   - AutoRAG vector stores (knowledge bases, document collections)

### Access & Permissions Questions

3. **Authentication status**

   - Are we properly authenticated to both MCP servers?
   - What permissions does our auth token have?
   - Can we read vs read/write vs full admin access?

1. **Resource naming conventions**

   - How are databases/buckets/namespaces named?
   - Any organizational structure or prefixes used?
   - Development vs production resource separation?

### Usage Context Questions

5. **Primary use cases**

   - What do we typically use D1 databases for?
   - What content is stored in R2 buckets?
   - What data is in KV stores?
   - What knowledge is indexed in AutoRAG?

1. **Development workflow**

   - How do we typically deploy Workers?
   - Database migration and schema management approach?
   - Backup and versioning strategies?

## Discovery Commands to Run

### Account Information

```
# List all available accounts
cloudflare:accounts_list()
autorag:accounts_list()

# Once we identify the right account, set it active
cloudflare:set_active_account(accountId)
autorag:set_active_account(accountId)
```

### Resource Inventory

```
# Discover existing resources
d1_databases_list()           # See all databases
r2_buckets_list()            # See all storage buckets
kv_namespaces_list()         # See all key-value stores
workers_list()               # See all deployed workers
hyperdrive_configs_list()    # See database connections
autorag:list_rags()          # See all vector stores
```

### Documentation Access

```
# Search for specific topics in real-time docs
search_cloudflare_documentation("topic")
```

## Information We Need to Collect

### For Each D1 Database:

- **Name and purpose**: What data does it store?
- **Schema overview**: Key tables and relationships
- **Access patterns**: Read-heavy vs write-heavy usage
- **Connected applications**: Which Workers use this database?

### For Each R2 Bucket:

- **Name and purpose**: What files/data stored?
- **Access patterns**: Public vs private, frequency of access
- **Connected applications**: Which systems read/write to it?
- **Size and cost considerations**: Storage usage patterns

### For Each KV Namespace:

- **Name and purpose**: What type of key-value data?
- **Data patterns**: Cache, configuration, user data?
- **Connected applications**: Which Workers access this data?
- **TTL strategies**: How long do we keep data?

### For Each AutoRAG Vector Store:

- **Name and purpose**: What knowledge domain?
- **Content source**: What documents/data are indexed?
- **Search use cases**: What questions does it help answer?
- **Update frequency**: How often is content refreshed?

### For Each Worker:

- **Name and function**: What does it do?
- **Dependencies**: What resources does it use (D1, R2, KV)?
- **Deployment status**: Production, staging, development?
- **Performance considerations**: Scaling, error rates

## Next Steps

1. **Run discovery commands** to inventory existing resources
1. **Document each resource** with purpose and usage patterns
1. **Identify dependencies** between Workers and data stores
1. **Create resource usage guides** for common operations
1. **Establish naming conventions** for future resources
1. **Set up monitoring** for resource health and usage

## Observations

- [requirement] Account ID selection critical for proper resource access #setup #accounts
- [workflow] Resource discovery needed before effective usage #discovery #inventory
- [architecture] Workers, D1, R2, KV, and AutoRAG form integrated ecosystem #cloudflare #architecture
- [security] Authentication and permission scoping affects available operations #security #permissions
- [documentation] Real-time doc search provides current API information #docs #realtime
- [dependency] Resource interdependencies must be mapped for effective management #dependencies #mapping

## Relations

- implements \[[Cloudflare MCP Servers Reference Guide]\]
- requires \[[Account Configuration]\]
- enables \[[Infrastructure Management Workflow]\]
- connects_to \[[D1 Database Management]\]
- connects_to \[[R2 Storage Management]\]
- connects_to \[[Workers Deployment Process]\]
- utilizes \[[AutoRAG Knowledge Search]\]
