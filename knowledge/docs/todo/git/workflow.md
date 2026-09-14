---
title: workflow
type: note
permalink: skogai/todo/git/workflow
---

# SkogAI Git Workflow Documentation

## Overview

SkogAI follows a modified [git-flow-avh](https://github.com/petervanderdoes/gitflow-avh) workflow for repository management. This document outlines our standard practices for managing the codebase, collaborating with others, and incorporating third-party code via submodules.

## Branch Structure

### Core Branches

- **master**: Production-ready code, stable and deployable
- **develop**: Integration branch for features being worked on for the next release
- **main**: (Project-specific) Contains custom implementations and modifications

### Supporting Branches

- **feature/xxx**: New features branched from and merged back to develop
- **release/x.x.x**: Branches for finalizing releases
- **hotfix/xxx**: Critical fixes that need to be applied to production
- **origin-backup-xxx**: Backup branches for preserving custom modifications

## Submodule Management

SkogAI frequently incorporates third-party libraries as submodules to maintain separation while enabling updates from upstream sources. See the detailed documentation in [submodules.md](/mnt/extra/skogai/docs/interfaces/aichat/submodules.md).

### Key Submodule Practices

1. **Always fork first**: Create a SkogAI fork of any repository before adding as a submodule
1. **Configure dual remotes**: Set up both `origin` (pointing to our fork) and `upstream` (pointing to the original repository)
1. **Synchronize regularly**: Keep master and develop branches in sync with upstream
1. **Use feature branches**: Develop custom modifications in feature branches

## Committing Changes

### Commit Message Format

```
type(scope): short description

Detailed explanation if necessary
```

Types:

- feat: New feature
- fix: Bug fix
- docs: Documentation changes
- style: Formatting, missing semi colons, etc (no code change)
- refactor: Code refactoring
- test: Adding tests
- chore: Maintenance tasks

### Example

```
feat(auth): implement OAuth2 integration

- Add OAuth2 client configuration
- Update authentication middleware
- Add documentation for OAuth setup
```

## Release Process

1. Create a release branch from develop: `git flow release start x.x.x`
1. Finalize, test, and commit any release adjustments
1. Finish release: `git flow release finish x.x.x`
   - Merges to master
   - Tags with version
   - Merges back to develop
   - Removes release branch

## Git-Flow AVH Configuration

To setup git-flow-avh for a repository:

```bash
git flow init
```

Use the following configuration:

- Production branch: master
- Development branch: develop
- Feature prefix: feature/
- Release prefix: release/
- Hotfix prefix: hotfix/
- Support prefix: support/
- Version tag prefix: v

## Handling Conflicts

When conflicts arise:

1. Fetch all changes: `git fetch --all`
1. Identify conflict source: `git status`
1. Resolve conflicts in editor
1. Mark as resolved: `git add [conflicted-files]`
1. Continue the operation (merge, rebase, etc.)
1. Push changes when complete

## Working with Forks

For contributing to external projects:

1. Fork the repository on GitHub
1. Clone your fork: `git clone https://github.com/SkogAI/repository.git`
1. Add upstream remote: `git remote add upstream https://github.com/original/repository.git`
1. Keep your fork in sync:
   ```
   git fetch upstream
   git checkout master
   git merge upstream/master
   git push origin master
   ```

______________________________________________________________________

This documentation serves as the foundation for SkogAI's Git practices and will be expanded with additional details and examples as the project evolves.
