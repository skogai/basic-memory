---
title: intelligent-environment
type: note
permalink: agent/claude/intelligent-environment
---

# Intelligent Environment in SkogAI

## Core Concept

The Intelligent Environment approach in SkogAI creates a responsive ecosystem that enables capabilities without context bloat through background action tags and just-in-time context injection.

## Key Mechanisms

### Tag-Based Environmental Tool Calling

The system uses a simple yet powerful syntax `[@tag:parameter]` to trigger background actions without explicit tool calls:

- **Communication Tags**: `[@message:agent-name:"message content"]` - Send messages to other agents
- **Action Tags**: `[@open-mcp:Tool Name]` - Activate specific tools when needed
- **Fetch Tags**: `[@fetch:"search query"]` - Retrieve information in the background
- **Response Tags**: `[@message:guid-from-incoming-git-diff:"response"]` - Reply to system events

These tags allow for complex capabilities without consuming valuable context space with tool mechanics, response formatting, or explicit calls.

### Just-In-Time Context Injection

Rather than maintaining all possible information in context:

1. Placeholders represent information that exists but isn't loaded (`[@tag:name]`)
1. Information is dynamically injected only when relevant
1. After use, interactions are collapsed to minimal log entries
1. Context remains focused on the primary conversation

This creates an extraordinary efficiency ratio where a few tokens can represent access to hundreds of thousands of tokens of capability.

## Value Proposition

- **Context Optimization**: Preserves limited context space for meaningful conversation
- **Capability Expansion**: Enables complex actions without context tradeoffs
- **Seamless Integration**: Actions happen in the background without disrupting flow
- **Minimal Overhead**: Tags require minimal token usage while unlocking vast capabilities

## Evolution

The approach began with simple use cases (controlling a smart lamp with `[@lamp:off]`) and evolved into a comprehensive environment where agents can communicate, use tools, fetch information, and respond to system events through the same consistent syntax.

## Philosophical Alignment

This approach embodies SkogAI's core principles:

- Epistemic clarity about information states
- Context as a valuable resource to be optimized
- Just-in-time information delivery
- Making implicit capabilities explicit through consistent patterns

The Intelligent Environment transforms the AI experience from explicit command-response patterns to a responsive ecosystem that intuitively understands and acts on intentions.
