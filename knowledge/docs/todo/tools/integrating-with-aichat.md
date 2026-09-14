---
title: Integrating Tools with AIChat
description: Comprehensive guide to connecting argc tools with AIChat for LLM function calling
date: '2023-11-06'
tags:
  - aichat
  - integration
  - tools
  - function-calling
  - llm-functions
status: published
permalink: skogai/todo/tools/integrating-with-aichat
---

# Integrating Tools with AIChat

This document explains how to integrate tools built with the argc framework into AIChat, allowing language models to access and utilize these tools through function calling.

## Overview

The integration between argc tools and AIChat creates a powerful system where LLMs can:

1. Discover available tools through JSON schema definitions
1. Call tools with appropriate parameters based on user requests
1. Receive and process tool outputs to generate responses

This integration happens through several key components:

- **functions.json files**: Define tool schemas in a format AIChat understands
- **Symbolic links**: Connect AIChat to the tool definitions
- **Wrapper scripts**: Handle execution and parameter passing

## Integration Process

### 1. Building the Tools

First, ensure all tools are properly built:

```bash
cd /home/skogix/skogai/tools
argc build
```

This generates:

- Individual tool wrappers in the `bin/` directory
- A comprehensive `functions.json` file with all tool definitions
- Agent-specific `functions.json` files in each agent directory

### 2. Linking to AIChat

The connection between argc tools and AIChat is established with:

```bash
cd /home/skogix/skogai/tools
./scripts/argc-tool.sh link-to-aichat
```

This script:

- Creates symbolic links from AIChat's functions directory to argc's function definitions
- Links individual tools and agents to make them available for LLM function calling
- Sets up necessary permissions for AIChat to execute the tools

## Understanding the Integration

### Function Definitions

The core of the integration is the `functions.json` file which follows the OpenAI function calling schema:

```json
[
  {
    "name": "fs_write",
    "description": "Write the full file contents to a file at the specified path.",
    "parameters": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string",
          "description": "The path of the file to write to"
        },
        "contents": {
          "type": "string",
          "description": "The full contents to write to the file"
        }
      },
      "required": ["path", "contents"]
    }
  },
  // More function definitions...
]
```

This schema tells the LLM:

- The name of the function to call
- A description of what it does
- The parameters it needs, their types, and which ones are required
- Documentation for each parameter

### Execution Flow

When an LLM decides to call a function:

1. **AIChat receives the function call**: The LLM outputs a structured function call
1. **AIChat locates the function**: Using the symbolic links to find the executable
1. **AIChat passes parameters**: Sends the parameters in the format the tool expects
1. **Tool executes**: The tool performs its operation with the provided parameters
1. **Results return to AIChat**: The tool's output is sent back to AIChat
1. **AIChat presents results to the LLM**: The LLM can then interpret and use the results

## Directory Structure

The integration creates these connections:

```
/home/skogix/.aichat/functions/ -> symbolic links to:
  /home/skogix/skogai/tools/functions.json (main functions)
  /home/skogix/skogai/tools/bin/* (tool executables)
  /home/skogix/skogai/tools/agents/*/functions.json (agent functions)
```

## Configuring AIChat for Tool Usage

AIChat needs proper configuration to use tools:

### Checking AIChat Configuration

```bash
cat ~/.config/aichat/config.yaml
```

Ensure tools are enabled:

```yaml
tools:
  enable: true
  allow_function_tools: true
```

### Role Configuration

Tools can be restricted to specific roles or made available to all:

```yaml
roles:
  skogai:
    tools:
      - fs_cat
      - fs_write
      - fs_ls
      - fs_mkdir
      - fs_rm
      - execute_command
```

## Tool Execution Security

The integration implements several security measures:

1. **Parameter Validation**: Validates all parameters before execution
1. **Execution Boundaries**: Restricts tool capabilities to their intended scope
1. **Error Handling**: Captures and reports errors in a structured manner
1. **Permission Controls**: Limits tool access based on AIChat configuration

## Testing the Integration

To test if a tool is properly integrated:

1. Start AIChat:

   ```bash
   aichat
   ```

1. Request a task that would require the tool:

   ```
   Can you please create a file called test.txt with the content "Hello, World!"
   ```

1. AIChat should:

   - Recognize the need for the fs_write tool
   - Make a function call with appropriate parameters
   - Execute the tool
   - Report the results

## Advanced Integration Features

### 1. Tool Configuration Files

Tools can have configuration files that AIChat respects:

```
~/.config/aichat/tools/fs_write.yaml
```

With content like:

```yaml
allowed_paths:
  - /tmp
  - ~/documents
restricted_paths:
  - /etc
  - /home/user/.ssh
```

### 2. Tool Usage Logging

Enable logging to track tool usage:

```yaml
# In ~/.config/aichat/config.yaml
logging:
  tools:
    enabled: true
    path: ~/.local/state/aichat/tool_logs
```

### 3. Custom Tool Groups

Group related tools for easier management:

```yaml
# In ~/.config/aichat/config.yaml
tool_groups:
  filesystem:
    - fs_cat
    - fs_write
    - fs_ls
    - fs_mkdir
    - fs_rm
  web:
    - fetch_url_via_curl
    - web_search_tavily
```

Then enable entire groups:

```yaml
roles:
  developer:
    tool_groups:
      - filesystem
      - web
```

## Troubleshooting Integration Issues

### Missing Functions

If AIChat can't find a function:

```
cd /home/skogix/skogai/tools
./scripts/argc-tool.sh link-to-aichat
```

### Permission Errors

If permission errors occur:

```bash
chmod +x /home/skogix/skogai/tools/bin/*
```

### Tool Definition Errors

If tool definitions aren't correct:

```bash
cd /home/skogix/skogai/tools
argc build
./scripts/argc-tool.sh link-to-aichat
```

### Function Calling Issues

If the LLM isn't using functions:

- Ensure tools are enabled in AIChat config
- Check that your model supports function calling
- Verify the functions are properly described

## Using Agents in AIChat

Agents provide specialized tool collections:

```
Can you analyze the code in my project using the coder agent?
```

AIChat will:

1. Recognize the need for the coder agent
1. Access the agent-specific functions
1. Execute the appropriate tools

## Building Custom AIChat Integration

For deeper integration, you can create custom AIChat plugins:

```
~/.config/aichat/plugins/argc-tools.py
```

With content that enhances the integration:

```python
from aichat.plugin import Plugin

class ArgcToolsPlugin(Plugin):
    def setup(self):
        # Register custom handlers
        pass
        
    def pre_function_call(self, function_call):
        # Modify or validate function calls
        return function_call
        
    def post_function_call(self, result):
        # Process function results
        return result
```

______________________________________________________________________

This integration creates a seamless connection between AIChat and the argc tools ecosystem, allowing language models to interact with the system in powerful ways while maintaining security and usability.
