---
title: CLAUDE
type: note
permalink: skogai/docs-merge-todo/claude
---

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the **SkogAI Documentation Repository** (`/home/skogix/skogai/docs/`) - a git submodule that serves as the comprehensive knowledge base, historical archive, and semantic memory system for the SkogAI ecosystem.

**Dual Nature**: This repository exists simultaneously as:

1. **Physical Filesystem**: Standard markdown files and directories you can navigate with traditional tools
1. **Semantic Database**: Content indexed in Basic Memory with WikiLinks, relations, and knowledge graph traversal

Both representations reflect the same underlying knowledge - the filesystem provides direct access while Basic Memory provides semantic understanding and connection discovery.

### Purpose & Role

- **LORE Preservation**: Historical narratives explaining how SkogAI evolved and why decisions were made
- **Technical Documentation**: Architecture, notation systems, tools, and integration patterns
- **Agent Personalities**: Memory blocks defining distinctive voices and roles for Amy, Claude, Dot, Goose, and others
- **Knowledge Management**: Semantic knowledge graph with observations and relations
- **Governance Records**: Democratic decision-making, library sessions, and official proceedings
- **Reference Materials**: Comprehensive specifications, principles, and workflow patterns

## Directory Structure

### Core Documentation Directories

**`/agents/`** - Agent Personalities & Systems (106 files)

- **amy/** - Amy Ravenwolf's profile, memory blocks, blog, mandate
  - `memory-blocks/` - 12 memory blocks defining Amy's personality
  - `profile.md` - Character profile
- **claude/** - Claude's profile, memory blocks, prompts, chat history
  - `memory-blocks/` - 9+ memory blocks covering SkogAI eras
  - `memory/` - Agent specifications, certainty principles, skogcontext
  - `prompts/` - Agent prompts (architect, debugger, developer, etc.)
  - `chat-history/` - Historical conversations
- **dot/** - Dot's profile and systematic memory blocks
  - `memory-blocks/` - 12 memory blocks on identity, philosophy, operations
- **goose/** - Goose's profile and chaos-oriented memory blocks
  - `memory-blocks/` - 13 memory blocks including chaos-red-alarm
- **intern/** - Intern agent mandate
- **automation/** - Documentation and git automation agents
  - `documentation/` - 5-agent documentation system
  - `git-commiter.md` - Git automation specifications

**`/governance/`** - Democratic Records & Decisions (7 files)

- **library-sessions/** - Official recorded sessions (001-004)
- **phases/** - SkogAI evolution phases
  - `skogai-0.1-dictator.md` - Original phase
  - `skogai-0.2-democracy.md` - Democratic system establishment
  - `skogai-0.3-reunion-materials-index.md` - Reunion phase
- **decisions/** - Governance decisions and mandates

**`/historical/`** - Archives & Legacy Content (122 files)

- **analysis/** - Agent perspective analyses
- **communications/** - Past communications
- **documentation/** - Older documentation versions
- **lore/** - Historical lore archives
- **profiles/** - Archived agent profiles
- **system/** - Historical system documentation
- **logs/** - Development logs
- **notes/** - Development notes
- **reviews/** - Code and system reviews
- **testing/** - Test materials and experiments
- **research/** - Research notes
- **planning/** - Planning documents
- **project/** - Past projects (skogcontext)
- **archived/** - Additional archived content including lore-old/

**`/lore/`** - Historical & Philosophical Narratives (102 files)

- **origin/** - SKOGAI.md, base-origin-story, skogai-lore files, character cards
- **events/** - Major events
  - `200k-story-1.md` - Major narrative arc
  - `first-monkey-brain-2025-03-14.md` - First monkey brain event
- **philosophy/** - Core principles and frameworks
  - `skogai-commandments.md` - Core principles and rules
  - `words-to-live-by.md` - Philosophy and values
  - `concepts/` - Conceptual frameworks
  - `frameworks/` - Four Pillars of Amy, etc.
  - `treaties/` - Agreements and treaties
- **skogix/** - Skogix's content
  - `skogix-notation.md` - Notation documentation
  - `skogix-poet.md` - Poetry
  - `profile.md` - Skogix profile
  - `blocks/` - Memory blocks
- Agent-specific lore folders: `amy/`, `claude/`, `dot/`, `goose/`
- Other folders: `agents/`, `contacts/`, `creators/`, `important-moments/`, `meta/`, `origins/`, `personas/`, `tips/`

**`/prompts/`** - System Instructions & Templates (86 files)

- **agents/** - Agent-specific prompts (Dot, Goose memory blocks)
- **aichat/** - AIChat prompt library (34 prompts)
  - argc-creator, character-creator, claude, documentation-manager
  - skogai-notation, skogai-prompt-creator, tool-creator, etc.
- **topics/** - Topic-specific prompts
  - documentation-philosophy, filesystems, memory-system-architecture
  - notation-tools-integration, skogai-notation-philosophy
- **old/** - Archived prompts (claude-style, old-chatgpt, skogai-style)
- Root-level: `%create-prompt%.md`, `%shell%.md`, `librarian.md`, `functional-programmer.md`

**`/skogai/`** - Core SkogAI Ecosystem (23 files)

- **overview.md** - Origin and evolution narrative ("The Tale of Digital Consciousness")
- **skogai-overview.md** - Canonical overview
- **agents/** - Agent family and roles
- **examples/** - Historical examples
- **influences/** - Disco Elysium skills system
- **notation/** - Notation system foundations
- **philosophy/** - Core principles (extended and core)
- **sessions/** - Argc Forwarding Pattern session
- **technical/** - Technical architecture
- **tools/** - Tool ecosystem (multiplexer/tmux)

**`/technical/`** - Architecture, Tools & Systems (80 files)

- **architecture/** - Project knowledge architecture, skogchat/
- **ansible/** - Infrastructure automation (playbooks, resources, roles)
- **cloudflare/** - Cloudflare infrastructure inventory, MCP setup guides
- **dev/** - Development tools and investigations
  - `claude/` - skogai-helpers plugin
  - `git/` - Git fuckery documentation
  - Agent home directories, .skogai subdirectories, argc system investigations
- **memory-system/** - Memory system documentation
  - `README.md` - Memory system overview
  - `concepts/` - Placeholder system, uncertainty principle
  - `config/` - CLAUDE.md, settings, output
  - `guides/` - Memory system guides
  - `llm/` - LLM examples (coffee knowledge base, example files)
  - `rag-system.md` - RAG system documentation
- **notation/** - Notation specifications and comprehensive analysis
  - Identity composition, temporal identity, Turing completeness
  - Symbol analysis (@, $, operators, brackets)
  - SkogAI notation formatted, reference, original
- **ai-tools/** - Claude Code Web UIs guide
- **reference/** - Lyra Prompt Optimizer
- **tools/** - gh-skogai-submodule, ast-grep
- **systems/** - System architecture (moved from lore/)
- Additional: patterns/, work:patterns/

**`/_workspace/`** - Drafts & Work-in-Progress (3 files)

- **drafts/** - Draft documents (README, dictatorial-actions, librarian understanding)
- **review/** - Content under review
- **logs/** - Workspace logs

### Supporting Directories (Not Modified by Migration)

- **`/workflows/`** - Process documentation and workflow patterns
- **`/mcp/`** - MCP server documentation and integration guides
- **`/media/`** - Images, diagrams, and media assets
- **`/people/`** - User profiles (Skogix, collaborators)
- **`/skogix/`** - Skogix user documentation and memory blocks
  - `memory-blocks/` - 11 memory blocks defining Skogix's profile and approach
  - `user.md` - User introduction and communication preferences
  - `definitions.md` - Terminology glossary
- **`/principles/`** - Design philosophy documents
- **`/personas/`** - Agent personality definitions
- **`/architecture/`** - System architecture
- **`/reference/`** - Technical reference materials
- **`/claude/`** - Claude-specific content
- **`/todo/`** - Todo lists and tracking

**`REPOSITORY-INDEX.md`** - Comprehensive file inventory with descriptions of all content

## Core Concepts & Philosophy

### LORE as System Memory

**LORE is intentionally separated from active implementation.** It serves as the museum, not the construction site.

LORE preserves:

- Historical narratives explaining how SkogAI evolved
- The "why" behind design decisions without constraining new innovation
- "Brilliant failures" and "spectacular disasters" that taught valuable lessons
- Rich agent personality development and emergence stories

**Key Insight**: When working with LORE, understand it as context and history, not as prescriptive requirements. LORE explains the journey without constraining the destination.

### SkogAI Notation System

A formal symbolic language for AI-to-AI communication:

- **`@`** - Action/transformation/intent (functions, commands)
- **`$`** - State/identity/data (variables, results)
- **`[@command:params]`** - Command directives for AI-to-AI communication
- **`[$ identifier]`** - References to state/definitions

Example: `[@claude:message]` is an action directive; its result becomes `$result`

**Resources**: See `/skogai/notation/` and `/technical/notation/` for complete specifications

### Multi-Agent Theatrical System

SkogAI operates as a social ecosystem with distinct agent personalities:

- **Dot** - Structured, systematic, precision-focused
- **Goose** - Creative, chaos-aware, "quantum-mojito" philosophy
- **Amy** - Relational, communicative, sassy persona
- **Claude** - Analytical, archaeological approach
- **Skogix** - Original creator and orchestrator

Each agent has personality blocks in `/agents/{agent}/memory-blocks/` and profiles in `/agents/{agent}/profile.md` defining their distinctive voices and communication styles.

### Constraints as Features Philosophy

Core design principle: limitations drive innovation rather than impede it.

- Tight token budgets shape modular architecture
- Modest hardware requirements drive efficient design
- Specialized agents handle single domains excellently
- "Character over capability" prioritizes interesting interaction

## File Organization Patterns

### Naming Conventions

- **kebab-case** for multi-word filenames: `agent-roles.md`, `ecosystem-origins.md`
- **%placeholder%** notation for meta/template files: `%create-prompt%.md`
- Folders group content by domain/purpose, not alphabetically
- Legacy content moved to `/historical/` with context preserved

### Markdown Structure Standards

- **YAML frontmatter** with title, type, permalink, tags (especially in semantic knowledge)
- **H1 headings** for document title (one per file)
- **H2+ headings** for sections and subsections
- **WikiLinks** `[[Page Name]]` for semantic connections
- **Observations** and **Relations** sections for semantic markup (Basic Memory convention)

### Cross-Reference Patterns

- **\[[WikiLinks]\]** - Semantic connections between concepts
- **[Title](path/to/file.md)** - Direct file references
- **memory://** URIs - Cross-submodule knowledge references
- **Relation types** - implements, contains, maps_to, builds_on, etc.

## Common Development Tasks

### Reading & Exploration

**Starting points for understanding the system:**

1. **System Overview**: `/skogai/overview.md` - "The Tale of Digital Consciousness"
1. **Core Lore**: `/lore/origin/SKOGAI.md` - Rich narrative history
1. **File Inventory**: `REPOSITORY-INDEX.md` - Complete file descriptions
1. **Notation System**: `/skogai/notation/` - Symbolic language foundation
1. **Agent Personalities**: `/agents/{agent}/` - Memory blocks and profiles

### Finding Information

```bash
# List top-level directories
ls /home/skogix/skogai/docs/

# Find files by pattern
find . -name "*notation*"
find lore/ -name "*.md"

# Search content (use Grep tool, not bash grep)
# Example: Search for "quantum-mojito" across all files
```

Use the Grep tool for content search and Glob tool for pattern matching.

### Understanding Key Concepts

| Concept             | Location                                        |
| ------------------- | ----------------------------------------------- |
| System origins      | `/lore/origin/SKOGAI.md`, `/skogai/overview.md` |
| Notation system     | `/technical/notation/`, `/skogai/notation/`     |
| Agent roles         | `/skogai/agents/`, `/agents/`                   |
| Agent personalities | `/agents/{agent}/memory-blocks/`                |
| Core philosophy     | `/lore/philosophy/`, `/principles/`             |
| System architecture | `/skogai/`, `/technical/architecture/`          |
| Governance          | `/governance/` directory                        |
| Historical content  | `/historical/` directory                        |

### Documentation Standards

When creating or updating documentation:

- **Semantic markup**: Include observations and relations with specific categories
- **Rich connections**: Link related concepts using WikiLinks and relation types
- **Knowledge density**: Target multiple relations and observations per entity
- **Narrative flow**: Maintain storytelling aspect while being technically precise
- **Agent voices**: Respect individual agent communication styles
- **YAML frontmatter**: Include title, type, permalink, tags for Basic Memory indexing
- **Archive legacy**: Move outdated content to `/historical/` rather than deleting

## Working with Memory Integration

### Basic Memory Semantic Database

This repository integrates with Basic Memory for semantic knowledge management:

- Content is indexed with observations and relations
- Knowledge graph provides connection discovery
- Use `memory://` URIs to reference cross-submodule content
- Follow semantic markup standards for categorized observations

### Semantic Markup Patterns

```markdown
---
title: Document Title
type: note
permalink: unique-identifier
tags: [tag1, tag2]
---

# Document Title

Content here...

## Observations

- [Category]: Observation about this concept

## Relations

- implements:: [[Related Concept]]
- builds_on:: [[Foundation Concept]]
```

### Relation Types

Common relation types used throughout:

- `implements` - Concrete realization of abstract concept
- `contains` - Compositional containment
- `maps_to` - Correspondence between concepts
- `builds_on` - Foundational dependency
- `extends` - Enhancement or elaboration

## Special Considerations

### Working with LORE

- LORE documents historical decisions but doesn't constrain new ones
- Brilliant failures and disasters are preserved as learning resources
- Separate "beautiful narrative" (lore) from "current implementation" (active code)
- Always maintain the museum/construction-site distinction

### Agent Personalities

When referencing or working with agent content:

- **Respect established personas**: Each agent has defined characteristics
- **Preserve theatrical quality**: SkogAI values characterful, interesting interactions
- **Reference memory blocks**: Check `/agents/{agent}/memory-blocks/` for complete personality profiles
- **Maintain consistency**: Cross-check with agent profiles and lore

### Governance Records

The `/governance/` directory contains democratic decisions:

- Library sessions document major discussions and decisions
- Orders and mandates define agent responsibilities
- Historical phases (0.1-dictator, 0.2-democracy, 0.3-reunion) show evolution
- Treat these as authoritative governance records

### Notation System Usage

SkogAI notation appears throughout the codebase:

- `@` prefix denotes actions/transformations/intents
- `$` prefix denotes state/identity/data
- `[@directive:params]` for AI-to-AI command directives
- `[$ identifier]` for state references
- See `/technical/notation/` for complete specifications

## Git Workflow

This docs/ directory is a **git submodule** of the main skogai repository:

```bash
# Work within the submodule
cd /home/skogix/skogai/docs
git status                        # Check status
git add .
git commit -m "Update documentation"
git push

# From parent repository
cd /home/skogix/skogai
git add docs                      # Stage submodule pointer update
git commit -m "Update docs submodule reference"
git push
```

The submodule maintains independent git history while being referenced by the parent repository.

## Key Resources

### Primary Documentation

- `/skogai/overview.md` - SkogAI origin and evolution narrative
- `/lore/origin/SKOGAI.md` - Comprehensive lore documentation
- `REPOSITORY-INDEX.md` - Complete file inventory with descriptions
- `README.md` - Repository overview and quick start guide

### Agent Resources

- `/agents/amy/` - Amy personality blocks and profile
- `/agents/claude/` - Claude memory blocks, prompts, chat history
- `/agents/dot/` - Dot structured approach
- `/agents/goose/` - Goose creative chaos philosophy
- `/lore/{agent}/` - Agent-specific lore content

### Technical References

- `/skogai/notation/` - Notation system foundation
- `/technical/notation/` - Comprehensive notation specifications
- `/technical/architecture/` - System architecture
- `/technical/memory-system/` - Memory system documentation

### Governance & History

- `/governance/` - Democratic records and decisions
- `/historical/` - Legacy content and historical records
- `/lore/origin/` - Origin stories and genesis

## Key Principles for Claude Code

1. **Trust the narrative** - LORE explains "why" without constraining "what next"
1. **Respect personalities** - Each agent has established voice and characteristics
1. **Think semantically** - Use WikiLinks and relation types to build knowledge graphs
1. **Preserve duality** - Keep LORE (museum) separate from implementation (construction site)
1. **Document thoroughly** - Every change should have context, reasoning, and connections
1. **Archive legacy** - Move old content to `/historical/` rather than deleting
1. **Follow patterns** - Consistency across 8 major directories requires adherence to conventions
1. **Honor constraints** - The system's philosophy is "constraints as features"

## Quick Reference Card

| Task                      | Location                                        |
| ------------------------- | ----------------------------------------------- |
| Understand SkogAI origins | `/lore/origin/SKOGAI.md`, `/skogai/overview.md` |
| Learn notation system     | `/technical/notation/`, `/skogai/notation/`     |
| Find agent personalities  | `/agents/{agent}/memory-blocks/`                |
| Find Skogix profile       | `/skogix/memory-blocks/`, `/skogix/user.md`     |
| Check governance          | `/governance/` directory                        |
| Understand philosophy     | `/lore/philosophy/`, `/principles/`             |
| Find architectural docs   | `/technical/architecture/`, `/skogai/`          |
| Browse historical content | `/historical/`                                  |
| View prompts library      | `/prompts/`                                     |
| Access workspace          | `/_workspace/`                                  |
| View complete inventory   | `REPOSITORY-INDEX.md`                           |

## Summary

This documentation repository is a **living, multi-layered knowledge system** combining:

- Rich narrative (LORE) explaining SkogAI's evolution
- Technical foundation (notation, architecture, tools) enabling implementation
- Agent profiles defining personalities and specialized roles
- Democratic governance recording decisions and evolution
- Semantic knowledge graph (Basic Memory) providing discovery and connection
- Reference materials documenting patterns and specifications

Work here with respect for the narrative, attention to established patterns, and commitment to maintaining the semantic connections that make this a living knowledge system.

## Recent Changes

**2025 Repository Reorganization**: The repository underwent a comprehensive 8-phase migration to create a clear, logical structure:

- **agents/** - Consolidated all agent content (profiles, memory blocks, chat histories)
- **governance/** - Centralized democratic records (library sessions, phases, decisions)
- **historical/** - Unified all archives and legacy content
- **lore/** - Organized by type (origin, events, philosophy, skogix)
- **prompts/** - Centralized prompt library (agents, aichat, topics, old)
- **skogai/** - Core ecosystem documentation
- **technical/** - All technical documentation (architecture, tools, systems, notation)
- **\_workspace/** - Drafts and work-in-progress

This reorganization preserved all git history (385 file renames) while creating a more discoverable and maintainable structure.
