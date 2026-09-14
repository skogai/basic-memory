---
title: argc Build Process
description: Comprehensive documentation on the argc build system for SkogAI tools and agents
date: '2023-11-06'
tags:
  - argc
  - build
  - tools
  - agents
  - llm-functions
status: published
permalink: skogai/todo/intefaces/aichat/argc-build-process
---

# The argc Build Process

This document provides a comprehensive guide to the argc build system used within SkogAI's tool framework. The build process converts annotated scripts into executable tools that can be called from AI interfaces like AIChat.

## Overview

The `argc build` command transforms annotated script files in the `tools/` and `agents/` directories into standardized function interfaces and executable wrappers. This process enables LLMs to interact with system tools through a consistent interface.

## Prerequisites

Before running the build process, you need:

1. The llm-functions framework installed as a Git submodule at `/home/skogix/skogai/tools`
1. Scripts with proper argc annotations in the `tools/tools/` directory
1. Agent configurations in the `tools/agents/` directory

## Configuration Files

Two essential configuration files must exist for the build process to work:

### tools.txt

Located at `/home/skogix/skogai/tools/tools.txt`, this file lists all tool scripts to be built.

```
execute_command.sh
execute_js_code.js
execute_py_code.py
execute_sql_code.sh
fetch_url_via_curl.sh
fs_cat.sh
fs_ls.sh
fs_mkdir.sh
fs_rm.sh
fs_write.sh
get_current_time.sh
```

### agents.txt

Located at `/home/skogix/skogai/tools/agents.txt`, this file lists all agent configurations to be built.

```
coder
demo
json-viewer
sql
todo
```

## Build Process Steps

When running `argc build`, the following steps occur:

1. The system reads `tools.txt` and `agents.txt` to determine what to build
1. For each tool in `tools.txt`:
   - Parses the annotations in the script file
   - Generates a wrapper script in the `bin/` directory
   - Adds the function definition to the main `functions.json`
1. For each agent in `agents.txt`:
   - Reads the agent's `tools.txt` to determine which tools it needs
   - Generates an agent-specific `functions.json` in the agent's directory
   - Creates a wrapper script for the agent in the `bin/` directory

## Generated Outputs

The build process generates several important files:

### 1. Main functions.json

Located at `/home/skogix/skogai/tools/functions.json`, this file contains definitions for all tools, following the OpenAI function calling schema:

```json
[
  {
    "name": "execute_command",
    "description": "Execute the shell command.",
    "parameters": {
      "type": "object",
      "properties": {
        "command": {
          "type": "string",
          "description": "The command to execute."
        }
      },
      "required": ["command"]
    }
  },
  {
    "name": "fs_cat",
    "description": "Read the contents of a file at the specified path.",
    "parameters": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string",
          "description": "The path of the file to read"
        }
      },
      "required": ["path"]
    }
  }
]
```

### 2. Agent-specific functions.json

Each agent gets its own `functions.json` containing only the tools it needs, plus any agent-specific tools:

```json
[
  {
    "name": "get_ipinfo",
    "description": "Get the ip info",
    "parameters": {
      "type": "object",
      "properties": {},
      "required": []
    },
    "agent": true
  },
  {
    "name": "execute_command",
    "description": "Execute the shell command.",
    "parameters": {
      "type": "object",
      "properties": {
        "command": {
          "type": "string",
          "description": "The command to execute."
        }
      },
      "required": ["command"]
    }
  }
]
```

### 3. Executable Wrappers

The build process creates executable wrapper scripts in the `bin/` directory for both tools and agents. These wrappers handle:

- Parameter validation
- Input/output formatting
- Error handling
- Execution boundaries for safety

## Running the Build Process

To run the build process:

```bash
cd /home/skogix/skogai/tools
./scripts/argc-tool.sh build
```

Or to build specific components:

```bash
# Build only tools
./scripts/argc-tool.sh build@tool

# Build specific tools
./scripts/argc-tool.sh build@tool get_current_weather.sh execute_command.sh

# Build only agents
./scripts/argc-tool.sh build@agent

# Build specific agents
./scripts/argc-tool.sh build@agent coder todo
```

The output will show each file being built:

```
Build functions.json
Build bin/execute_command
Build bin/execute_js_code
...
Build bin/web_search_tavily
Build agents/coder/functions.json
...
Build bin/todo
```

## Additional Build Commands

The argc system offers several other build-related commands:

### Check Command

Verify the syntax and configuration without building:

```bash
# Check all
./scripts/argc-tool.sh check

# Check specific tools
./scripts/argc-tool.sh check@tool get_current_weather.sh

# Check specific agents
./scripts/argc-tool.sh check@agent coder
```

### Clean Command

Remove build artifacts:

```bash
# Clean all
./scripts/argc-tool.sh clean

# Clean tools
./scripts/argc-tool.sh clean@tool

# Clean agents
./scripts/argc-tool.sh clean@agent
```

### Test Command

Run tests for tools and agents:

```bash
# Test all
./scripts/argc-tool.sh test

# Test tools
./scripts/argc-tool.sh test@tool

# Test agents
./scripts/argc-tool.sh test@agent
```

## Integration with AIChat

To make these tools available in AIChat, run:

```bash
./scripts/argc-tool.sh link-to-aichat
```

This creates symbolic links from AIChat's functions directory to:

- The main `functions.json` file
- Agent-specific function definitions
- Executable wrappers in the `bin/` directory

## Troubleshooting

If the build fails, check for these common issues:

1. **Missing Configuration Files**: Ensure both `tools.txt` and `agents.txt` exist
1. **Invalid Tool Scripts**: Verify tool scripts have proper argc annotations
1. **Permission Issues**: Check that you have write permissions in the `bin/` directory
1. **Agent Configuration**: Ensure each agent has a valid `index.yaml` and `tools.txt`
1. **Syntax Errors**: Look for errors in the annotations or script content
1. **Missing Dependencies**: Verify all required dependencies are installed

## Best Practices

1. **Tool Organization**: Keep tools organized by functionality
1. **Annotation Clarity**: Write clear descriptions and parameter documentation
1. **Agent Specialization**: Create focused agents for specific tasks
1. **Regular Rebuilding**: After any changes to tools or agents, rerun the build process
1. **Version Control**: Keep track of changes to tool scripts and configurations
1. **Incremental Building**: Use targeted build commands for faster iteration
1. **Validation**: Run the check command before full builds to catch errors early

## Understanding the JSON Schema

The generated function definitions follow the OpenAI Function Calling schema, which consists of:

1. **Name**: The function identifier used in calling
1. **Description**: Explains what the function does
1. **Parameters**: Structured as a JSON Schema object with:
   - **Properties**: Each parameter with type and description
   - **Required**: Array listing which parameters are mandatory

This schema ensures compatibility with various LLM function calling implementations, particularly AIChat and OpenAI-compatible interfaces.

______________________________________________________________________

By understanding the argc build process, you can effectively create, modify, and manage tools and agents in the SkogAI system, extending the capabilities of AIChat with custom functionality.
