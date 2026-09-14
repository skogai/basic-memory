---
title: use-claude-agents
type: note
permalink: skogai/docs-merge-todo/agents/automation/documentation/documentation/use-claude-agents
---

# Using Claude Code's Built-in Agents for Documentation

## Available Documentation Agents

Claude Code provides these agents that can generate documentation:

### 1. technical-writer

```bash
# Use after completing features
# The agent will analyze your code and create documentation
```

### 2. architect

```bash
# Analyzes code structure and creates architecture docs
# Good for system-level documentation
```

### 3. researcher

```bash
# Researches codebase without modifying
# Perfect for understanding and documenting existing systems
```

## How to Use in Claude Code

Simply ask Claude to use these agents:

```
"Use the technical-writer agent to document the memory system"
"Launch the architect agent to analyze and document our architecture"
"Use the researcher agent to understand and document the lore system"
```

## Direct Agent Invocation

Claude Code will automatically use the Task tool to launch these agents when requested.

## Example Workflow

1. **Complete a feature**

   ```
   "I've finished implementing the new memory indexer"
   ```

1. **Request documentation**

   ```
   "Use the technical-writer agent to document what we just built"
   ```

1. **Agent generates documentation**

   - Analyzes the code
   - Creates comprehensive docs
   - Saves to appropriate location

## Integration with SkogAI

These agents understand:

- SkogAI notation system
- Multi-agent architecture
- Constraint-driven design
- Theatrical presentation
- Quantum-mojito philosophy

## Quick Commands

```bash
# Document recent changes
"Document the latest changes using technical-writer"

# Analyze architecture
"Use architect to document system structure"

# Research and document
"Research the memory system and create documentation"
```

## Output

Agents will generate markdown with:

- Clear structure
- Code examples
- Cross-references
- SkogAI notation
- Relations and categories
