---
title: submodules
type: note
permalink: skogai/todo/git/submodules
---

# Git Submodules in SkogAI

## Overview

Submodules allow you to include other Git repositories within your main repository. SkogAI uses submodules to integrate third-party code while maintaining the ability to track upstream changes and incorporate custom modifications.

## Adding a Submodule

### Step 1: Fork the Repository

Always create a SkogAI fork of the original repository on GitHub before adding it as a submodule.

### Step 2: Add the Submodule

```bash
# Add the submodule pointing to our fork
git submodule add https://github.com/SkogAI/external-repo.git path/to/submodule

# Initialize and update the submodule
git submodule update --init --recursive
```

### Step 3: Configure the Upstream Remote

```bash
cd path/to/submodule
git remote add upstream https://github.com/original/external-repo.git
git fetch upstream
```

## Maintaining Submodules

### Updating from Upstream

```bash
# Navigate to the submodule directory
cd path/to/submodule

# Fetch the latest changes from upstream
git fetch upstream

# Update branches to match upstream
git checkout master
git reset --hard upstream/master
git push origin master --force

git checkout develop
git reset --hard upstream/develop
git push origin develop --force
```

### Making Custom Changes

1. Create a feature branch:

   ```bash
   git checkout develop
   git checkout -b feature/custom-modification
   ```

1. Make changes, commit, and push:

   ```bash
   git commit -am "Add custom functionality"
   git push origin feature/custom-modification
   ```

1. Create a pull request to merge into develop

### Updating the Main Repository

After updating a submodule:

```bash
# From the main repository root
git add path/to/submodule
git commit -m "Update submodule to latest version"
git push
```

## Cloning a Repository with Submodules

```bash
# Clone with submodules
git clone --recurse-submodules https://github.com/SkogAI/main-repo.git

# Or initialize submodules after cloning
git submodule update --init --recursive
```

## Common Submodule Issues

### Detached HEAD State

If a submodule is in a detached HEAD state:

```bash
cd path/to/submodule
git checkout master  # or appropriate branch
```

### Submodule Not Updating

If changes aren't reflecting in the main repository:

```bash
git submodule update --remote --merge
```

### Removing a Submodule

```bash
# Remove the submodule entry from .git/config
git submodule deinit -f path/to/submodule

# Remove the submodule from the index and working tree
git rm -f path/to/submodule

# Remove the submodule directory from .git/modules
rm -rf .git/modules/path/to/submodule

# Commit the changes
git commit -m "Removed submodule"
```

## Best Practices

1. **Always use forks**: Never directly reference third-party repositories
1. **Maintain clean branches**: Keep master and develop synced with upstream
1. **Document changes**: Add comments about significant modifications
1. **Use feature branches**: Develop new functionality in isolated branches
1. **Commit submodule updates separately**: Don't mix submodule updates with other changes

## Current Submodules

For details on specific submodules in SkogAI, see:

- [llm-functions documentation](/mnt/extra/skogai/docs/interfaces/aichat/submodules.md)

This documentation provides a foundation for working with Git submodules in the SkogAI project and will be expanded as needed.
