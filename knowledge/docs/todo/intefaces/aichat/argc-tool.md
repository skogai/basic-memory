---
title: argc-tool.sh Script
description: Comprehensive documentation on the argc-tool.sh wrapper script for managing llm-functions in SkogAI
date: '2023-11-06'
tags:
  - argc
  - tools
  - wrapper
  - script
  - llm-functions
status: published
permalink: skogai/todo/intefaces/aichat/argc-tool
---

# argc-tool.sh Script

## Overview

The `argc-tool.sh` script serves as a powerful command-line wrapper for interacting with the llm-functions framework within SkogAI. This script simplifies access to the extensive functionality offered by the `argc` command-line interface and ensures consistent execution environments for tool management operations.

## Location and Purpose

```
/home/skogix/skogai/scripts/argc-tool.sh
```

The primary purposes of this script are to:

1. **Provide a Consistent Entry Point**: Execute commands from anywhere in the SkogAI system without manual directory navigation
1. **Handle Environment Setup**: Ensure the proper working directory and environment variables
1. **Standardize Command Execution**: Maintain consistent command syntax and parameter handling
1. **Simplify Complex Operations**: Wrap multi-step processes into single commands

## Basic Usage

The script can be invoked with a variety of commands:

```bash
./scripts/argc-tool.sh [command] [arguments...]
```

When executed without arguments, it displays the help information showing all available commands.

## Command Categories

The script supports numerous commands across several categories:

### Information Commands

```bash
# Display version information
./scripts/argc-tool.sh version

# Show help information
./scripts/argc-tool.sh help

# List available tools
./scripts/argc-tool.sh list@tool

# List available agents
./scripts/argc-tool.sh list@agent
```

### Build Commands

```bash
# Build all tools and agents
./scripts/argc-tool.sh build

# Build function declarations only
./scripts/argc-tool.sh build-declarations

# Clean build artifacts
./scripts/argc-tool.sh clean
```

### Tool Management

```bash
# Create a new tool
./scripts/argc-tool.sh create@tool tool-name

# Run a specific tool
./scripts/argc-tool.sh run@tool tool-name "parameter" --option=value

# Get documentation for a tool
./scripts/argc-tool.sh doc@tool tool-name

# Edit a tool's script
./scripts/argc-tool.sh edit@tool tool-name
```

### Agent Management

```bash
# Create a new agent
./scripts/argc-tool.sh create@agent agent-name

# Run a specific agent
./scripts/argc-tool.sh run@agent agent-name "query"

# Get documentation for an agent
./scripts/argc-tool.sh doc@agent agent-name
```

### Integration Commands

```bash
# Link tools to AIChat
./scripts/argc-tool.sh link-to-aichat

# Generate documentation
./scripts/argc-tool.sh gen-docs

# Create a REST API server
./scripts/argc-tool.sh serve
```

## Implementation Details

The script implements several key features:

### Directory Navigation

```bash
# Change to the tools directory
cd "$SKOGAI_HOME/tools" || exit 1
```

This ensures all commands are executed from the correct context, regardless of where the script is invoked from.

### Command Execution

```bash
# Execute the argc command with the correct Argcfile.sh
./node_modules/.bin/argc --argcfile Argcfile.sh "$@"
```

The script uses the local node modules installation of argc and specifies the Argcfile.sh to use.

### Error Handling

The script includes basic error handling:

```bash
# Check for directory existence
if [ ! -d "$SKOGAI_HOME/tools" ]; then
  echo "Error: tools directory not found at $SKOGAI_HOME/tools"
  exit 1
fi
```

### Environment Variables

The script relies on the `SKOGAI_HOME` environment variable to locate the tools directory. This variable is typically set to:

```
/home/skogix/skogai
```

## Key Functionality

### The build Process

When using the build command:

```bash
./scripts/argc-tool.sh build
```

The script:

1. Reads `tools.txt` to determine which tools to build
1. Reads `agents.txt` to determine which agents to build
1. Parses annotations in each tool script
1. Generates wrapper scripts in the `bin/` directory
1. Creates `functions.json` files with function definitions
1. Builds agent-specific function collections

### The link-to-aichat Command

```bash
./scripts/argc-tool.sh link-to-aichat
```

This critical command:

1. Creates a symbolic link from AIChat's functions directory to the main `functions.json`
1. Creates symbolic links for agent function definitions
1. Creates symbolic links for executable wrappers
1. Sets appropriate permissions

This integration enables AIChat to discover and execute tools through its function calling interface.

## Advanced Usage

### Creating Custom Tools

```bash
# Create a new tool
./scripts/argc-tool.sh create@tool my-custom-tool

# Edit the newly created tool
./scripts/argc-tool.sh edit@tool my-custom-tool
```

The create command generates a boilerplate script with basic annotations that can be customized for specific functionality.

### Command Chaining

Multiple commands can be chained for complex workflows:

```bash
# Create, build, and link a new tool
./scripts/argc-tool.sh create@tool my-tool && \
  ./scripts/argc-tool.sh build && \
  ./scripts/argc-tool.sh link-to-aichat
```

### Using with AIChat

When executing tools via AIChat function calls, there are important considerations:

1. **Streaming Mode**: Disable streaming mode to avoid interruptions

   ```yaml
   stream: false
   ```

1. **Function Calling**: Ensure function calling is enabled

   ```yaml
   function_calling: true
   ```

1. **Tool Permission**: Verify the tool is allowed in the role configuration

   ```yaml
   roles:
     default:
       tools:
         - my-tool
   ```

## Troubleshooting

### Common Issues and Solutions

#### Command Not Found

**Problem**: `argc: command not found` **Solution**: Ensure you're in the correct directory or check node modules installation:

```bash
cd "$SKOGAI_HOME/tools"
npm install
```

#### Build Failures

**Problem**: Build process fails **Solution**:

- Check that `tools.txt` and `agents.txt` exist and have correct content
- Verify tool scripts have proper permissions
- Look for syntax errors in tool annotations

#### AIChat Integration Issues

**Problem**: Tools not appearing in AIChat **Solution**:

- Re-run the link-to-aichat command
- Check AIChat configuration has tools enabled
- Verify symbolic links are correctly created:
  ```bash
  ls -la ~/.aichat/functions/
  ```

## Best Practices

1. **Regular Rebuilds**: After modifying any tool, rebuild the system
1. **Always Link**: After building, always link to AIChat if using tools there
1. **Command Structure**: Use consistent command patterns for predictable behavior
1. **Documentation**: After creating tools, generate and review documentation
1. **Version Control**: Keep track of changes to tools and update version numbers

## Script Source Code

The script is relatively simple but powerful:

```bash
#!/bin/bash
# Navigate to the tools directory and run argc commands

# Set the tools directory
TOOLS_DIR="$SKOGAI_HOME/tools"

# Change to the tools directory
cd "$TOOLS_DIR" || exit 1

# Run the argc command with the correct Argcfile.sh
./node_modules/.bin/argc --argcfile Argcfile.sh "$@"
```

______________________________________________________________________

The `argc-tool.sh` script is a key component in the SkogAI tool ecosystem, providing a unified interface for managing the llm-functions framework and ensuring consistent tool and agent behaviors across the system.
