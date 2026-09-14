---
title: SkogAI Memory System Integration
type: note
permalink: system/skog-ai-memory-system-integration
tags:
  - '#memory'
  - '#integration'
  - '#knowledge-graph'
---

# SkogAI Memory System Integration

The SkogAI Memory System provides a sophisticated knowledge graph built on markdown files, with the MCP (Model Context Protocol) enabling seamless interaction for both humans and AI assistants.

## Integration Methods

The memory system can be accessed through multiple interfaces:

1. **Function Calls**: Direct integration with AI assistants through function calling
1. **HTTP API**: RESTful endpoint (http://localhost:8808/tools) for programmatic access
1. **Command Line Interface**: Using `scripts/argc-tool.sh mcp run@tool`

## Core Memory Operations

The memory system exposes several key functions:

- **Creating/Updating Content**: `skogai_memory_write_note`
- **Reading Content**: `skogai_memory_read_note`, `skogai_memory_read_content`
- **Searching**: `skogai_memory_search_notes`
- **Context Building**: `skogai_memory_build_context`, `skogai_memory_recent_activity`
- **Visualization**: `skogai_memory_canvas`
- **Management**: `skogai_memory_delete_note`, `skogai_memory_project_info`

## Memory URI System

The system uses a specialized URI format to reference knowledge:

```
memory://[resource-type]/[identifier]
```

Resource types include `note`, `entity`, `conversation`, and `content`.

## Knowledge Structure

Information is organized as:

- **Documents**: Markdown files with title, content, observations, and relations
- **Observations**: Categorized facts/statements with tags
- **Relations**: Explicit connections between documents

## Configuration and Setup

The memory system is configured through the MCP server, which is defined in `tools/mcp.json`:

```json
{
  "mcpServers": {
    "skogai-memory": {
      "command": "skogai-memory",
      "type": "stdio",
      "args": ["mcp"],
      "disabled": false
    }
  }
}
```

## observations

- [fact] Memory system exposes 9+ functions for knowledge management #capabilities #api
- [technique] MCP bridge translates memory operations to multiple interfaces #integration #interoperability
- [principle] Connected knowledge in a graph provides more value than isolated notes #knowledge-graph
- [fact] Memory content is stored in markdown files with structured sections #storage #accessibility
- [decision] Using a standardized URI system (memory://) enables consistent addressing #addressing
- [technique] Observations and relations create semantic network connections #structure

## relations

- part_of \[[skogai-ecosystem]\] (memory is a core component)
- implements \[[knowledge-management]\] (practical system for organized knowledge)
- relates_to \[[skogai-tool-architecture]\] (uses the same architectural patterns)
- extends \[[markdown-systems]\] (builds knowledge graph capabilities on markdown)
