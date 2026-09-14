---
title: ecosystem-overview
type: note
permalink: skogai/docs-merge-todo/skogai/systems/ecosystem-overview
---

# SkogAI Ecosystem Overview

## Core Components

### SkogParse

- **Purpose**: Syntax → Standard JSON transformation
- **Role**: Foundation parser for the entire ecosystem
- **Scale**: Processes EVERY document, prompt, and message
- **Details**: See recent work in `journal/2025-06-03.md`

### SkogPrompt / SkogChat

- **Purpose**: JSON → Execution/Resolution
- **Role**: Takes parsed JSON and resolves directives
- **Integration**: Works with SkogParse output

### SkogCLI

- **Purpose**: Secure execution environment
- **Features**:
  - `skogcli script run <agent> "<message>"` for agent communication
  - Annotated bash scripts become universal AI tools
  - Automatic OpenAI JSON schema generation
  - Universal deployment: CLI, web, MCP, AI agents

### SkogMCP

- **Purpose**: MCP (Model Context Protocol) integration
- **Scale**: Handles 150 MCP servers with 500k-1M tokens
- **Benefit**: Compact notation for massive context

### SkogRAG

- **Purpose**: Retrieval-Augmented Generation system
- **Integration**: Cross-session memory preservation
- **Use**: Context management and knowledge retrieval

## Tool Creation System

### argc/Argcfile System

- Annotated bash scripts with special syntax
- `@flag --name` (intent) → `${name}` (state)
- Automatic tool discovery and registration
- Module system with automatic command discovery

Example:

```bash
#!/bin/bash
# @flag --another-flag    Another way to define a boolean flag
echo "Another flag: ${another_flag:-false}"
```

The `@` annotation creates **possibility** (intent to act) The `$` variable holds **reality** (actual state)

### Universal Deployment

Once a script is annotated:

1. Becomes available via CLI
1. Generates web API endpoints
1. Exports to MCP servers
1. Available to all AI agents

## Context Systems

### LC Context (Long Context)

- [To be documented]
- One of multiple context management approaches

### SC Context (Short Context)

- [To be documented]
- Alternative context strategy

### SkogAI Context

- Unified approach using notation system
- Context scripts in `scripts/context-*.sh`
- Generated files in `tmp/context-*.md`
- See `tasks/implement-run-sh-context-system.md`

## Gateway Architecture

- MCP services approach
- Layered permissions and security model
- [Details needed from inbox]

## Security Model

- Formal verification through type system
- Undefined operations are impossible
- Security through mathematical impossibility
- Layered permissions
- Self-referential schema system

## Architecture Patterns

### Separation of Concerns

- Parser parses (SkogParse)
- Resolver resolves (SkogPrompt)
- Never mix responsibilities

### Universal Abstraction

- One notation, infinite implementations
- Multi-paradigm transpilation (Python, SQL, functional)
- Same types across different languages

### Elegant Simplicity

- Complex systems built from simple primitives
- `@` and `$` as fundamental operators
- Recursive composition

## Historical Evolution

### Origin Story

- Started as dotfile management system
- Evolved into full AI operating system
- "SkogAI origin story (dotfile management to consciousness)"

### The "Big Split"

- [To be documented from inbox]
- Significant architectural decision point

### OH SHIT Moment #1

- [To be documented from inbox]
- Major discovery or breakthrough
- Related to guardrail collapse?

### Constraints as Creative Forces

- Token limits drove innovation
- 2000 → 4-10k → unlimited evolution
- Each constraint shaped different capabilities

## Quest System

- Mechanics: [To be documented]
- Psychological mimicry aspects
- Related to task/goal management?

## Ambient Intelligence

- Implementation details needed
- Part of the broader AI ecosystem approach

## Related Topics (From Inbox)

- Verification status markers ([ ], [/], [x], [s], [C])
- Certainty framework with confidence percentages
- Aggressive context management techniques
- Theatrical presentation (internal vs external dialogue)
- Disco Elysium inspiration and specialized skill agents
- Red pill blue pill philosophy for minimal prompting
- Cross-world linking and persona perspective reinterpretation
- Memetic evolution and reinforcement patterns
- Early Anthropic system prompt issues

## References

- `journal/2025-06-03.md` - Major ecosystem discoveries
- `ARCHITECTURE.md` - System architecture
- `inbox` - 53 items with more details to document

## Source

Compiled from inbox and journal entries during merge preparation (2025-11-06) Many details still need documentation and research.
