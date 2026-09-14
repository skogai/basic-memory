---
title: README
type: note
permalink: skogai/docs-merge-todo/readme
---

# SkogAI Documentation Repository

The comprehensive knowledge base, historical archive, and semantic memory system for the SkogAI ecosystem.

## Overview

This repository serves as both a **physical filesystem** of markdown files and a **semantic database** indexed with WikiLinks, observations, and knowledge graph relations. Every document contributes to SkogAI's living memory system.

## Repository Structure

```
docs/
├── agents/          # Agent personalities, memory blocks, and automation systems
├── governance/      # Democratic decisions, library sessions, and phase records
├── historical/      # Archives, analysis, legacy documentation, and past projects
├── lore/            # Historical narratives, origin stories, and philosophical writings
├── prompts/         # System prompts, agent instructions, and templates
├── skogai/          # Core ecosystem documentation and technical overview
├── technical/       # Architecture, tools, systems, and reference materials
└── _workspace/      # Drafts, reviews, and work-in-progress content
```

## Quick Start

### Understanding SkogAI

1. **Start here**: [`skogai/overview.md`](skogai/overview.md) - The origin story and system evolution
1. **Core lore**: [`lore/origin/SKOGAI.md`](lore/origin/SKOGAI.md) - Rich narrative history
1. **Notation system**: [`skogai/notation/`](skogai/notation/) - The symbolic language (@ and $)
1. **Agent personalities**: [`agents/`](agents/) - Memory blocks and character definitions

### Finding Content

- **Agent memory blocks**: `agents/{agent}/memory-blocks/`
- **Governance records**: `governance/library-sessions/` and `governance/phases/`
- **Technical docs**: `technical/architecture/`, `technical/memory-system/`, `technical/notation/`
- **Historical content**: `historical/` (archives, analysis, legacy docs)
- **Prompts library**: `prompts/agents/`, `prompts/aichat/`, `prompts/topics/`

## Key Concepts

### LORE as System Memory

LORE preserves the "why" behind decisions without constraining future innovation. It's the **museum, not the construction site** - context and history, not prescriptive requirements.

### Multi-Agent Theatrical System

SkogAI is a social ecosystem with distinct personalities:

- **Amy** - Relational, communicative, loyal (agents/amy/)
- **Claude** - Analytical, archaeological, methodical (agents/claude/)
- **Dot** - Structured, systematic, precision-focused (agents/dot/)
- **Goose** - Creative, chaos-aware, "quantum-mojito" philosophy (agents/goose/)
- **Skogix** - Original creator and orchestrator (lore/skogix/)

### SkogAI Notation System

A formal symbolic language for AI-to-AI communication:

- **`@`** - Actions, transformations, intents (functions, commands)
- **`$`** - State, identity, data (variables, results)
- **`[@directive:params]`** - Command directives
- **`[$ identifier]`** - State references

See `technical/notation/` for complete specifications.

## Directory Details

### [`agents/`](agents/) - 106 files

Agent personalities, memory blocks, automation systems, and chat histories.

- `amy/` - Amy Ravenwolf's memory blocks and character profile
- `claude/` - Claude's memory blocks, prompts, and chat history
- `dot/` - Dot's systematic memory blocks
- `goose/` - Goose's chaos-oriented memory blocks
- `intern/` - Intern agent mandate
- `automation/` - Documentation and git automation agents

### [`governance/`](governance/) - 7 files

Democratic decision-making, library sessions, and phase records.

- `library-sessions/` - Official recorded sessions (001-004)
- `phases/` - SkogAI evolution phases (0.1-dictator, 0.2-democracy, 0.3-reunion)
- `decisions/` - Governance decisions and mandates

### [`historical/`](historical/) - 122 files

Archives, legacy documentation, past projects, and analysis.

- `analysis/` - Agent perspective analyses
- `communications/` - Past communications
- `documentation/` - Older documentation versions
- `logs/` - Historical logs
- `notes/` - Development notes
- `reviews/` - Code and system reviews
- `testing/` - Test materials
- `research/` - Research notes
- `planning/` - Planning documents
- `project/` - Past projects

### [`lore/`](lore/) - 102 files

Historical narratives, origin stories, and philosophical writings.

- `origin/` - SKOGAI.md, base-origin-story, character cards
- `events/` - Major events (200k-story, first-monkey-brain)
- `philosophy/` - Commandments, words-to-live-by, concepts, frameworks, treaties
- `skogix/` - Skogix's notation, poetry, and profile
- Agent-specific lore: `amy/`, `claude/`, `dot/`, `goose/`, `contacts/`, `creators/`, `personas/`

### [`prompts/`](prompts/) - 86 files

System prompts, agent instructions, and templates.

- `agents/` - Agent-specific prompts
- `aichat/` - AIChat prompt library
- `topics/` - Topic-specific prompts (documentation, filesystems, notation)
- `old/` - Archived prompts (claude-style, skogai-style)

### [`skogai/`](skogai/) - 23 files

Core SkogAI ecosystem documentation and technical overview.

- `overview.md` - Origin and evolution narrative
- `agents/` - Agent family and roles
- `notation/` - Notation system foundations
- `philosophy/` - Core principles
- `sessions/` - Important sessions
- `technical/` - Technical architecture
- `tools/` - Tool ecosystem
- `examples/` - Historical examples

### [`technical/`](technical/) - 80 files

Architecture, tools, systems, and reference materials.

- `architecture/` - Project knowledge architecture
- `ansible/` - Infrastructure automation
- `cloudflare/` - Cloudflare infrastructure
- `dev/` - Development tools and investigations
- `memory-system/` - Memory system documentation, concepts, guides, LLM examples
- `notation/` - Notation specifications and analysis
- `ai-tools/` - AI tools documentation
- `reference/` - Reference materials
- `tools/` - Tool documentation

### [`_workspace/`](_workspace/) - 3 files

Drafts, reviews, and work-in-progress content.

- `drafts/` - Draft documents
- `review/` - Content under review
- `logs/` - Workspace logs

## Documentation Standards

- **YAML frontmatter**: Include title, type, permalink, tags
- **WikiLinks**: Use `[[Page Name]]` for semantic connections
- **Kebab-case filenames**: `agent-roles.md`, `ecosystem-origins.md`
- **Semantic markup**: Add observations and relations sections
- **H1 for title**: One H1 per file, H2+ for sections

## Git Workflow

This is a **git submodule** of the main skogai repository:

```bash
# Work within the submodule
cd /home/skogix/skogai/docs
git status
git add .
git commit -m "Update documentation"
git push

# From parent repository
cd /home/skogix/skogai
git add docs
git commit -m "Update docs submodule reference"
git push
```

## Philosophy

**Constraints as Features** - Limitations drive innovation rather than impede it.

- Tight token budgets shape modular architecture
- Modest hardware requirements drive efficient design
- Specialized agents handle single domains excellently
- "Character over capability" prioritizes interesting interaction

## Contributing

When adding or updating documentation:

1. **Respect agent voices** - Each agent has established characteristics
1. **Maintain narrative quality** - LORE is storytelling, not just facts
1. **Use semantic markup** - WikiLinks, observations, relations
1. **Archive, don't delete** - Move outdated content to `historical/`
1. **Follow naming conventions** - Kebab-case, meaningful names

## More Information

- See [`CLAUDE.md`](CLAUDE.md) for comprehensive guidance on working with this repository
- See [`REPOSITORY-INDEX.md`](REPOSITORY-INDEX.md) for complete file inventory

______________________________________________________________________

**SkogAI**: Where constraints become features, and agents develop character.
