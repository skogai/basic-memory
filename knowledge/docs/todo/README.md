---
title: README
type: note
permalink: skogai/todo/readme
---

# SkogAI Documentation Repository

Central knowledge hub for the SkogAI multi-agent ecosystem. This repository provides structured documentation covering tools, workflows, interfaces, system architecture, and cross-agent collaboration standards.

## Status

✅ **Production Ready (v1.0)** - ~437 lines in 3 main files + 60+ supporting documentation files across 10 sections.

## Overview

The SkogAI documentation repository serves as the single source of truth for all SkogAI agents (Claude, Goose, AIChat, Dots). It enables:

- **Centralized Documentation**: Standards, workflows, and technical specifications shared across all agents
- **Decision History**: Context and reasoning behind architectural decisions
- **Cross-Agent Collaboration**: Structured way for agents to contribute to shared knowledge
- **Proposal Process**: Formal system for suggesting and implementing changes

See [@docs-repository.md](./docs-repository.md) for the full overview of purpose and workflow.

## Directory Structure

### [context/](./context/)

File structure documentation and project organization utilities. Contains documentation for the file-structure script that generates project overviews respecting `.gitignore` files.

### [git/](./git/)

Git workflow and submodules documentation. Covers the git-flow-avh workflow, branch structure, commit message format, release process, and submodule management best practices.

### [interfaces/](./interfaces/)

Integration documentation for different AI interfaces:

- **aichat/** - AIChat function calls, tools, agents, and custom tool examples
- **goose/** - Goose memory system architecture and management

### [memory/](./memory/)

Knowledge management concepts and memory system architecture. Includes system architecture documentation, concepts, notes, and the skogai-memory-system documentation.

### [persona/](./persona/)

Character and lorebook guides for persona development. Contains comprehensive guides for character creation, lorebook systems, world-building, and persona systems.

### [prompts/](./prompts/)

Reusable prompt templates for various tasks including:

- Project summaries
- Todo management
- Session continuity
- File structure prompts
- UV package manager workflows

### [skogai/](./skogai/)

SkogAI project-specific context including:

- First executive order
- Roleplay examples and early days documentation
- Project history and philosophy

### [system/](./system/)

Environment setup and system configuration:

- Environment variables (SKOGAI_HOME and paths)
- Tool installations (nvm, rustup, uv)
- System utilities and symlinks
- Hardware configuration (JBL headphones)

### [tools/](./tools/)

Tool development guides and documentation:

- Tool development guide
- argc build process
- Agents guide
- Advanced tool configuration
- AIChat integration
- llm-functions framework
- Environment variables for tools

### [help/](./help/)

Command-line help outputs for quick reference:

- gh (GitHub CLI)
- aichat
- uv (Python package manager)
- argc tools
- tree command

## Key Files

- **[CLAUDE.md](./CLAUDE.md)** - Guidance for Claude Code when working in this repository
- **[docs-repository.md](./docs-repository.md)** - Comprehensive overview of repository purpose and workflow
- **README.md** - This file, providing the top-level directory structure

## Usage

This documentation is designed to be accessible by all SkogAI agents through their individual workspaces. Context scripts can include relevant documentation in agent sessions.

### For Developers

Navigate to specific directories for detailed documentation on each topic. Each major directory contains its own README with more specific information.

### For AI Agents

Reference documentation using the `@` notation (e.g., `@tools/README.md`) to include specific documents in your context. The documentation is structured to support both comprehensive reviews and targeted lookups.

## Contributing

When adding to the documentation:

1. **Keep Documentation Concise**: Focus on clarity and completeness
1. **Preserve Discussion Context**: Maintain "why" explanations separate from "how/what" specifications
1. **Follow Directory Structure**: Place documentation in appropriate sections
1. **Cross-Reference**: Link related documents
1. **Include Examples**: Provide concrete examples where applicable
1. **Maintain History**: Use branches and PRs to track evolution

## Documentation Standards

- Use lowercase for file/directory names (uppercase indicates significance)
- Include front matter with title, description, date, tags, and status where appropriate
- Maintain clear separation between rationale and specifications
- Link related documents to create a cohesive knowledge network

## Integration with SkogAI Ecosystem

The documentation repository addresses critical challenges in the multi-agent system:

1. **Context Limitations**: Externalizes knowledge for agents with different context windows
1. **Persistence**: Documentation persists regardless of individual agent memory limitations
1. **Standardization**: Ensures consistent approaches across different agents
1. **Collaboration**: Enables agents with different specializations to work together
1. **Evolution**: Provides structured way to evolve the system over time

______________________________________________________________________

*This documentation repository is maintained as part of the SkogAI project in the `todo/docs-fix/` workspace.*
