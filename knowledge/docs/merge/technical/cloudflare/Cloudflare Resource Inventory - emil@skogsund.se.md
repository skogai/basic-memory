---
title: Cloudflare Resource Inventory - emil@skogsund.se
type: note
permalink: inventory/cloudflare-resource-inventory-emil-skogsund-se
tags:
  - '["cloudflare"'
  - '"inventory"'
  - '"resources"'
  - '"workers"'
  - '"d1"'
  - '"r2"'
  - '"kv"'
  - '"autorag"]'
---

# Cloudflare Resource Inventory - emil@skogsund.se Account

*Account ID: ae931e241550e8326149eeda10ada60d* *Inventoried: August 14, 2025*

## Account Overview

**Primary Account**: emil@skogsund.se (created June 6, 2024) **Alternative Account**: Niklas@aldervall.se (created April 12, 2023)

Current inventory focuses on the emil@skogsund.se account which appears to be the more active account.

## Workers (15 deployed)

| Worker Name                    | Created      | Last Modified | Status           |
| ------------------------------ | ------------ | ------------- | ---------------- |
| **y-gui**                      | Aug 5, 2025  | Aug 5, 2025   | Most Recent      |
| **llm-chat-app-template**      | Jul 11, 2025 | Jul 11, 2025  | Active           |
| **cloudflare-agent**           | May 12, 2025 | May 12, 2025  | Active           |
| **mcp-client**                 | May 10, 2025 | May 10, 2025  | MCP Related      |
| **my-mcp-server**              | May 10, 2025 | May 10, 2025  | MCP Related      |
| **remote-mcp-server-authless** | May 10, 2025 | May 10, 2025  | MCP Related      |
| **skogauth**                   | May 8, 2025  | May 8, 2025   | Auth System      |
| **skogai-chat**                | May 3, 2025  | May 3, 2025   | AI Chat          |
| **skogdb**                     | May 3, 2025  | Jul 19, 2025  | Database Related |
| **cloudflare-authless**        | May 1, 2025  | May 1, 2025   | Auth System      |
| **rag**                        | Mar 4, 2025  | Mar 4, 2025   | RAG System       |
| **skogsund-se**                | Jan 28, 2025 | Jan 28, 2025  | Website          |
| **skograg**                    | Jan 19, 2025 | Mar 4, 2025   | RAG System       |
| **skogai-llm**                 | Jan 8, 2025  | Jan 8, 2025   | LLM Service      |
| **email**                      | Nov 27, 2024 | Nov 27, 2024  | Email Service    |

## D1 Databases (5 total)

| Database Name        | Created      | Tables   | File Size | Purpose          |
| -------------------- | ------------ | -------- | --------- | ---------------- |
| **skogauth-db**      | May 8, 2025  | 2 tables | 36KB      | Authentication   |
| **skogai**           | May 8, 2025  | 1 table  | 20KB      | AI System        |
| **SkogD1-db**        | May 3, 2025  | 2 tables | 28KB      | General Database |
| **skograg-database** | Mar 4, 2025  | 2 tables | 32KB      | RAG System       |
| **SkogRAG**          | Jan 18, 2025 | 0 tables | 0KB       | Empty/Unused     |

## R2 Storage Buckets (5 total)

| Bucket Name         | Created      | Likely Purpose      |
| ------------------- | ------------ | ------------------- |
| **mcp**             | Aug 5, 2025  | MCP-related files   |
| **html-bucket**     | May 10, 2025 | Static HTML content |
| **skogai**          | May 8, 2025  | AI system files     |
| **rosa-helikopter** | Dec 10, 2024 | Project files       |
| **lobe**            | Dec 7, 2024  | Application data    |

## KV Namespaces (4 total)

| Namespace Name                       | ID          | Likely Purpose      |
| ------------------------------------ | ----------- | ------------------- |
| **SkogAI**                           | 402cd1d1... | AI system data      |
| **TEXT_CONTENT**                     | 9a2442b6... | Content storage     |
| **skogauth**                         | d01e8cd8... | Authentication data |
| **e4110deae3dd4f01b328ba80f43a00cd** | b73f608d... | Unknown (UUID name) |

## AutoRAG Vector Stores (1 total)

| AutoRAG ID | Source | Status | Purpose               |
| ---------- | ------ | ------ | --------------------- |
| **skogai** | skogai | Active | Knowledge base search |

## Hyperdrive Configurations

**None configured** - No database connection pooling/acceleration currently set up.

## Resource Patterns Observed

### Naming Conventions

- **skog-** prefix used consistently (SkogAI, skogauth, skogdb, skograg)
- **MCP-related** resources clustered around May 10, 2025
- **Mixed casing** (some camelCase, some kebab-case)

### Development Timeline

- **January 2025**: Initial AI/RAG systems (skogai-llm, SkogRAG)
- **March 2025**: RAG system development (rag, skograg-database)
- **May 2025**: Major development burst (auth, databases, MCP integration)
- **July-August 2025**: Recent activity (llm-chat-app, y-gui)

### System Architecture Hints

- **Authentication layer**: skogauth worker + skogauth-db + skogauth KV
- **AI/Chat systems**: skogai-chat, skogai-llm, skogai database/bucket
- **RAG capabilities**: Multiple RAG workers, skograg-database, AutoRAG
- **MCP integration**: 3 separate MCP-related workers

## Questions for Review

1. **Active vs Legacy**: Which resources are actively used vs experimental/deprecated?
1. **Database schemas**: What tables/data are in each D1 database?
1. **Bucket contents**: What files are stored in each R2 bucket?
1. **KV data types**: What kind of data is in each namespace?
1. **Worker functions**: What does each Worker actually do?
1. **Dependencies**: Which Workers connect to which databases/storage?
1. **AutoRAG content**: What knowledge is indexed in the skogai AutoRAG?
1. **Second account**: Should we also inventory the Niklas@aldervall.se account?

## Observations

- [inventory] 15 Workers deployed across 9 months of development #workers #deployment
- [pattern] Consistent "skog" branding across resource names #naming #branding
- [timeline] Major development activity in May 2025 around MCP integration #development #mcp
- [architecture] Clear separation between auth, AI, and RAG systems #architecture #separation
- [database] 5 D1 databases with varying usage (0-36KB) #database #usage
- [storage] 5 R2 buckets for different content types #storage #organization

## Relations

- part_of \[[Cloudflare MCP Setup Guide - Current Environment]\]
- inventories \[[emil@skogsund.se Account]\]
- contains \[[SkogAI System Architecture]\]
- reveals \[[MCP Integration Timeline]\]
- maps_to \[[Resource Dependency Graph]\]

## Context Update

**Account Status**: Primary development/testing account for Emil Skogsund **Current Usage**: Experimental and testing projects - no active production systems **Resource Status**: All 15 Workers and associated resources are from testing/exploration phases **Future Direction**: Looking to build permanent, production-ready systems with MCP collaboration

### Development History Context

- **skog* branding*\*: Reflects Emil's last name (Skogsund)
- **Multiple iterations**: Various approaches tested for AI, auth, RAG, and MCP integration
- **Learning phase**: Resources created while exploring Cloudflare capabilities
- **MCP milestone**: Now that MCP servers provide direct access, ready to transition from exploration to production

### Next Phase Planning

- **Clean slate approach**: Can treat existing resources as learning/reference material
- **MCP-powered development**: Leverage direct Cloudflare access for rapid iteration
- **Production architecture**: Design and implement systems meant for real use
- **Collaborative development**: Use MCP tools for guided, iterative development process
