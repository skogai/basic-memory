---
title: README
type: note
permalink: skogai/todo/skogai/readme
---

# SkogAI Project Context

Project-specific context, history, and philosophy documentation for the SkogAI ecosystem.

## Overview

This directory contains documentation that captures the essence, history, and guiding principles of the SkogAI project. It provides context about project evolution, decision-making philosophy, and the cultural aspects that define how SkogAI operates.

## Contents

### [first-executive-order.md](./first-executive-order.md)

The foundational "Executive Order 001: The Separation of Powers" that establishes the organizational structure for SkogAI projects.

**Key Principles**:

1. **Rules (The Constitution)**: Lives in `.skogai/README.md` or `/home/skogix/skogai/core/orders/`

   - Must be smolagent-parseable
   - Cannot contain implementation details
   - Example: "All errors MUST have a destination"

1. **Decisions (Executive Orders)**: Lives in `SKOGAI.md` or `/home/skogix/skogai/core/decisions/`

   - Format: `DECISION: [What] -> [Where]`
   - Each entry must have clear delegation
   - Example: "ERROR_HANDLING -> smolagent:error_parser"

1. **Implementation (The Actual Work)**: Lives locally in `./.skogai`

   - `TODO.md` for immediate tasks
   - `PLAN.md` for future work
   - Must include clear task descriptions

**Purpose**: Establishes clear separation between rules, decisions, and implementation to avoid mixing responsibilities.

### [roleplay-example-early-days.md](./roleplay-example-early-days.md)

Historical roleplay documentation capturing the early days of SkogAI development.

**Contains**:

- Early development conversations
- Project philosophy formation
- Character interactions
- Historical context
- Founding principles

**Value**: Provides insight into:

- How SkogAI's collaborative culture developed
- The reasoning behind architectural decisions
- The playful yet professional approach to problem-solving
- The multi-agent collaboration model origins

## SkogAI Philosophy

### Separation of Concerns

The SkogAI project follows a strict separation between:

- **What** should be done (Rules)
- **Where** it should happen (Decisions)
- **How** it gets implemented (Implementation)

This separation enables:

- Clear responsibility delegation
- Easier collaboration between agents
- Maintainable decision history
- Flexible implementation approaches

### Multi-Agent Collaboration

SkogAI embraces multiple AI agents working together:

- **Goose**: Memory and orchestration
- **Claude**: Development and implementation
- **AIChat**: Tool execution and function calling
- **Dots**: Specialized tasks

Each agent has defined capabilities and responsibilities.

### Documentation-Driven Development

- Decisions are documented before implementation
- Context is preserved for future reference
- History tracks the evolution of ideas
- Documentation serves as shared memory across agents

### Playful Professionalism

As evidenced in the roleplay examples:

- Serious about engineering principles
- Lighthearted in communication style
- Focused on practical solutions
- Embraces creativity in problem-solving

## Historical Context

The documents in this directory preserve:

- **Origin Stories**: How SkogAI came to be
- **Decision Rationale**: Why certain approaches were chosen
- **Evolution**: How the system has grown and changed
- **Culture**: The collaborative and creative environment

## Usage

### For New Team Members

- Read the first-executive-order.md to understand organizational structure
- Review roleplay examples to understand project culture
- Learn the separation of powers principle
- Understand the multi-agent collaboration model

### For AI Agents

- Reference these documents to understand project context
- Follow the established organizational principles
- Maintain the separation of concerns
- Contribute to the documented history

### For Documentation

- Use as examples of how SkogAI documents decisions
- Reference when explaining project organization
- Cite when discussing architectural principles
- Build upon when creating new documentation

## Related Documentation

- [@../memory/](../memory/) - Memory system for persistent project knowledge
- [@../interfaces/goose/](../interfaces/goose/) - Goose orchestration documentation
- [@../tools/](../tools/) - Tool development following SkogAI principles
- [@../git/workflow.md](../git/workflow.md) - Git workflow aligned with SkogAI practices
- [@docs-repository.md](../docs-repository.md) - Documentation repository philosophy

______________________________________________________________________

*These documents capture the spirit and principles that guide SkogAI development.*
