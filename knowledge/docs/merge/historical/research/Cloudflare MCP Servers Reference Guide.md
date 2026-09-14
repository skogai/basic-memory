---
title: Cloudflare MCP Servers Reference Guide
type: note
permalink: research/cloudflare-mcp-servers-reference-guide
tags:
  - '["cloudflare"'
  - '"mcp"'
  - '"ai"'
  - '"infrastructure"'
  - '"protocol"]'
---

# Cloudflare MCP Servers: Complete LLM Reference Guide

## What is MCP (Model Context Protocol)?

MCP is a standardized protocol for managing context between large language models (LLMs) and external systems that allows AI programs to exceed their training and helps them connect to external tools. Think of it as a USB-C port for AI applications - just as USB-C provides a standardized way to connect your devices to various accessories, MCP provides a standardized way to connect AI agents to different data sources and tools.

## Cloudflare's Official MCP Server Catalog

Cloudflare offers **14 official MCP servers** that are live and ready to use:

### Core Infrastructure Servers

| Server Name          | Description                         | Server URL                                  | Use Cases                                           |
| -------------------- | ----------------------------------- | ------------------------------------------- | --------------------------------------------------- |
| **Documentation**    | Access to real-time Cloudflare docs | `https://docs.mcp.cloudflare.com/sse`       | Get current documentation vs outdated training data |
| **Workers Bindings** | Manage D1, R2, KV resources         | `https://bindings.mcp.cloudflare.com/sse`   | Create/read databases, storage, key-value stores    |
| **Workers Builds**   | Deploy and manage Workers           | `https://builds.mcp.cloudflare.com/sse`     | Application deployment and management               |
| **Container**        | Secure code execution environment   | `https://containers.mcp.cloudflare.com/sse` | Test and run code in isolated environments          |
| **GraphQL**          | API interactions                    | `https://graphql.mcp.cloudflare.com/sse`    | Direct API queries and data manipulation            |

### Monitoring & Analytics Servers

| Server Name                       | Description                 | Server URL                                     | Use Cases                                         |
| --------------------------------- | --------------------------- | ---------------------------------------------- | ------------------------------------------------- |
| **Observability**                 | Monitor Workers performance | `https://observability.mcp.cloudflare.com/sse` | Log analysis, error tracking, performance metrics |
| **Radar**                         | Global internet insights    | `https://radar.mcp.cloudflare.com/sse`         | Internet trends, domain analysis, traffic data    |
| **Logpush**                       | Analyze log delivery jobs   | `https://logs.mcp.cloudflare.com/sse`          | Log job health, failure analysis                  |
| **AI Gateway**                    | Monitor AI model usage      | `https://ai-gateway.mcp.cloudflare.com/sse`    | AI model performance, latency analysis            |
| **DNS Analytics**                 | DNS performance insights    | `https://dns-analytics.mcp.cloudflare.com/sse` | DNS optimization, performance reports             |
| **Digital Experience Monitoring** | Application performance     | `https://dex.mcp.cloudflare.com/sse`           | User experience, network performance              |

### Security & Advanced Features

| Server Name             | Description                      | Server URL                                 | Use Cases                                          |
| ----------------------- | -------------------------------- | ------------------------------------------ | -------------------------------------------------- |
| **AutoRAG**             | Vector database queries          | `https://autorag.mcp.cloudflare.com/sse`   | Dynamic information retrieval from knowledge bases |
| **Audit Logs**          | Security and compliance tracking | `https://auditlogs.mcp.cloudflare.com/sse` | Account activity monitoring                        |
| **Cloudflare One CASB** | Security posture management      | `https://casb.mcp.cloudflare.com/sse`      | SaaS security, user access analysis                |
| **Browser Rendering**   | Automate browser actions         | `https://browser.mcp.cloudflare.com/sse`   | Screenshots, web scraping, page conversion         |

## Integration Options

### Direct Integration

- **Cloudflare AI Playground**: https://playground.ai.cloudflare.com/
  - Chat interface with MCP server connections
  - Test different AI models from Workers AI
  - OAuth authentication for secure account access
  - Real-time infrastructure interactions

### MCP Client Support

- **Claude Desktop** (with `mcp-remote` proxy)
- **Cursor** IDE
- **Windsurf**
- **Custom applications** using Cloudflare's `use-mcp` React library

## Authentication & Security

All servers use OAuth authentication flows:

- Sign in with your Cloudflare account
- Grant specific permissions to AI agents
- Secure, scoped access to only authorized resources
- No manual API key management required

## Practical Use Cases

### Infrastructure Management

- "Deploy this Worker to production"
- "Show me all failed log jobs from the last week"
- "Create a new D1 database for this project"
- "List all my R2 buckets and their usage"

### Security & Monitoring

- "Which users had the worst network experience today?"
- "Show me all API calls with high latency"
- "Analyze DNS performance across all domains"
- "What security issues were detected in our SaaS apps?"

### Development Workflows

- "Generate a full-stack app with database and storage"
- "Debug this Worker that's throwing errors"
- "Test this code in a secure container"
- "Search the latest Cloudflare documentation for Workers AI"

### Data Analysis & Insights

- "Show me trending domains in our Radar data"
- "What's the average latency for AI Gateway requests?"
- "Generate a chart of global internet traffic patterns"
- "Query our AutoRAG knowledge base for relevant documentation"

## Connection Configuration

### For Remote MCP Clients

Use the server URLs directly in compatible clients like Cloudflare AI Playground.

### For Local MCP Clients

Use `mcp-remote` proxy configuration:

```json
{
  "mcpServers": {
    "cloudflare-observability": {
      "command": "npx",
      "args": ["mcp-remote", "https://observability.mcp.cloudflare.com/sse"]
    },
    "cloudflare-bindings": {
      "command": "npx",
      "args": ["mcp-remote", "https://bindings.mcp.cloudflare.com/sse"]
    }
  }
}
```

## Getting Started

1. **Visit the AI Playground**: https://playground.ai.cloudflare.com/
1. **Connect an MCP server** by entering one of the URLs above
1. **Authenticate** with your Cloudflare account
1. **Start asking questions** about your infrastructure in natural language

## Key Benefits

- **Real-time Data**: Access current information vs outdated training data
- **Natural Language Interface**: Manage complex infrastructure through conversation
- **Secure Access**: OAuth-based permissions and scoped access
- **Global Network**: Powered by Cloudflare's edge infrastructure
- **Comprehensive Coverage**: From development to security to analytics
- **Standardized Protocol**: Works across different AI clients and applications

## Observations

- [technology] MCP serves as standardized protocol for AI-external system connections #protocol #ai
- [feature] 14 official MCP servers available from Cloudflare for production use #cloudflare #servers
- [security] OAuth authentication ensures secure, scoped access without manual API key management #security #oauth
- [capability] Natural language interface enables infrastructure management through conversation #nlp #infrastructure
- [architecture] Server-sent events (SSE) used for real-time communication with AI agents #sse #realtime
- [advantage] Access to real-time data overcomes limitations of outdated training data #realtime #accuracy

## Relations

- implements \[[Model Context Protocol]\]
- enables \[[AI Infrastructure Management]\]
- part_of \[[Cloudflare Developer Platform]\]
- connects_to \[[Workers AI Platform]\]
- supports \[[Natural Language DevOps]\]
- integrates_with \[[Claude Desktop]\]

## Resources

- **Official GitHub**: https://github.com/cloudflare/mcp-server-cloudflare
- **Documentation**: https://developers.cloudflare.com/agents/model-context-protocol/
- **MCP Specification**: https://modelcontextprotocol.io/
- **AI Playground**: https://playground.ai.cloudflare.com/
