---
title: Agent Delegation - Learning from Failure
type: note
permalink: sessions/agent-delegation-learning-from-failure
---

# Agent Delegation - Learning from Failure

## The Problem (2025-10-17)

Tried to delegate command-toolkit skill creation to an agent. It made 50+ tool calls searching randomly and never actually built anything.

## Root Cause: Prescriptive Instructions Without Context

The prompt told the agent HOW to do things (Step 1, Step 2...) but didn't give it the CONTEXT to understand what any of it meant.

## Key Insight from User Feedback

> *you should not tell the agents how to do things, only what you want to happen*

But more specifically: **Agents have ZERO shared context**

## What the Agent Saw (Annotated)

```
Create a comprehensive command-toolkit skill...

The skill should follow the skill-creator process...
[Agent: "What is a skill-creator?"]

**Step 1 - Concrete Examples:**
[Agent: "These are great things to know! When will you tell me about it?"]

**Step 2 - Reusable Resources:**
- Scripts: create_command.py, validate_command.py
[Agent: "What do you mean scripts? I am doing commands?"]

**Step 3-4 - Implementation:**
- Write comprehensive SKILL.md
[Agent: "WHAT IS THAT?! WHERE SHOULD I PUT IT?"]

Base the patterns on the command-expert agent documentation I just activated...
[Agent: "YOU ACTIVATED! HOW WOULD I KNOW WHERE TO LOOK?"]

...which uses Markdown files in .claude/commands/ with specific structure.
[Agent: "FINALLY A PATH! But there are no files there :("]
```

## The Failure Pattern

1. **Assumed shared context** - Agent doesn't know about "skill-creator process"
1. **Used undefined terms** - "scripts", "references", "assets" mean nothing without examples
1. **Referenced invisible actions** - "I just activated" is meaningless to agent
1. **Gave steps without foundations** - Can't follow process it doesn't understand
1. **No concrete paths** - Agent spent 20+ searches trying to find what I was talking about

## The Fix: Outcome + Context + Examples

**Instead of**: "Follow the skill-creator process with Step 1, Step 2..."

**Do this**:

```
Create a command-toolkit skill for managing slash commands.

Read ~/.claude/skills/skill-creator/SKILL.md to understand how to create skills.

Look at ~/.claude/skills/agent-toolkit/ as a working example of skill structure.

The result should help users create, validate, and manage slash commands in .claude/commands/
```

## Delegation Principles Discovered

1. **Paths > Concepts** - "~/.claude/agents/foo.md" beats "the agent I activated"
1. **Examples > Explanations** - "Look at X" beats "X has features Y and Z"
1. **Outcomes > Processes** - "Create X that does Y" beats "Step 1, Step 2, Step 3"
1. **Context = Success** - Agent needs to know WHERE to find information

## Template for Proper Delegation

```
[OUTCOME] Create/Build/Design [WHAT]

[CONTEXT] Read [EXACT_PATH] to understand [CONCEPT]

[EXAMPLES] Look at [EXACT_PATH] for reference

[CONSTRAINTS] The result should [SPECIFIC_MEASURABLE_OUTCOME]
```

## Observations

- [failure] Prescriptive instructions without context cause analysis paralysis #delegation
- [learning] Agents need explicit paths to resources, not references to past actions #context
- [discovery] "What to achieve" + "where to find help" beats "how to do it" #orchestration
- [pattern] Good delegation = outcome + context + examples + constraints #template

## Relations

- updates \[[Tooling Layers - Complete Inventory]\]
- informs \[[Orchestration Best Practices]\]
- learned-from \[[Agent Toolkit Skill - Creation and Deployment]\]

______________________________________________________________________

*Session: 2025-10-17, learning from 50+ tool call failure*
