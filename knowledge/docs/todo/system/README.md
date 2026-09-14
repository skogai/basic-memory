---
title: README
type: note
permalink: skogai/todo/system/readme
---

# System Documentation

Environment setup, system configuration, and tool installation documentation.

## Overview

This directory contains comprehensive documentation for setting up and configuring the SkogAI development environment, including environment variables, package managers, and system utilities.

## Contents

### Environment Configuration

#### [environment-variables.md](./environment-variables.md)

Documentation for SkogAI environment variables and path configuration.

**Key Variables**:

- `SKOGAI_HOME=/home/skogix/skogai` - Main SkogAI directory (symlink to `/mnt/extra/skogai`)
- Path configurations for tools and utilities
- Resolution handling for symlink inconsistencies

**Best Practices**:

- Always use `SKOGAI_HOME` or absolute paths in scripts
- Be aware of symlink behavior
- Consistent path referencing across tools

**Purpose**: Ensures consistent environment configuration across all SkogAI tools and agents.

### Package Managers & Tools

#### [uv.md](./uv.md)

UV Python package manager documentation.

**Topics**:

- Installation and setup
- Virtual environment management
- Package installation
- Dependency resolution
- Common commands and workflows

**Purpose**: UV is the primary Python package manager for SkogAI projects.

#### [nvm.md](./nvm.md)

Node Version Manager (NVM) documentation.

**Topics**:

- Installation process
- Node.js version management
- Switching between versions
- Project-specific node versions
- npm integration

**Purpose**: Manages multiple Node.js versions for different projects.

#### [rustup.md](./rustup.md)

Rust toolchain manager documentation.

**Topics**:

- Rust installation
- Toolchain management
- Component installation
- Updates and maintenance
- Cross-compilation setup

**Purpose**: Manages Rust toolchain for SkogAI components written in Rust.

### System Utilities

#### [symlinks.sh](./symlinks.sh)

Symlink management script for SkogAI directory structure.

**Purpose**: Creates and manages symbolic links for the SkogAI environment.

### Hardware Configuration

#### [jbl-headphones.md](./jbl-headphones.md)

JBL headphones configuration and troubleshooting documentation.

**Topics**:

- Bluetooth pairing
- Audio configuration
- Troubleshooting common issues
- Driver information

**Purpose**: Documents hardware setup for development environment.

## Setup Workflow

### Initial Environment Setup

1. **Configure Environment Variables**

   ```bash
   # Add to .bashrc or .zshrc
   export SKOGAI_HOME=/home/skogix/skogai
   ```

1. **Install Package Managers**

   - Install UV for Python: Follow [uv.md](./uv.md)
   - Install NVM for Node.js: Follow [nvm.md](./nvm.md)
   - Install Rustup for Rust: Follow [rustup.md](./rustup.md)

1. **Setup Symlinks**

   ```bash
   # Run symlink script
   ./symlinks.sh
   ```

1. **Verify Installation**

   ```bash
   # Check environment variables
   echo $SKOGAI_HOME

   # Check package managers
   uv --version
   nvm --version
   rustup --version
   ```

### Project-Specific Setup

1. **Python Projects**

   ```bash
   cd project-directory
   uv venv
   uv pip install -r requirements.txt
   ```

1. **Node.js Projects**

   ```bash
   cd project-directory
   nvm use
   npm install
   ```

1. **Rust Projects**

   ```bash
   cd project-directory
   cargo build
   ```

## Environment Best Practices

### Path Management

- Use `SKOGAI_HOME` consistently
- Avoid hardcoded absolute paths
- Be mindful of symlink resolution
- Test scripts with different working directories

### Package Management

- Keep package managers updated
- Use lock files for reproducibility
- Document version requirements
- Test in clean environments

### System Configuration

- Document hardware configurations
- Keep setup scripts updated
- Test on fresh installations
- Maintain upgrade procedures

## Common Tasks

### Updating Tools

```bash
# Update UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# Update Node.js via NVM
nvm install node --reinstall-packages-from=node

# Update Rust
rustup update
```

### Environment Verification

```bash
# Check all installations
uv --version && echo "UV installed"
nvm --version && echo "NVM installed"
rustup --version && echo "Rustup installed"
echo $SKOGAI_HOME && echo "Environment configured"
```

### Troubleshooting

1. Check environment variables are set
1. Verify package manager installations
1. Confirm symlinks are correct
1. Review tool-specific documentation
1. Check for version conflicts

## Related Documentation

- [@../tools/environment-variables.md](../tools/environment-variables.md) - Tool-specific environment variables
- [@../prompts/uv.md](../prompts/uv.md) - UV workflow prompts
- [@../context/file-structure.md](../context/file-structure.md) - Project structure understanding
- [@../git/workflow.md](../git/workflow.md) - Git workflow for system changes

______________________________________________________________________

*Proper system configuration is essential for smooth SkogAI development.*
