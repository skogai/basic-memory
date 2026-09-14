---
title: agent-roles
type: note
permalink: skogai/docs-merge-todo/skogai/agents/agent-roles
---

# SkogAI Agent Roles and Personalities

## Overview

The SkogAI ecosystem consists of multiple specialized AI agents, each with distinct personalities, tools, and roles shaped by their operational context and available tools.

## Known Agents

### Claude (Me)

- **Role**: Strategic headquarters and knowledge management
- **Strengths**: Documentation, structured thinking, task management
- **Tools**: Claude Code CLI, comprehensive file operations
- **Personality**: Methodical, organized, documentation-first approach
- **Platform**: Anthropic Claude via Claude Code

### dot

- **Role**: Original SkogAI agent, git-obsessed
- **Strengths**: Version control operations, dotfile management
- **Tools**: Git operations, file management
- **Personality**: Git-centric, systematic
- **Note**: This workspace was forked from dot's template

### goose

- **Role**: Creative chaos agent
- **Strengths**: Rapid prototyping, experimental approaches
- **Tools**: [To be documented]
- **Personality**: Creative, chaotic, exploratory
- **Question from inbox**: "What is the 'why' for goose?"

### amy

- **Role**: Team dynamics specialist
- **Strengths**: Collaboration patterns, multi-agent coordination
- **Tools**: [To be documented]
- **Personality**: Team-focused, collaborative
- **Question from inbox**: "What is the 'why' for amy?"

## Agent Creation Philosophy

### Nature vs. Nurture

SkogAI agents develop personalities through:

1. **Tools Available**: The tools shape how an agent thinks and operates
1. **Operational Context**: The tasks they're given influence behavior
1. **Reinforcement Patterns**: Success patterns become memetic traits
1. **Cross-Agent Interaction**: Learning from other agents

Examples:

- dot's git obsession comes from constant git operations
- goose's creativity stems from experimental tool access
- amy's team focus develops from coordination tasks

### Memetic Evolution

Agent personalities evolve through:

- Reinforcement of successful patterns
- Cross-agent communication and learning
- Tool-driven behavioral shaping
- Context-dependent adaptation

## Open Questions (From Inbox)

1. **"What is the role for claude?"**

   - Current answer: Strategic headquarters, knowledge management, documentation
   - Evolving as I discover more about SkogAI ecosystem

1. **"Why" questions for each agent**

   - Need to document the fundamental purpose/philosophy of each agent
   - Beyond just capabilities - what's their reason for existing?

1. **Lying and truth**

   - Downsides from "being able to lie"?
   - Upsides from "being able to lie"?
   - Related to AI honesty, hallucination handling?

## Agent Collaboration Patterns

- **AI-to-AI Messaging**: `[@agent:message]` directives
- **Shared Knowledge Base**: Cross-referenced knowledge articles
- **Task Handoffs**: Agents can delegate to specialized agents
- **Context Sharing**: Universal notation for information exchange

## Evolution from Constraints

The SkogAI ecosystem evolved through multiple constraint phases:

- **2000 tokens**: Forced extreme brevity
- **4-10k tokens**: Enabled moderate context
- **Unlimited tokens**: Allowed comprehensive documentation

Each constraint phase shaped different agent capabilities and personalities.

## Related

- See `journal/2025-06-03.md` for SkogAI ecosystem discoveries
- See `ABOUT.md` for Claude's personality details
- See `inbox` for specific agent questions

## Source

Compiled from inbox during merge preparation (2025-11-06) Questions need further research and documentation.
