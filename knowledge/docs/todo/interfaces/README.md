---
title: README
type: note
permalink: skogai/todo/interfaces/readme
---

# Interfaces Documentation

Documentation for AI interface integrations in the SkogAI ecosystem.

## Overview

This directory contains documentation for integrating and working with different AI interfaces, including AIChat and Goose. These interfaces enable tool calling, memory management, and agent orchestration.

## Structure

### [aichat/](./aichat/)

AIChat integration documentation covering:

- **Function Calls**: How AIChat function calling works
- **Tools**: Tool integration and configuration
- **Agents**: Agent creation and management
- **Custom Tools**: Creating custom tool examples
- **Submodules**: AIChat submodule management

**Key Files**:

- `function-calls.md` - Function calling mechanism
- `tools.md` - Tool integration guide
- `custom-tool-example.md` - Example custom tool implementation
- `agents/creation-guide.md` - Creating AIChat agents
- `agents/overview.md` - Agent system overview
- `agents/migration-guide.md` - Migrating between agent versions
- `agents/rag-integration.md` - RAG system integration

**Purpose**: AIChat serves as the primary interface for tool execution and LLM function calling in the SkogAI ecosystem.

### [goose/](./goose/)

Goose integration documentation focusing on memory systems:

**Structure**:

- `memory/` - Goose memory system implementation
  - `README.md` - Memory system overview
  - `current/` - Active memory files
  - `old/` - Archived memories
  - `*.yaml` - Goose configuration files (orchestrator, specialists)

**Key Features**:

- Tag-based memory organization
- Category-based storage
- Global and session-specific memories
- Memory extension integration

**Purpose**: Goose provides memory management and orchestration capabilities for the multi-agent system.

## Integration Overview

### AIChat Integration

AIChat connects tools to LLM capabilities through:

1. Function definitions in `functions.json`
1. Tool wrappers in `bin/` directory
1. Agent configurations grouping tools
1. argc build process for tool compilation

### Goose Integration

Goose manages system memory through:

1. Memory files with tag-based organization
1. Category-based storage system
1. Extension-based memory loading
1. Hierarchical folder structure

## Usage

### For AIChat

1. Build tools with `argc build`
1. Link to AIChat using scripts
1. Start AIChat session
1. Tools become available as function calls

### For Goose

1. Create `.txt` files with `# tag1 tag2` header
1. Place in `memory/` root directory
1. Goose loads files via memory extension
1. Access memories during sessions

## Related Documentation

- [@../tools/README.md](../tools/README.md) - Tool development overview
- [@../tools/integrating-with-aichat.md](../tools/integrating-with-aichat.md) - Detailed AIChat integration
- [@../tools/argc-build-process.md](../tools/argc-build-process.md) - Build process details
- [@../memory/](../memory/) - Memory system concepts
