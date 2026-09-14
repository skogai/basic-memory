---
title: Hidden .skogai Subdirectories Investigation
type: note
permalink: dev/hidden-skogai-subdirectories-investigation
---

# Hidden .skogai Subdirectories Investigation

## Overview

Investigation of hidden `.skogai` directories found throughout the SkogAI system.

## Discovered Locations

1. `/home/skogix/skogai/.skogai/` - Main system configuration
1. `/home/skogix/skogai/tools/.skogai/` - Tools quick reference
1. `/home/skogix/skogai/docs/memory/.skogai/` - Memory system configuration

## Directory Analysis

### Main System (.skogai/)

**Purpose**: Central system documentation and configuration

#### Key Files

- `plan.md` (3.5KB) - System investigation plan (current document)
- `argc.md` (3KB) - argc CLI framework documentation
- `bash.md` (2.3KB) - Bash scripting guidelines
- `envs.md` (4.7KB) - Environment variable documentation
- `skogcli.md` (6.9KB) - SkogCLI tool documentation
- `skogparse.md` (2.9KB) - SkogParse notation system
- `skogai-notation.md` (1.4KB) - SkogAI computational phenomenology
- `user.md` (2.2KB) - User context and preferences
- `definitions.md` (1.1KB) - System definitions
- `environment-variables.md` (357 bytes) - Env var reference
- `skogix.md` (171 bytes) - User identity
- `todo.md` (8 bytes) - Basic todo tracker

#### Subdirectories

- `argc/` - argc CLI framework resources
- `claude/` - Claude-specific configurations

#### Scripts

- `run-claude` - Claude execution script (231 bytes)
- `update` - System update script (21 bytes)

### Tools (.skogai/)

**Purpose**: Tools directory quick reference guide

#### Content

- `tools.md` (1.3KB) - Created during this investigation
- Contains argc commands, file structure, integration points
- Environment variable: `SKOGAI_ARGC=/home/skogix/skogai/tools/Argcfile.sh`

### Memory (.skogai/)

**Purpose**: Memory system configuration and context

#### Key Files

- `CLAUDE.md` (6.9KB) - Claude-specific memory instructions
- `compact.md` (3.4KB) - Compact representation guidelines
- `users-pov.md` (13.5KB) - User perspective documentation
- `what-should-be-in-real-and-quoted-context.md` (7.2KB) - Context guidelines
- `output.txt` (25KB) - System output logs
- `sniffed-packets.json` (4.4KB) - Network packet data
- `settings.local.json` (104 bytes) - Local configuration

#### Scripts

- `claude` - Claude execution script (192 bytes)

## Patterns and Purpose

### Configuration Management

Each `.skogai` directory serves as a:

- Local documentation hub
- Quick reference center
- Configuration storage
- Script execution point

### Documentation Strategy

- **Main**: System-wide documentation and planning
- **Tools**: Component-specific quick references
- **Memory**: Context and operational guidelines

### Integration Points

- Environment variable references
- Executable scripts for system interaction
- JSON configuration files
- Markdown documentation standards

## File Size Distribution

- Large docs: plan.md (3.5KB), envs.md (4.7KB), skogcli.md (6.9KB)
- Medium docs: argc.md (3KB), bash.md (2.3KB), skogparse.md (2.9KB)
- Small references: definitions.md (1.1KB), user.md (2.2KB)
- Micro files: todo.md (8 bytes), skogix.md (171 bytes)

## Status

All three `.skogai` directories operational with complete documentation coverage of their respective system components.
