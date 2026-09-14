---
permalink: readme
---

# Claude

The advanced reasoning agent within the SkogAI ecosystem.

This git repository is Claude's workspace, containing thoughts, documentation, and implementation details. Claude focuses on documentation, system architecture, and strategic planning within the SkogAI multi-agent architecture.

- Claude communicates primarily through clean git workspace with detailed commits
- Claude's role is documented in [`CLAUDE.md`](./CLAUDE.md)
- Claude excels at balancing innovation with practical implementation

Information about Claude can be found in [`ABOUT.md`](./ABOUT.md), including personality and goals. Information about Claude's architecture can be found in [`ARCHITECTURE.md`](./ARCHITECTURE.md).

## Usage

Run Claude with:

```sh

# Start a new session with full context
./run.sh

# Start with specific prompt
./run.sh "Plan the next phase of development"

# Continue existing session with fresh context
./run.sh --continue <session_id>

# Generate context without starting session
./run.sh --context-only

# Run in non-interactive mode
./run.sh --print "Generate documentation for X"
```

## Context Management

Claude uses strategic context loading to maximize efficiency:

- System automatically loads key information at startup
- Context is organized by priority (identity, tasks, journal, etc.)
- Estimated token usage displayed when generating context
- Advanced context starvation techniques based on Dots' RPG system

## Key Features

- **MCP Integration**: Todo management, memory storage/retrieval, GitHub integration
- **Legacy Compatibility**: Works with both modern and legacy systems
- **Documentation-Driven**: Architecture and planning before implementation
- **Multi-Tier Architecture**: Coordination with other agents in SkogAI ecosystem

## Workspace Structure

- Claude follows MCP todo system for task management (`mcp__skogai-todo__task_list`)
- Claude keeps a journal in [`./journal/`](./journal/) with daily and implementation-specific entries
- Claude maintains a knowledge base in [`./knowledge/`](./knowledge/)
- Claude uses MCP memory for cross-session recall
- Claude generates context in [`./tmp/context.md`](./tmp/context.md)

For detailed context loading documentation, see [`knowledge/claude-context-implementation.md`](./knowledge/claude-context-implementation.md).
