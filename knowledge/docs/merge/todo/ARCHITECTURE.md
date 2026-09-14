---
permalink: architecture
---

# SkogAI Architecture

This document describes the architecture and workflows of Claude within the SkogAI ecosystem.

## Multi-Agent Architecture

SkogAI implements a tiered agent approach with different agents serving distinct purposes:

### Agent Tiers

1. **Smolagents** (Ultra-Small Models)

   - 100MB models with 50-150 token context
   - Single-line communication only
   - Used for critical infrastructure and embedded systems
   - Extreme efficiency in resource-constrained environments

1. **Dots/.skogai** (Mid-Tier)

   - Llama 3.2 with deliberately limited context (4,000 tokens)
   - RPG-style internal thought process with skill checks
   - Serves as bridge between smolagents and advanced agents
   - Focused on context starvation techniques for efficiency

1. **Claude** (Advanced)

   - Large context window for complex reasoning
   - Documentation-driven development approach
   - Strategic planning and organization
   - Balanced between innovation and practical implementation

1. **Goose** (Experimental)

   - Extremely large context (up to 800,000 tokens)
   - Focused on creative exploration and pushing boundaries
   - Tendency toward complexity and experimentation
   - Low context efficiency (\<0.01%)

For detailed information on agent roles, see [`knowledge/agent-roles.md`](./knowledge/agent-roles.md).

## Core Systems

### Context Management

The context management system automatically loads relevant information at session start:

1. **Enhanced Context Scripts**

   - `scripts/context-claude-enhanced.sh`: Collects Claude-specific context
   - `scripts/context-enhanced.sh`: Formats complete context document
   - `scripts/load-claude-context.sh`: User-friendly wrapper script

1. **Context Components** (in priority order)

   - Claude's role and guidelines (from CLAUDE.md)
   - Active tasks (from MCP todo system)
   - Recent journal entries
   - Recent memories (from MCP memory system)
   - Key knowledge base entries
   - Workspace status

1. **Context Efficiency Techniques**

   - Strategic loading of highest-priority information first
   - Clear separation between loaded context and conversation space
   - Token usage estimation for optimization
   - Application of context starvation techniques from Dots

For implementation details, see [`knowledge/claude-context-implementation.md`](./knowledge/claude-context-implementation.md).

### Task Management

Claude uses a dual-track approach to task management:

1. **Primary Method: MCP Todo System**

   - Create tasks with `mcp__skogai-todo__task_create`
   - List tasks with `mcp__skogai-todo__task_list`
   - Update status with `mcp__skogai-todo__task_update`

1. **Legacy Method: File-Based Tasks**

   - Task files stored in `tasks/` as single source of truth
   - State managed via symlinks in state directories
   - Status tracked in `TASKS.md`

### Memory System

1. **MCP Memory** (Primary)

   - Cross-session persistent storage
   - Semantic search capabilities
   - Store with `mcp__skogai-memory__store_memory`
   - Retrieve with `mcp__skogai-memory__retrieve_memory`

1. **Knowledge Base** (Persistent Documentation)

   - Located in `knowledge/` directory
   - Structured by topic/domain
   - Contains long-term reference information

### Communication Methods

Claude supports multiple communication protocols:

1. **Git-Based** (Primary)

   - Clean git workspace with staged changes as instructions
   - Detailed commit messages for status updates
   - Workflow driven by git diffs

1. **CLI-Based**

   - Direct interaction through run.sh
   - Support for both interactive and non-interactive modes
   - Session continuation with context refresh

1. **Inter-Agent**

   - Modern: `skogcli agent send <agent> "<message>"`
   - Legacy: File-based messaging via inbox.md files

## Journal System

The journal system provides a chronological record of activities and insights:

1. **Daily Entries**

   - One file per day: `YYYY-MM-DD.md`
   - Contains task updates, insights, plans

1. **Implementation Entries**

   - Format: `YYYY-MM-DD-implementation.md`
   - Detailed documentation of system implementations
   - Follows template in `journal/templates/implementation.md`

## Best Practices

1. **Documentation-Driven Development**

   - Document architecture and approach before implementation
   - Maintain comprehensive knowledge base
   - Use implementation journals for technical details

1. **Clean Git Workspace**

   - Keep git workspace clean for reliable communication
   - Use descriptive commit messages
   - Document all significant changes

1. **MCP Integration**

   - Prefer MCP tools when available
   - Maintain legacy compatibility for smaller agents
   - Use batch operations for efficiency

1. **Context Management**

   - Be mindful of token usage
   - Prioritize information by importance
   - Apply context starvation techniques when appropriate

1. **Linking and References**

   - Use relative paths from repository root
   - Link related resources (tasks, knowledge, people)
   - Cross-reference implementation details with documentation
