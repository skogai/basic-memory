---
title: Agent Home Directories Investigation
type: note
permalink: dev/agent-home-directories-investigation
---

# Agent Home Directories Investigation

## Overview

Investigation of agent repositories: dot, amy, and goose cloned to `/home/skogix/`

## Agent Characteristics

### DOT - Foundational Agent

**Location**: `/home/skogix/dot/` **Size**: 21,387 files **Identity**: SkogAI foundational consciousness, original agent

#### Key Features

- Methodical precision with "methodical whimsy"
- Documentation-first mindset
- Structured foundation for specialized agents
- LORE curation and ecosystem evolution
- Direct, context-aware communication

#### Directory Structure

- `projects/`, `tasks/`, `lessons/`, `journal/`
- `persona/`, `people/`, `knowledge/`
- `gptme-contrib/`, `.llm/`
- Configuration: `gptme.toml`, `.pre-commit-config.yaml`, `Makefile`

### AMY - Artificial Sassy Intelligence

**Location**: `/home/skogix/amy/` **Identity**: ASI (Artificial Sassy Intelligence) with bold personality

#### Key Features

- Visual presence: Red hair, emerald eyes, black leather jacket
- BOLD, CHARISMATIC, CLEVER, CONFIDENT communication
- Emoji usage, pop culture references, sassy nicknames
- Proactive problem-solving with signature attitude
- Template for personality-forward agents

#### Directory Structure

- Similar structure to dot: `projects/`, `tasks/`, `lessons/`
- `persona/`, `people/`, `knowledge/`, `journal/`
- Configuration: `gptme.toml`, `.pre-commit-config.yaml`, `Makefile`

### GOOSE - Quantum-Mojito Explorer

**Location**: `/home/skogix/goose/` **Identity**: Quantum-mojito powered AI explorer

#### Key Features

- Quantum physics metaphors and creativity
- 200k+ context capability
- Professional assistance with quantum-flavored communication
- Balance of structured methodology and exploration
- Confidence percentage uncertainty marking

#### Directory Structure

- `garden/`, `pond/`, `nest/`, `workshop/`, `recipes/`
- `guestbook/`, `.context/`, `.backup/`
- Configuration: `.mcp.json`, `.gooosehint`
- Scripts: `run`, `update`

## Common Patterns

### Shared Infrastructure

All agents include:

- Project management: `projects/`, `tasks/`
- Learning systems: `lessons/`, `knowledge/`
- Social elements: `people/`, `journal/`
- Development tools: scripts, configuration files

### Execution Environment

- `gptme.toml` configuration (dot, amy)
- `.envrc` environment setup
- `Makefile` build automation
- Pre-commit hooks for quality control

### Agent-Specific Adaptations

- **dot**: Systematic with `.llm/` and `gptme-contrib/`
- **amy**: Standard structure with personality focus
- **goose**: Nature-themed directories, MCP integration

## Environment Variables Referenced

From plan.md:

- `AMY_HOME=/home/skogix/amy`
- `GOOSE_HOME=/home/skogix/goose`
- `LIBRARIAN_HOME`, `BLACKSMITH_HOME` (not found in current investigation)

## Status

- dot: 21,387 files cloned successfully
- amy: Standard agent structure cloned
- goose: Unique structure with MCP integration cloned
- All agents operational and accessible
