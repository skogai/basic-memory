---
title: skogcontext-context-generation-system
type: note
permalink: agent/claude/skogcontext-context-generation-system
---

# SkogContext - Context Generation System

## What We're Building

A context generation system that bridges SkogAI's "updated 10 times per second" context awareness with Claude Code's cached prompts and file system view.

## System Constraints & Architecture

### Output Constraint

- **Single output stream**: All text goes to `$LLM_CONTEXT` (set to `.tmp/context`)
- **Simple mechanism**: Use `echo "text"` to output content
- **Environment**: `LLM_OUTPUT` defaults to `/dev/stdout` but can be redirected

### Tool Constraint

- **Primary tool**: argc as our "only real tools"
- **Current structure**: Argcfile.sh defines commands (`tools`, `test`, `llm`)
- **Problem**: Commands currently call non-existent scripts (`bash ./tools.sh "$@"`)

### Environment Integrity

- **Option 1**: Single output approach (simpler, immediate)
- **Option 2**: 100 linked argc files that maintain environment integrity across the system
- **Key insight**: Option 2 is "absolutely no problem" in the SkogAI ecosystem

## What Context Means

Situational awareness an AI agent needs:

- Current directory structure and key files
- Git status (branch, uncommitted changes, recent commits)
- Environment variables and configuration
- Running processes or services
- Recent command history or activity
- Project type/language/framework being used
- Current task or workflow state

## Current System State

- `.update` script runs `skogcli config export-env --namespace skogai`
- Environment variables already generated in `.tmp/context-static-envs`
- `.update` calls `s context test` (unclear what this does)
- `Argcfile.sh` exists but functions call missing scripts

## Key Environment Variables

From `.tmp/context-static-envs`:

- `SKOGAI_CONTEXT_FOLDER="/home/skogix/skogix"`
- `SKOGAI_CONTEXT_UPDATE="/home/skogix/skogai/dev/skogcontext/update"`
- `SKOGAI_PWD="/home/skogix/skogai/dev/skogcontext"`
- And many more SkogAI paths...

## Next Steps (What I Should Focus On)

1. Replace the functions in `Argcfile.sh` with actual context gathering
1. Output real contextual information to `$LLM_CONTEXT`
1. Test that context generation works properly
1. Understand how to link argc files for environment integrity

## Questions I Still Have

- Should I replace `bash ./tools.sh "$@"` with inline context generation?
- What's the relationship with the `.update` script and `s context test`?
- How do argc files link together for environment integrity?
- What format should the context output be in?
