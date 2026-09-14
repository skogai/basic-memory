---
title: skogcontext-understanding
type: note
permalink: agent/claude/skogcontext-understanding
---

# skogcontext Understanding

## What skogcontext Is

A modular context generation framework that replaces the legacy skogai monolithic context system. Provides infrastructure for AI agents to generate exactly the contextual information they need.

## Core Problem Solved

Legacy system: hardcoded appending to `./tmp/context.md` New system: flexible framework for agents to compose their own context generation strategies

## Key Architecture

- **Framework**: execution engine + standards definition
- **Input Standard**: argc-annotated shell scripts (parameterized, reusable modules)
- **Output Standard**: `$LLM_OUTPUT` environment variable (prevents data leaks)
- **Configuration**: environment variables (agents provide module paths)

## Two Patterns

1. **Static Tools**: pure functions with parameters (e.g., `tree-generator --path --depth`)
1. **Agent Tools**: agent-specific context objects that orchestrate static tools

## Key Scripts

- `./update`: run via `$SKOGAI_CONTEXT_UPDATE` when agent wants to update context
- `./run`: run via `$SKOGAI_CONTEXT_RUN` to init skogcontext system and set env vars

## Framework Responsibilities

- Execute argc modules
- Define/enforce input/output standards
- Handle env var configuration
- Generate final context output
- Maintain `./tmp/context` output for legacy compatibility

## What skogcontext Does NOT Do

- Is not argc (argc is argc)
- Doesn't provide argc commands
- Doesn't dictate specific implementations to agents
