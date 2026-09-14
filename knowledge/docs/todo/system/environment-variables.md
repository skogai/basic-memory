---
title: environment-variables
type: note
permalink: skogai/todo/system/environment-variables
---

# Environment Variables

## Overview

SkogAI uses environment variables to configure various aspects of the system and to provide consistent paths across different components.

## Core Environment Variables

### SKOGAI_HOME

The `SKOGAI_HOME` environment variable points to the root directory of the SkogAI project.

Current value:

```
/home/skogix/skogai
```

**Note**: This is actually a symbolic link to the actual location at `/mnt/extra/skogai`. This can cause path resolution issues in some contexts.

## Using Environment Variables in Scripts

When creating scripts for the SkogAI system, it's recommended to use the `SKOGAI_HOME` variable for path resolution to ensure consistency:

```bash
#!/bin/bash

# Use SKOGAI_HOME for consistent path resolution
CONFIG_DIR="$SKOGAI_HOME/config"
```

### Example: argc-tool.sh

The `argc-tool.sh` script uses `SKOGAI_HOME` to find the tools directory:

```bash
# Get the absolute path of the tools directory
TOOLS_DIR="$SKOGAI_HOME/tools"

# Change to the tools directory
cd "$TOOLS_DIR" || { echo "Error: Could not change to tools directory at $TOOLS_DIR"; exit 1; }
```

## Path Resolution Considerations

When working with SkogAI, be aware of the following path considerations:

1. **Symbolic Links**: `/home/skogix/skogai` is a symbolic link to `/mnt/extra/skogai`

   - Some tools may resolve through the symlink, while others may use the actual path
   - This can cause inconsistencies when working with paths

1. **Absolute vs. Relative Paths**:

   - Always use absolute paths or `SKOGAI_HOME` for reliable path resolution
   - Tools like `realpath` can be used to get the absolute path of a file

## Environment Variables in AIChat

AIChat can access environment variables when executing commands or functions. However, be mindful that:

1. Some environment variables might not be set in the AIChat execution environment
1. Sensitive environment variables should not be exposed to AI models

## Setting Environment Variables

Environment variables for SkogAI can be set:

1. **System-wide**: In `/etc/environment` or similar
1. **User-specific**: In `~/.bashrc`, `~/.zshrc`, etc.
1. **Project-specific**: In `.env` files (used by certain components)

For development and testing, a temporary setting can be used:

```bash
export SKOGAI_HOME=/path/to/skogai
```
