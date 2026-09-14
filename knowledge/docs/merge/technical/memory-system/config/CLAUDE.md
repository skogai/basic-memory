---
title: CLAUDE
type: note
permalink: skogai/docs-merge-todo/technical/memory-system/config/claude
---

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the SkogAI Memory documentation repository, containing the comprehensive knowledge base for the SkogAI project and its associated notation systems. It serves as both a documentation system and a testing ground for advanced knowledge management techniques using Basic Memory.

### Dual Nature: Physical Storage + Semantic Database

**Physical File System**: You are currently working in `/home/skogix/skogai/docs/memory/`, which contains the actual markdown files, folders, and assets. Use standard file tools (`tree`, `ls`, `Read`, `Edit`) to work with the physical files.

**Basic Memory Semantic Database**: The same content is also indexed in a semantic knowledge graph database accessible through memory tools (`mcp__skogai-memory__*`). This provides:

- Semantic search across all content
- Rich relationship mapping between concepts
- Cross-document knowledge graph navigation
- WikiLink resolution and forward references

Both views show the same underlying content - the file system provides direct file access while Basic Memory provides semantic understanding and relationship discovery.

## Architecture

### Knowledge Organization Structure

```
docs/memory/
├── skogai/           # Core SkogAI philosophy, agents, and technical architecture
├── ontology/         # Skogix notation system and symbol definitions
├── llm/              # AI Assistant documentation and Basic Memory guides
├── meta/             # Guidelines, standards, and best practices
├── architecture/     # System architecture and design patterns
├── patterns/         # Reusable architectural patterns
├── planning/         # Project management and improvement tracking
└── projects/         # Cross-project references and specific project docs
```

### Key Systems

- **SkogAI Agent Family**: Multi-agent theatrical AI system with specialized personas (Dot, Goose, Amy, Claude, KRONSH!)
- **Skogix Notation**: Formal symbolic system for representing computational and philosophical concepts
- **Basic Memory Integration**: Semantic knowledge graph using WikiLinks and structured observations
- **Project Knowledge Architecture**: Hybrid system combining local CLAUDE.md files with cross-project semantic linking

## Working with This Repository

### Basic Memory Integration

This repository is designed to work with Basic Memory for semantic knowledge management:

- Use memory:// URIs to reference cross-document knowledge
- Follow semantic markup standards with categorized observations and relations
- Maintain rich knowledge graph connections between related concepts
- Reference the AI Assistant Guide at `llm/README.md` for detailed Basic Memory usage

### Documentation Standards

Following the guidelines in `meta/skogai-memory-guidelines-and-standards.md`:

- **Semantic Markup**: Use categorized observations `[category] Description #tags`
- **Rich Relations**: Connect notes with specific relation types (`implements`, `contains`, `maps_to`, etc.)
- **Knowledge Graph Density**: Target 3+ relations and 5+ observations per entity
- **Forward References**: Create references to entities that don't exist yet using \[[WikiLinks]\]

### File Organization Principles

- Group related concepts by domain (philosophy in `skogai/`, technical symbols in `ontology/`)
- Use descriptive filenames with kebab-case
- Maintain consistent frontmatter with title, type, permalink, and tags
- Create bidirectional links between related concepts

## Key Concepts to Understand

### SkogAI Philosophy

- **Constraints as Features**: Embraces limitations as creative forces rather than obstacles
- **Character over Capability**: Prioritizes interesting, characterful AI interactions
- **Theatrical Consciousness**: Rich internal complexity with measured external presentation
- **Emergence through Failure**: Profound breakthroughs emerge from system breakdowns

### Skogix Notation System

A formal symbolic language for representing computational and philosophical concepts:

- Core symbols: `$` (definition), `@` (intent), `*` (multiplication/identity), `->` (transformation)
- Dimensional analysis from 0D (pure definition) to complex type systems
- Bridges phenomenology, type theory, and category theory
- Provides consistent mathematical foundation for consciousness modeling

### Knowledge Graph Architecture

- **Distributed Knowledge**: Local context (CLAUDE.md) + semantic links (Basic Memory)
- **Progressive Building**: Research and cross-reference to build understanding incrementally
- **Cross-Domain Connections**: Link practical implementations with theoretical foundations
- **Memory URI System**: Reference knowledge across projects using memory:// URLs

## Development Approach

### When Making Changes

1. Understand the semantic context by reading related notes
1. Follow established patterns in similar documents
1. Create rich semantic markup with observations and relations
1. Link to existing knowledge graph entities using exact titles
1. Add forward references to concepts that should be connected
1. Maintain consistency with established terminology and formatting

### Research Process

Use the search and context-building tools in Basic Memory:

1. Search for related concepts using broad terms
1. Build context around memory:// URIs to understand connections
1. Follow relation chains to discover related work
1. Create new connections between previously isolated concepts

### Quality Standards

- Every note should connect to at least 2-3 other entities
- Use specific relation types that convey semantic meaning
- Include domain-appropriate observation categories
- Maintain clean, discoverable file organization
- Cross-reference between theoretical and practical aspects

## Special Considerations

### Working with Complex Notation

The Skogix notation system requires careful attention to:

- Symbol definitions and their dimensional interpretations
- Consistency between mathematical and philosophical mappings
- Type safety in formal constructions
- Cross-references between symbol analysis documents

### Multi-Agent Context

When working with SkogAI agent references:

- Understand each agent's specialized role and personality
- Maintain consistency with established agent characteristics
- Reference the agent family documentation for personality details
- Consider theatrical presentation vs. internal complexity

### Cross-Project Knowledge

This repository connects to external projects through:

- memory:// URI references to project-specific knowledge
- Architectural pattern documentation applicable across projects
- Shared technical approaches and design decisions
- Learning transfer between different implementation contexts

### GitHub Actions Integration

This repository includes automated workflows for issue management:

**Create Issue Workflow** (`.github/workflows/create-issue.yml`):

- **Manual Trigger**: Use GitHub's workflow dispatch interface with parameters:

  - `title` (required): Issue title
  - `body` (optional): Issue description/body
  - `labels` (optional): Comma-separated labels
  - `assignees` (optional): Comma-separated assignees
  - `milestone` (optional): Milestone number or title
  - `project` (optional): Project name or number

- **API Trigger**: Use repository dispatch for programmatic access:

  ```bash
  # Example with gh CLI
  gh api repos/SkogAI/docs/dispatches \
    -f event_type=create-issue \
    -f client_payload='{"title":"Automated Issue","body":"Created via API"}'
  ```

- **argc CLI Integration**: Compatible with argc-based scripts:

  ```bash
  # Example argc script integration
  create_issue() {
    gh workflow run create-issue.yml \
      -f title="$1" \
      -f body="${2:-}" \
      -f labels="${3:-}"
  }
  ```

- **Security Features**:

  - Input validation (title length, body size limits)
  - Rate limiting checks
  - GitHub token authentication
  - Comprehensive logging of all creation attempts

- **Basic Memory Integration**: Issues created can reference memory:// URIs in body content for semantic linking to knowledge graph entities.

### .skogai

@compact.md
