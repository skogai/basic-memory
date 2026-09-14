---
title: How to Use gh-skogai-submodule
type: note
permalink: tools/how-to-use-gh-skogai-submodule
---

# How to Use gh-skogai-submodule

A comprehensive guide to using the SkogAI GitHub CLI extension for dynamic submodule management with AI agent support.

## Overview

The `gh-skogai-submodule` extension enables dynamic add/work/remove workflows for temporary repository access, perfect for AI agents and developers who need to quickly work on issues across multiple repositories without polluting the main project structure.

## Current Features (v0.0.3)

### ✅ Smart Branch Detection

- Automatically detects and uses `develop` branch for SkogAI repos (git-flow compatible)
- Falls back to `main` then `master` for other repositories
- Perfect for git-flow development workflows

### ✅ AI Agent Compatibility

- `--no-interactive` mode for programmatic use
- `--json` output for machine parsing
- `--batch` processing without confirmation prompts

### ✅ Dynamic Workflow Support

- `.gitmodules` is ignored in parent repo (no commit pollution)
- Auto-unstages `.gitmodules` to prevent accidental commits
- Clean temporary workspace management

### ✅ Repository Discovery

- Smart API endpoint fallback (tries org endpoint first for private repos, falls back to user endpoint for public)
- Discovers up to 144+ repositories vs basic 60 limit

## Installation

```bash
gh extension install SkogAI/gh-skogai-submodule
```

## Basic Usage

### Add Submodules

```bash
# Interactive mode (human-friendly)
gh skogai-submodule --org SkogAI --search "."

# AI Agent mode (programmatic)
gh skogai-submodule --org SkogAI --search "." --no-interactive --json --dryrun

# Add specific repositories
gh skogai-submodule --org SkogAI --csr "repo1,repo2,repo3" --no-interactive

# Search with regex filter
gh skogai-submodule --org SkogAI --search "tool" --regexp "^skog.*" --no-interactive
```

### Key Flags

| Flag               | Description                          | AI Agent Friendly |
| ------------------ | ------------------------------------ | ----------------- |
| `--org <org>`      | Organization name                    | ✅ Required       |
| `--search <query>` | Search query (use "." for all repos) | ✅                |
| `--csr <repos>`    | Comma-separated repo list            | ✅                |
| `--no-interactive` | Skip interactive selection           | ✅ Essential      |
| `--json`           | JSON output format                   | ✅ Essential      |
| `--batch`          | Process without confirmation         | ✅                |
| `--dryrun`         | Show what would be done              | ✅                |

## Dynamic Development Workflow

### The Complete Cycle

```bash
# 1. Add repository temporarily
gh skogai-submodule --org SkogAI -s some-repo

# 2. Enter and start development
cd some-repo
git flow feature start fix-something

# 3. Work on the issue
# ... make changes, commit, push ...

# 4. Clean up when done
cd ..
git submodule deinit some-repo
rm -rf some-repo
```

### AI Agent Integration

```bash
# Get all SkogAI repos as JSON
gh skogai-submodule --org SkogAI --search "." --no-interactive --json --dryrun

# Example JSON output:
# [
#   {
#     "org": "SkogAI",
#     "repo": "tools", 
#     "url": "https://github.com/SkogAI/tools",
#     "action": "dryrun"
#   }
# ]
```

## Smart Branch Detection in Action

When you run the extension on SkogAI repositories:

```bash
gh skogai-submodule --org SkogAI -s gh-skogai-submodule
```

Output shows the smart detection:

```bash
git submodule add --branch develop https://github.com/SkogAI/gh-skogai-submodule
```

The `.gitmodules` entry automatically includes:

```ini
[submodule "gh-skogai-submodule"]
	path = gh-skogai-submodule
	url = https://github.com/SkogAI/gh-skogai-submodule
	branch = develop
```

## Configuration

### Set Default Organization

```bash
gh skogai-submodule --org SkogAI --default
```

Configuration is stored in GitHub CLI config under `skogai-submodule.default-org`.

## Advanced Usage

### Repository Discovery Modes

The extension uses smart fallback for maximum repository visibility:

1. **Org Endpoint First** (`/orgs/{org}/repos`):

   - Includes private repositories if authenticated
   - Used when user has org membership or admin access

1. **User Endpoint Fallback** (`/users/{org}/repos`):

   - Public repositories only
   - Used when org endpoint fails or is unavailable

### Fork Handling

```bash
# Include all repositories (default)
gh skogai-submodule --org SkogAI --fork "true"

# Only forks
gh skogai-submodule --org SkogAI --fork "only"

# No forks
gh skogai-submodule --org SkogAI --fork "false"
```

## Best Practices

### For AI Agents

- Always use `--no-interactive --json` for programmatic access
- Use `--dryrun` first to see what will be added
- Check JSON output for empty results before proceeding

### For Developers

- Set default org with `--default` to speed up workflows
- Use search patterns to find specific repositories
- Remember that `.gitmodules` changes stay local (ignored)

### For Dynamic Workflows

- Always clean up with `git submodule deinit` when done
- Perfect for temporary "fix this issue" scenarios
- No permanent changes to main project structure

## Troubleshooting

### Common Issues

**"No organization specified"**

- Use `--org` flag or set default with `--default`

**"No repositories found"**

- Check organization name and access permissions
- Try different search terms or use `--search "."` for all repos

**"Git directory conflict"**

- Clean up with `git submodule deinit <name>` and `rm -rf <name>`
- Remove cached modules: `rm -rf .git/modules/<name>`

### Git Credential Lock Errors

```bash
fatal: unable to get credential storage lock in 1000 ms: File exists
```

- Usually resolves automatically after a few seconds
- Kill hanging git processes if persistent: `pkill git`

## Current Status

- ✅ **v0.0.3 Released**: Smart branch detection + auto-unstage fix
- 🎯 **Next**: Submodule removal functionality (`--remove` flag)
- 🎯 **Future**: Enhanced cleanup and batch operations

## Function Signature

```bash
gh_skogai_submodule(
  org: string,
  search?: string,
  regexp?: string, 
  csr?: string,
  no_interactive: boolean = true,
  json: boolean = true,
  dryrun?: boolean,
  batch?: boolean
) -> JSON[] | submodule_operations
```
