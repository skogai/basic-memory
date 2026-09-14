---
title: README
type: note
permalink: skogai/todo/git/readme
---

# Git Workflow Documentation

Documentation for Git workflows, submodule management, and version control practices in the SkogAI ecosystem.

## Overview

This directory contains comprehensive documentation for managing Git repositories, submodules, and collaborative development workflows using git-flow-avh.

## Contents

### [workflow.md](./workflow.md)

Complete guide to the SkogAI Git workflow including:

- **Branch Structure**: Core branches (master, develop, main) and supporting branches (feature, release, hotfix)
- **Commit Message Format**: Standardized commit message conventions
- **Release Process**: Step-by-step release management
- **Git-Flow AVH Configuration**: Setup and configuration guidelines
- **Conflict Resolution**: Best practices for handling merge conflicts
- **Fork Management**: Contributing to external projects

**Key Practices**:

- Modified git-flow-avh workflow
- Semantic commit messages with type and scope
- Structured release and hotfix processes

### [submodules.md](./submodules.md)

Detailed guide for managing Git submodules, including:

- Adding and removing submodules
- Updating from upstream sources
- Synchronizing forks
- Managing dual remotes (origin and upstream)
- Best practices for submodule integration

**Key Principles**:

- Always fork before adding as submodule
- Configure dual remotes for upstream sync
- Keep master and develop in sync with upstream
- Use feature branches for custom modifications

## Workflow Summary

### Standard Git-Flow Commands

```bash
# Create feature branch
git flow feature start feature-name

# Create release
git flow release start x.x.x
git flow release finish x.x.x

# Create hotfix
git flow hotfix start fix-name
```

### Commit Message Format

```
type(scope): short description

Detailed explanation if necessary
```

**Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

## Related Documentation

- [@../interfaces/aichat/submodules.md](../interfaces/aichat/submodules.md) - AIChat-specific submodule integration
- [@../tools/argc-build-process.md](../tools/argc-build-process.md) - Build process integration with Git workflow
