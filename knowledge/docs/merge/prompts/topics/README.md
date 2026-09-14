---
title: README
type: note
permalink: skogai/docs-merge-todo/prompts/topics/readme
---

# SkogAI

## Documentation System

- **./docs/**: General documentation dump
- **basic-memory MCP**: Memory system managing `./docs/{memory,lore}`

### Docs Folder Structure

#### Active/Managed (Keep as-is)

- **memory/**: Basic-memory managed knowledge base (20+ domains)
  - Technical: ai-tools, architecture, dev, tools, ansible
  - Research: coffee, concepts, ontology, research
  - Organization: guides, inventory, meta, planning
  - SkogAI notation system and computational phenomenology
- **lore/**: Basic-memory managed lore system (agent personas, concepts, frameworks, etc.)
- **official/**: Formal library session documentation
- **media/**: Grok-generated visual assets (22 images + 10 videos, ~17MB)

#### Pending Integration/Review

- **to-be-looked-over/**: Claude workspace documentation staging (33 files, 240KB)
  - Organized system docs, agent configs, Claude Code documentation
  - **Status**: Ready for review and integration into proper locations
- **analysis/**: Agent perspective analyses from SkogAI Librarian (6 files)
  - Formal reports on agent understanding and system evolution
  - **Status**: Consider moving to lore/ when other analysis is done
- **prompts/**: Comprehensive prompt library for SkogAI ecosystem (40+ files)
  - Agent creation templates, metaprompts, tool creators
  - **Status**: Old prompts needing integration back into active system

#### For Cleanup/Relocation

- **curated/**: Mixed staging content (test files + substantial SkogAI docs in todo/ subfolder)
  - **Status**: WIP content, likely duplicates of basic-memory entries - review for removal
- **generated/**: Empty knowledge templates (4 stub files)
  - **Status**: Unused templates - relocate to templates/ or remove
- **important-moments/**: Historical project milestones (8 large files)
  - **Status**: Tag as LORE, likely move to lore/ folder in future
- **.aichat-sessions/**: Chat session archives (1 YAML file)
  - **Status**: Session logging - determine if belongs in memory system

#### External Dependencies

- **archives/**: Librarian workspace + symlink to `/tools/agents/librarian/archives/`
  - **Status**: Symlink will resolve when tools/librarian project is restored

## Python Environment

- **uv/uvx**: Manages all Python tooling
- **Installed tools via uv tool**:
  - basic-memory
  - gptme
  - gptme-rag
  - mcp-think-tool
  - skogcli

## Configuration

- **./config/**: Configuration files for MCP servers and system settings
  - `claude-mcp.json`: MCP server configurations for Claude Code
  - `nvim-mcp-hub.json`: Comprehensive MCP server hub with 100+ available tools
  - `config.json`: Main system configuration with environment variables, API keys, and agent settings
  - `script_metadata.json`: Metadata tracking for script usage and statistics

## Scripts

- **./scripts/**: Custom automation scripts
  - `skogai-test.py`: Template Python script for SkogCLI
  - `token.sh`: Token count estimation utility for text files

## TODO

- [ ] Document individual projects
- [ ] Organize documentation structure
