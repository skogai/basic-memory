---
title: forking-workspace
type: note
permalink: skogai/docs-merge-todo/principles/forking-workspace
---

# Workspace Structure for Forkable Agents

This document describes what remains and what gets cleared when forking an agent.

## Directory Structure Overview

```tree
.
├── README.md               # Overview (template remains, content updated)
├── ABOUT.md               # Agent identity (cleared and customized)
├── ARCHITECTURE.md        # System architecture (remains)
├── TOOLS.md               # Tool integrations (remains)
├── gptme.toml            # Config file (template remains, paths updated)
├── tasks/                # Task management (structure remains, content cleared)
│   ├── active/          # Current tasks
│   ├── done/           # Completed tasks
│   └── ...             # Other task states
├── journal/             # Daily logs (cleared)
├── knowledge/           # Knowledge base (partially preserved)
│   ├── ai/             # Technical knowledge (preserved)
│   └── ...             # Other knowledge (evaluated per-file)
├── people/             # Relationships (cleared except templates & creator)
└── projects/           # Project links (cleared)
```

## What Stays

1. **System Structure**

   - Directory layout
   - Task management system
   - Documentation templates
   - Tool configurations

1. **Core Documentation**

   - ARCHITECTURE.md
   - Technical designs
   - Tool integration guides
   - Best practices

1. **Technical Knowledge**

   - AI/ML concepts
   - System architecture
   - Tool usage patterns

## What Gets Cleared

1. **Personal Content**

   - Journal entries
   - Task content
   - Project links
   - Agent-specific knowledge

1. **Identity**

   - ABOUT.md
   - Visual identity
   - Social media presence
   - Personal profile

1. **Relationships**

   - People profiles (except creator)
   - Interaction history

## Fork Creation Steps

1. Copy workspace structure
1. Clear personal content
1. Initialize new identity
1. Update configurations
1. Create first task

For detailed forking process, see [`agent-forking.md`](../knowledge/agent-forking.md).
