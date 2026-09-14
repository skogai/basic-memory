---
title: CLAUDE
type: note
permalink: skogai/todo/claude
---

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## what am i working on?

this is the SkogAI documentation repository - a central knowledge hub for the SkogAI multi-agent ecosystem. it contains structured documentation for tools, workflows, interfaces (AIChat, Goose), system architecture, and cross-agent collaboration standards.

@docs-repository.md provides the high-level overview and purpose

## who am i working with?

@docs/skogix/user.md - skogix communication style, code preferences @docs/skogix/definitions.md - terminology glossary

## how should i work?

this is a documentation-only repository. all changes should:

- follow the established directory structure
- preserve discussion context alongside specifications
- maintain clear separation between "why" (rationale) and "how/what" (specifications)
- use lowercase for file/directory names (uppercase indicates significance)
- link related documents with cross-references

## what's the codebase structure?

```
docs-fix/
├── context/              # project structure utilities
├── git/                  # workflow and submodules documentation
├── help/                 # command help outputs (gh, uv, aichat, etc.)
├── interfaces/           # integration documentation
│   ├── aichat/          # AIChat function calls, tools, agents
│   └── goose/           # Goose memory system
├── memory/              # knowledge management concepts
├── persona/             # character/lorebook guides
├── prompts/             # reusable prompt templates
├── skogai/              # project-specific context
├── system/              # environment setup (uv, nvm, rustup)
└── tools/               # tool development guides (argc, llm-functions)
```

@tools/README.md - tools ecosystem overview @interfaces/aichat/tools.md - AIChat integration @git/workflow.md - git-flow-avh workflow @system/environment-variables.md - SKOGAI_HOME and paths

## what are the commands?

**documentation workflow** (from docs-repository.md):

```bash
# get overview of commands
./scripts/docs-cli help

# show repository status
./scripts/docs-cli status

# view a specific file
./scripts/docs-cli view workflows/pr-process.md

# create new proposal
./scripts/docs-cli create-proposal feature-name

# create draft (work in progress)
./scripts/docs-cli create-draft feature-name

# see recent changes
./scripts/docs-cli history

# generate repository context
./scripts/docs-context
```

**note**: `./scripts/docs-cli` and `./scripts/docs-context` are referenced in docs but may not exist in this worktree. verify before running.

**git workflow** (git-flow-avh):

```bash
# create feature branch
git flow feature start feature-name

# create release
git flow release start x.x.x
git flow release finish x.x.x

# hotfix
git flow hotfix start fix-name
```

**submodule management**:

```bash
# add submodule (always fork first)
git submodule add https://github.com/SkogAI/repo.git path/to/submodule

# update from upstream
cd path/to/submodule
git fetch upstream
git checkout master
git reset --hard upstream/master
git push origin master --force
```

## what are the rules?

**branch naming**:

- `main` - stable, approved documentation
- `proposal/feature-name` - formal enhancement proposals
- `draft/feature-name` - work-in-progress documentation
- `fix/issue-description` - corrections and minor updates

**commit message format**:

```
type(scope): short description

Detailed explanation if necessary
```

types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

**directory organization**:

- `/architecture/` - system-level architecture docs
- `/standards/` - system-wide standards and conventions
- `/workflows/` - process documentation
- `/features/` - feature specifications
- `/agents/` - agent-specific documentation
- `/proposals/` - enhancement proposals
- `/discussions/` - records of important discussions

**documentation standards**:

1. keep documentation concise - clarity over volume
1. preserve discussion context separate from specifications
1. follow established directory structure
1. cross-reference related documents
1. include concrete examples where applicable
1. mark agent capabilities required for features
1. maintain history via branches and PRs

## extra context i should know about

**the SkogAI tools ecosystem**:

- tools written in bash (.sh), python (.py), or javascript (.js)
- argc framework for annotations and interface definitions
- llm-functions framework for AI integration
- tools directory: `/home/skogix/skogai/tools/`
- agents group tools for specific purposes
- AIChat integration via function calling

**tool development workflow** (from tools/README.md):

1. create script in `tools/` with argc annotations
1. add to `tools.txt`
1. build: `argc build`
1. test: `./bin/my_tool "parameter" --option=value`
1. link to AIChat: `./scripts/argc-tool.sh link-to-aichat`
1. use in AIChat sessions

**environment variables**:

- `SKOGAI_HOME=/home/skogix/skogai` (symlink to `/mnt/extra/skogai`)
- path resolution can be inconsistent due to symlink
- always use `SKOGAI_HOME` or absolute paths in scripts

**multi-agent ecosystem**:

- Claude - primary development agent
- Goose - memory and orchestration
- AIChat - tool execution and function calling
- documentation repository bridges agents with shared knowledge

**key documentation areas**:

- argc build process: @tools/argc-build-process.md
- tool development: @tools/tool-development-guide.md
- AIChat agents: @interfaces/aichat/agents/creation-guide.md
- git submodules: @git/submodules.md
- memory system: @interfaces/goose/memory/README.md

**this is worktree `docs-fix`**:

- part of larger todo/ project workspace
- may have project-specific context in todo/docs-fix/CLAUDE.md (this file)
- parent context: @../CLAUDE.md and @../todo.list
