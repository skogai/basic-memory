---
title: submodules
type: note
permalink: skogai/todo/interfaces/aichat/submodules
---

# SkogAI Submodules Documentation

## llm-functions Submodule

The SkogAI project includes [llm-functions](https://github.com/sigoden/llm-functions) as a submodule, which has been integrated into the repository structure at `/home/skogix/skogai/tools`.

### Setup Details

- **Original Repository**: https://github.com/sigoden/llm-functions
- **Fork Location**: https://github.com/SkogAI/llm-functions
- **Local Path**: `/home/skogix/skogai/tools` (submodule)

### Remote Configuration

The submodule has been set up with two remotes:

- **origin**: Points to our fork at https://github.com/SkogAI/llm-functions.git
- **upstream**: Points to the original repository at https://github.com/sigoden/llm-functions.git

### Branch Structure

We're using the git-flow-avh workflow with the following branches:

- **master**: Synced with upstream's main branch, contains the stable code
- **develop**: Development branch synced with upstream, where new features are integrated
- **main**: Contains our custom changes
- **origin-backup-to-be-merged-in-slowly**: Backup of our modifications before sync

### Maintaining the Submodule

To keep the submodule in sync with upstream while preserving our changes, follow these steps:

1. **Fetch upstream changes**:

   ```bash
   cd /home/skogix/skogai/tools
   git fetch upstream
   ```

1. **Update master branch**:

   ```bash
   git checkout master
   git reset --hard upstream/master  # or upstream/main depending on upstream's naming
   git push origin master --force
   ```

1. **Update develop branch**:

   ```bash
   git checkout develop
   git reset --hard upstream/develop
   git push origin develop --force
   ```

1. **Create feature branches** from develop:

   ```bash
   git checkout develop
   git checkout -b feature/your-feature-name
   # Make changes
   git commit -am "Add new feature"
   git push origin feature/your-feature-name
   ```

1. **Merge features back** to develop using pull requests on GitHub

### Adding New Features

When adding custom functionality to the forked llm-functions:

1. Always branch from `develop`
1. Use feature branches named `feature/[description]`
1. After testing, create pull requests to merge into `develop`
1. Periodically sync with upstream as described above

### Updating the Main Repository

After making changes to the submodule, update the main repository:

```bash
cd /home/skogix/skogai
git add tools
git commit -m "Update llm-functions submodule"
git push
```

This documentation reflects the current setup of the llm-functions submodule within the SkogAI project as of May 2025.
