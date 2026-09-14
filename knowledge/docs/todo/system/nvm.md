---
title: nvm
type: note
permalink: skogai/todo/system/nvm
---

# Node Version Manager (NVM) Setup

## Usage

| Task                      | Command                                           |
| ------------------------- | ------------------------------------------------- |
| Use specific Node version | `nvm use 16` or `nvm use node` (latest)           |
| Install new Node version  | `nvm install 18`                                  |
| Install latest Node       | `nvm install node`                                |
| Install global package    | `npm install -g package-name`                     |
| List installed versions   | `nvm ls`                                          |
| Show current version      | `node -v`                                         |
| Set default Node version  | `nvm alias default 18`                            |
| Use Node in new project   | `cd project && nvm use` (reads .nvmrc if present) |
| Return to default         | `nvm use default`                                 |
| Uninstall a version       | `nvm uninstall 14`                                |

## Current Configuration

The project uses NVM (Node Version Manager) to manage Node.js installations and prevent permission issues when installing global packages.

- **NVM Version**: 0.40.3
- **Node.js Version**: 24.0.1
- **npm Version**: 11.3.0

### Custom Package Locations

All packages are stored in dedicated directories:

- NVM and npm installations: `/mnt/extra/npm` (controlled by NVM_DIR)
- pnpm store and global packages: `/mnt/extra/pnpm`

## Environment Setup

The minimal environment setup needed in `.zshrc` or `.bashrc`:

```bash
# Set NVM location to external storage
export NVM_DIR="/mnt/extra/npm"

# NVM initialization (must come after NVM_DIR is set)
source /usr/share/nvm/init-nvm.sh

# Add pnpm global bin directory to PATH
# Note: NVM automatically adds its bin directories to PATH
export PATH="/mnt/extra/pnpm/global/bin:$PATH"
```

## Installation Details

NVM is installed system-wide via pacman (Arch Linux package manager):

```bash
sudo pacman -S nvm
```

### Package Location Configuration

After setting up NVM with custom location, configure pnpm to use its dedicated directories:

```bash
# For pnpm (after installing pnpm)
pnpm config set store-dir /mnt/extra/pnpm/store
pnpm config set global-dir /mnt/extra/pnpm/global
pnpm config set global-bin-dir /mnt/extra/pnpm/global/bin
```

> **Important:** Do not manually configure npm's cache or prefix when using NVM. When you set NVM_DIR, NVM manages npm's installation paths automatically. Direct npm configuration could break NVM's management.

## Node.js Installation

The latest LTS version of Node.js is installed using:

```bash
nvm install node
```

## Best Practices

1. **Always use NVM's npm for global packages**:

   ```bash
   npm install -g <package-name>
   ```

   Do NOT use sudo with npm. NVM installs packages in your user directory, avoiding permission issues.

1. **Switch Node.js versions as needed**:

   ```bash
   nvm use <version>  # e.g., nvm use 18  or  nvm use node (for latest)
   ```

1. **List installed versions**:

   ```bash
   nvm ls
   ```

1. **List available versions to install**:

   ```bash
   nvm ls-remote
   ```

1. **Set a default Node.js version**:

   ```bash
   nvm alias default <version>  # e.g., nvm alias default 18
   ```

1. **Verify package installation paths**:

   ```bash
   # For npm-installed packages
   which <package-name>  # Should show path under $NVM_DIR

   # For pnpm-installed packages
   which <package-name>  # Should show path under /mnt/extra/pnpm/global/bin
   ```

## Troubleshooting

If you encounter issues with NVM:

1. **NVM command not found**: Ensure that NVM_DIR is set correctly and the initialization script is sourced in your shell:

   ```bash
   export NVM_DIR="/mnt/extra/npm"
   source /usr/share/nvm/init-nvm.sh
   ```

1. **Check if NVM is properly installed**:

   ```bash
   command -v nvm
   nvm --version
   ```

1. **Reinstall Node.js if needed**:

   ```bash
   nvm uninstall <version>
   nvm install <version>
   ```

1. **NVM path issues**: If changing NVM_DIR after previous installations, you may need to reinstall Node.js versions to have them correctly installed in the new location.

## Why This Approach?

Using NVM instead of system-wide Node.js (installed directly via pacman) offers several advantages:

- Avoids permission issues when installing global packages
- Allows switching between different Node.js versions as needed
- Prevents conflicts between system packages and npm packages
- Keeps Node.js tooling isolated from system packages, preventing dependency conflicts
- Storing in /mnt/extra allows sharing installations between multiple environments

## Migration History

In May 2025, we migrated from a mixed setup (system Node.js + NVM) to using exclusively NVM. This resolved conflicts where uninstalling system packages would break npm's functionality due to missing dependencies.

Later improved, using NVM_DIR to properly relocate all NVM-managed Node.js installations to the external storage location, simplifying the setup and ensuring proper isolation.
