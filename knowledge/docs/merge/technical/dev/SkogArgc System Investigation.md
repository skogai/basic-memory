---
title: SkogArgc System Investigation
type: note
permalink: dev/skog-argc-system-investigation
---

# SkogArgc System Investigation

## Overview

Investigation of skogargc system components as referenced in environment variables.

## Status

- **Current location**: Directory missing from `/home/skogix/skogai/skogargc/`
- **Backup location**: Found in `/home/skogix/skogai-backup/skogargc/`
- **Environment variable**: `SKOGARGC=/home/skogix/skogai/skogargc/docs/skogix.sh`

## Purpose

Comprehensive argc demo and reference implementation showing CLI best practices.

## Directory Structure

```
skogargc/ (backup)
├── Argcfile.sh (8,637 bytes)
├── docs/
│   ├── skogix.sh (780 bytes)
│   ├── Argcfile.sh (1,523 bytes)
│   ├── argc-cheat.md
│   ├── argc-forwarding-pattern.md
│   └── git-flow/
├── examples/
├── logs/
└── configuration files (*.json)
```

## Core Components

### Main Argcfile.sh

- Git-flow wrapper commands
- Parent Argcfile forwarding via `argc --argc-run ../Argcfile.sh`
- Environment variables: `SKOGAI_PWD`, `LLM_OUTPUT`
- Command structure: `demo()`, `flow()`, `flow::init()`, `flow::feature()`, etc.

### docs/skogix.sh

- Parent Argcfile path discovery via `parent_argcfile()`
- Forwarding mechanism: `argc --argc-run "$parent" "${argc_args[@]}"`
- Completion support through `_choice_skogix_args()`

## Argc Pattern Demonstrations

### Flag Types

- `@flag -v --verbose` - Simple boolean
- `@flag -f --force*` - Multi-use counter
- `@flag --debug $DEBUG` - Environment binding

### Option Types

- `@option -o --output <FILE>` - Single value with completion
- `@option -t --type[json|yaml|xml]` - Constrained choices
- `@option --tags*,` - Multi-value comma-separated
- `@option --token $$` - Auto-bind to TOKEN env var

### Argument Types

- `@arg input!` - Required positional
- `@arg output=default.txt` - Optional with default
- `@arg files*` - Multi-value array
- `@arg action[build|test|deploy]` - Constrained choices

### Dynamic Features

- `@arg action[`\_choices_func`]` - Choices from function
- `@arg output=`\_default_func\`\` - Computed default
- `@arg files <FILE+>` - One or more files
- `@arg extras~` - Capture remaining args

## Integration Features

- Nested command groups: `demo::advanced::functions()`
- Command aliases: `@alias fc,func-choice`
- Environment integration with dotenv support
- Git-flow workflow integration

## Files Found

- Core documentation: README.md, CLAUDE.md, QWEN.md
- Configuration: age.json, greet.json, hash.json, text.json, output.json
- Scripts: argc-forward.sh, my-skogai-script.sh, git-flow.sh
- Examples: SKOGPARSE_EXAMPLE.txt, LLM.txt
- Environment: .envrc

## Assessment

Educational/development tool for argc CLI patterns. Not core infrastructure but reference implementation for command-line interface creation in bash.
