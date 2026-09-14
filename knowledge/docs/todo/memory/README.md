---
title: README
type: note
permalink: skogai/todo/memory/readme
---

# Memory System Documentation

Documentation for knowledge management concepts and memory system architecture in the SkogAI ecosystem.

## Overview

This directory contains documentation about memory systems, knowledge management, system architecture, and persistent storage mechanisms for AI agents.

## Structure

### [System Architecture/](./System%20Architecture/)

High-level system architecture documentation including:

- **CacheBuilder Application Architecture.md** - CacheBuilder system design and architecture

### [concepts/](./concepts/)

Foundational concepts for knowledge management:

- **Future-Linking in Knowledge Management.md** - Advanced linking strategies
- **SkogAI Tool Architecture.md** - Tool system design concepts

### [notes/](./notes/)

Working notes and implementation details:

- **SkogCLI Documentation.md** - SkogCLI tool documentation

### [system/](./system/)

System-level integration documentation:

- **Model Context Protocol (MCP).md** - MCP integration details
- **SkogAI Memory System Integration.md** - Memory system integration guide

### Key Files

#### [skogai-memory-system.d](./skogai-memory-system.d)

Comprehensive memory system documentation covering the SkogAI memory architecture, storage mechanisms, and retrieval patterns.

#### [skogcli.md](./skogcli.md)

Documentation for the SkogCLI tool, a command-line interface for interacting with the SkogAI memory system.

## Memory System Concepts

The SkogAI memory system provides:

1. **Persistent Knowledge Storage**: Long-term storage of information across agent sessions
1. **Context Management**: Efficient context window utilization
1. **Knowledge Retrieval**: Fast access to relevant information
1. **Cross-Agent Sharing**: Shared knowledge base for multiple agents
1. **Hierarchical Organization**: Structured categorization of information

## Memory Types

- **Short-term Memory**: Session-specific context
- **Working Memory**: Active task context
- **Long-term Memory**: Persistent knowledge storage
- **Episodic Memory**: Event and interaction history
- **Semantic Memory**: Factual knowledge and relationships

## Integration Points

The memory system integrates with:

- **Goose Memory Extension**: Tag-based file storage (see [@../interfaces/goose/memory/](../interfaces/goose/memory/))
- **RAG Systems**: Retrieval-augmented generation
- **Model Context Protocol**: Standardized context access
- **SkogCLI**: Command-line memory interface

## Usage Patterns

### Adding to Memory

1. Identify information type (architecture, concept, note, system)
1. Create appropriately formatted document
1. Place in relevant subdirectory
1. Cross-reference related documents

### Retrieving from Memory

1. Use SkogCLI for command-line access
1. Reference documents via `@` notation
1. Integrate with RAG for semantic search
1. Access through Goose memory extension

## Related Documentation

- [@../interfaces/goose/memory/README.md](../interfaces/goose/memory/README.md) - Goose memory implementation
- [@../interfaces/aichat/agents/rag-integration.md](../interfaces/aichat/agents/rag-integration.md) - RAG system integration
- [@../system/](../system/) - System configuration for memory paths
