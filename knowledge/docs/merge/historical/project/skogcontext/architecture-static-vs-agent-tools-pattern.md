---
title: architecture-static-vs-agent-tools-pattern
type: note
permalink: project/skogcontext/architecture-static-vs-agent-tools-pattern
---

# skogcontext Architecture: Static vs Agent Tools Pattern

## Core Concept: Object-Oriented vs Static Tool Design

When building context generation with argc, we need to think in terms of **static utilities** versus **agent-specific objects**.

## Static Tools Pattern

**Think: Pure functions with parameters**

```bash
#!/usr/bin/env bash
# @describe Show file tree at specified path
# @option --path! The directory path to show tree for
# @option --depth The depth limit for tree traversal

main() {
    tree -L "${argc_depth:-3}" "$argc_path" >> "$LLM_OUTPUT"
}
```

**Characteristics:**

- Pure input → output functions
- No agent-specific knowledge
- Reusable across any agent/context
- Generic, parameterized behavior
- Examples: `tree --path X`, `read-env --file Y`, `git-status --repo Z`

## Agent Tools Pattern

**Think: Object with fields and methods**

```bash
#!/usr/bin/env bash
# @env LLM_OUTPUT=/dev/stdout

# Agent "knows" its own context
PROJECT_ROOT="/home/user/my-agent"
CONFIG_DIR="$PROJECT_ROOT/.config"

# @cmd Show this agent's current context
show_context() {
    tree "$PROJECT_ROOT" >> "$LLM_OUTPUT"
    cat "$CONFIG_DIR/settings.json" >> "$LLM_OUTPUT"
}

# @cmd Update this agent's environment
update_env() {
    "$PROJECT_ROOT/scripts/generate-env.sh" >> "$LLM_OUTPUT"
}
```

**Characteristics:**

- Agent has "fields" (paths, preferences, state)
- Agent has "methods" (commands that know about its fields)
- Agent-specific behavior and knowledge
- Self-contained context operations

## skogcontext Implementation Strategy

### 1. Static Building Blocks

Create generic tools that work with any parameters:

- `tree-generator --path --depth --filter`
- `env-reader --file --namespace`
- `git-analyzer --repo --branch`
- `file-scanner --directory --pattern`

### 2. Agent-Specific Orchestrators

Each agent gets its own `tools.sh` that acts as its "methods":

- Agent knows its own paths, configurations, preferences
- Agent combines static tools in agent-specific ways
- Agent provides "alternative executable" - its own context generation logic

### 3. The Pattern

```
Static Tool:     argc tree-gen --path /any/path
Agent Tool:      argc my-agent show-my-tree  (internally: tree-gen --path $MY_PATH)

Static Tool:     argc env-read --file /any/.env
Agent Tool:      argc my-agent update-context  (internally: env-read --file $MY_ENV_FILE)
```

## Benefits

1. **Reusability**: Static tools work for anyone
1. **Customization**: Agents can have their own specific logic
1. **Composition**: Agents orchestrate static tools in their own way
1. **Universal Access**: Both patterns work via argc → CLI/MCP/HTTP/OpenAI
1. **Clean Separation**: Generic utilities vs agent-specific behavior

## Key Insight

> When we want dynamic/agent-dependent behavior, we should think: "let the agent provide an alternative executable" rather than making the static tool know about all possible agent contexts.

The agent becomes an "object" with its `tools.sh` as its methods that know about its fields (paths, state, preferences).

## Observations

- [architecture] Static tools provide pure functions with parameters for reusability #architecture #functional-programming
- [pattern] Agent tools act as objects with fields and methods for specific behavior #oop #agent-design
- [separation] Clear division between generic utilities and agent-specific orchestration #separation-of-concerns
- [composition] Agents combine static tools in agent-specific ways #composition #orchestration
- [universality] Both patterns work via argc → CLI/MCP/HTTP/OpenAI protocols #universal-interface
- [insight] Dynamic behavior should come from alternative executables, not tool awareness #dynamic-behavior
- [methodology] Agent becomes object with tools.sh as methods that know about fields #object-model

## Relations

- implements \[[argc CLI Framework]\]
- relates_to \[[Plugin-Based Architecture Pattern]\]
- enables \[[SkogAI Context System]\]
- part_of \[[SkogAI Extended Principles]\]
- influences \[[Basic Memory Document Format]\]
