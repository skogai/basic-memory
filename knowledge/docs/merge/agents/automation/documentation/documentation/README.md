---
title: README
type: note
permalink: skogai/docs-merge-todo/agents/automation/documentation/documentation/readme
---

# SkogAI Documentation Agent System

## Overview

Automated documentation generation through specialized AI agents, each focused on specific documentation types and workflows.

## Core Philosophy

- **Minimal Input, Maximum Output**: Agents extract comprehensive docs from minimal context
- **Specialized Focus**: Each agent handles one documentation type excellently
- **Progressive Enhancement**: Start simple, layer complexity as needed
- **Context Awareness**: Agents understand SkogAI's unique notation and philosophy

## Agent Types

### 1. Code Documentor

Analyzes code and generates technical documentation

- API references
- Function documentation
- Architecture diagrams
- Dependency maps

### 2. Lore Keeper

Maintains historical and philosophical documentation

- Origin stories
- Evolution timelines
- Agent personalities
- Philosophical frameworks

### 3. Memory Indexer

Organizes and indexes the knowledge base

- Category management
- Cross-references
- Semantic connections
- Knowledge graphs

### 4. Workflow Scribe

Documents processes and workflows

- Step-by-step guides
- Best practices
- Tool configurations
- Integration patterns

### 5. Review Analyst

Analyzes and consolidates existing documentation

- Gap analysis
- Redundancy detection
- Quality assessment
- Migration recommendations

## Quick Start

```bash
# Generate documentation for a specific component
./docs/agents/documentation/generate.py --type code --target src/

# Update lore documentation
./docs/agents/documentation/generate.py --type lore --context "new feature"

# Index memory system
./docs/agents/documentation/generate.py --type memory --action index

# Document workflow
./docs/agents/documentation/generate.py --type workflow --process "deployment"

# Review existing docs
./docs/agents/documentation/generate.py --type review --path docs/
```

## Workflow

1. **Identify**: Determine what needs documentation
1. **Select**: Choose appropriate agent type
1. **Gather**: Agent collects context automatically
1. **Generate**: Agent produces documentation
1. **Review**: Quick human validation
1. **Integrate**: Auto-commit to repository

## Configuration

Agents use `docs/agents/documentation/config.yaml` for:

- Output formats
- Template selection
- Integration points
- Quality thresholds

## See Also

- [Agent Prompts](./prompts/)
- [Templates](./templates/)
- [Examples](./examples/)
- [Scripts](./scripts/)
