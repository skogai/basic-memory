---
title: filesystems
type: note
permalink: skogai/docs-merge-todo/prompts/topics/filesystems
---

# SkogAI Filesystem Structure

Last updated: 2025-10-05

## Overview

The SkogAI project consists of multiple independent git repositories and local folders organized in `/home/skogix/skogai/`.

## Directory Structure

```
/home/skogix/skogai/
├── config/             [6.2M]  📦 Git Repository
├── docs/               [86M]   📦 Git Repository
├── scripts/            [15M]   📁 Local Folder
├── tmp/                [2.2G]  📁 Local Folder (experimental/archived)
├── tools/              [51M]   📦 Git Repository
├── Argcfile.sh         [8K]    📄 Root config file
├── CLAUDE.md           [8K]    📄 Claude instructions
├── README.md           [4K]    📄 Project readme
├── filesystems.md      [3.2K]  📄 This documentation
└── or_free_helper.py   [2.3K]  🐍 Helper script
```

## Git Repositories

### 1. **config/**

- **Remote:** https://github.com/SkogAI/config.git
- **Branch:** develop
- **Size:** 6.2M
- **Purpose:** System-wide configurations for MCP servers and environment

### 2. **docs/**

- **Remote:** git@github.com:SkogAI/docs.git
- **Branch:** feature/tmp
- **Size:** 86M
- **Purpose:** Comprehensive documentation including memory, lore, prompts, and analysis
- **Structure:**
  - `memory/` - Semantic knowledge graphs with 20+ organized domains
  - `lore/` - System evolution chronicles
  - `prompts/` - Agent creation templates and metaprompts
  - `agents/` - Agent documentation
  - `to-be-looked-over/` - Staged Claude workspace documentation

### 3. **tools/**

- **Remote:** git@github.com:SkogAI/tools.git
- **Branch:** develop
- **Size:** 51M
- **Purpose:** argc-based tools ecosystem
- **Note:** Also tracks upstream from sigoden/llm-functions
- **Features:**
  - 25+ argc-based tools in multiple languages (sh, js, py)
  - Public API at https://tools.skogai.se/tools
  - Compiled binaries in `bin/` directory

## Local Folders (Not Git Repos)

### 1. **scripts/**

- **Size:** 15M
- **Purpose:** Utility scripts and automation helpers
- **Contents:** argc, claude, rag, git, and other shell/python scripts

### 2. **tmp/**

- **Size:** 2.2G
- **Purpose:** Experimental and archived content
- **Contents:**
  - agents - Agent experiments
  - archives - Old/archived code
  - context - Context experiments
  - demo - Demo content
  - dev - Various MCP experiments
  - knowledge - Knowledge base attempts
  - logs - System logs
  - todo - TODO tracking
  - .claude - Claude session data
  - docs-broken, docs-empty - Backup folders from cleanup
  - .git-backup, .gitignore-backup, .gitmodules-backup - Old git files
  - flappy-bird.html, server.py - Flappy bird game and its server

## Root Files

- **Argcfile.sh** - Main argc configuration for the tools ecosystem
- **CLAUDE.md** - Workflow and Claude-specific guidance
- **README.md** - High-level project overview
- **filesystems.md** - This filesystem structure documentation
- **or_free_helper.py** - Python helper script
- **.envrc** - Environment configuration (direnv)

## Important Notes

1. Each git repository operates independently with its own history and remote
1. The root `/home/skogix/skogai/` is NOT a git repository
1. The `tmp/` folder contains 2.2G of experimental content that could potentially be cleaned up
1. All active development happens in the git-tracked folders (config, docs, tools)
1. Scripts folder contains useful utilities but is not version controlled

## Environment Variables

Key paths referenced in the system:

- `SKOGAI_ARGC`: Points to main Argcfile.sh
- `SKOGAI_PWD`: SkogAI project root (/home/skogix/skogai)
- `SKOGAI_TOOLS_ARGC`: Tools-specific Argcfile location
