---
title: SkogAI Agents
description: Documentation on creating and managing agents in the SkogAI system
date: '2023-11-06'
tags:
  - agents
  - argc
  - tools
  - skogai
status: published
permalink: skogai/prompts/todo/skogai-agents-aichat
---

# SkogAI Agents

This document provides a guide to understanding, creating, and managing agents within the SkogAI tools ecosystem powered by SkogAI and argc.

\[@skogix:note that this is two years old and as such *ARE* out of date. Please verify against the latest SkogAI documentation, codebase and Skogix before use.\]

## What Are Agents?

In the SkogAI context, an agent is a specialized configuration that groups together a set of tools for a specific purpose or domain. Agents provide:

\[@skogix:at this stage of skogai development we *only* used argc agents so a lot have to be changed for regular use\]

1. **Focused Tool Collections**: Only the tools needed for a specific task
1. **Custom Functionality**: Agent-specific functions not available as general tools
1. **Specialized Parameters**: Optimized interfaces for specific use cases
1. **Contextual Documentation**: Usage instructions relevant to the agent's purpose
1. **Modified or Specialized Prompts**: Tailored instructions for AI interactions

## Agent Structure

Agents reside in the `/home/skogix/skogai/tools/agents/` directory, with each agent having its own subdirectory. A typical agent directory contains:

```
agents/agent_name/
├── functions.json    # Auto-generated JSON declarations for functions
├── index.yaml       # Agent configuration and metadata
├── README.md        # Documentation
├── tools.sh         # Bash agent-specific tools (optional)
└── tools.txt        # List of general tools used by this agent
```

## Core Agent Files

### index.yaml

This is the primary configuration file that defines the agent's metadata and behavior:

```yaml
name: demo
description: Demo agent that demonstrates basic functionality
icon: 🧪
version: 0.1.0
author: SkogAI Team
homepage: https://github.com/SkogAI/llm-functions
instructions: You are a test AI agent to assist with demonstrations

# Define various agent configurations
variables:
  - name: mode
    description: Operating mode
    default: normal
  - name: verbosity
    description: Level of detail in responses
    default: medium
```

#### Metadata Fields

- `name`: A unique name for your agent
- `description`: A brief explanation of the agent's purpose
- `version`: The version number (helps track changes)
- `icon`: A visual representation (usually an emoji)
- `author`: The creator of the agent
- `homepage`: Reference URL for documentation

#### Instructions

The `instructions` field defines the initial context or behavior directives for the agent:

```yaml
instructions: You are a test AI agent to assist with demonstrations
```

You can use variables in instructions:

```yaml
instructions: |
  The instructions can access user-defined variables: {{mode}} and {{verbosity}},
  or built-in variables: {{__cwd__}}
```

#### Variables

Variables store user-related data, such as behavior preferences:

```yaml
variables:
  - name: foo
    description: This is a foo
  - name: bar
    description: This is a bar with default value
    default: val
```

> For sensitive information such as api_key, client_id, client_secret, and token, it's recommended to use environment variables instead of agent variables.

The system provides built-in variables:

| Name            | Description                          | Example                  |
| :-------------- | :----------------------------------- | :----------------------- |
| `__os__`        | Operating system name                | linux                    |
| `__os_family__` | Operating system family              | unix                     |
| `__arch__`      | System architecture                  | x86_64                   |
| `__shell__`     | Current user's default shell         | bash                     |
| `__locale__`    | User's preferred language and region | en-US                    |
| `__now__`       | Current timestamp in ISO 8601 format | 2024-07-29T08:11:24.367Z |
| `__cwd__`       | Current working directory            | /tmp                     |
| `__tools__`     | List of agent tools                  |                          |

#### Documents

A list of resources for building RAG (Retrieval-Augmented Generation):

```yaml
documents:
  - local-file.txt
  - local-dir/
  - https://example.com/remote-file.txt
```

> All local files and directories are relative to the agent directory.

#### Conversation Starters

Predefined prompts that users can use to start interactions:

```yaml
conversation_starters:
  - What can you do?
  - Help me with a SQL query
  - Analyze this JSON
```

### tools.txt

This file lists which general tools from the `tools/` directory should be included in this agent:

```
execute_command.sh
fs_cat.sh
fs_write.sh
```

### Agent-Specific Tool Scripts

Agents can define their own tools that only exist within that agent:

```bash
# tools.sh
# @cmd Get information specific to this agent
# @option --format=json[json,text] Output format
get_info() {
  echo "Agent-specific functionality"
}

# @cmd Another specialized command
# @param input The input to process
another_command() {
  echo "Processing $input"
}

eval "$(argc --argc-eval "$0" "$@")"
```

Notice that agent-specific tools use the `@cmd` annotation and named functions, rather than `@describe` and a single `main` function as used in common tools.

## Creating a New Agent

### 1. Create the Agent Directory

```bash
mkdir -p /home/skogix/skogai/tools/agents/my_new_agent
```

### 2. The Configuration Files

```yaml
---
icon: 🔧
version: 0.1.0
author: Your Name
homepage: https://github.com/SkogAI/llm-functions
instructions: You are an agent that specializes in [specific domain]. Your goal is to help users with [specific tasks].

variables:
  - name: mode
    description: Operation mode
    default: standard
```

# Create tools.txt with the tools this agent needs

```text
execute_command.sh
fs_cat.sh
fs_write.sh
```

# Create a README

```markdown
# My New Agent

This agent helps with [specific purpose] by providing tools for [capabilities].
```

## Usage

```bash
./bin/my_new_agent "query"
```

### 3. Add Agent-Specific Tools (Optional)

If your agent needs specialized functionality, create agent-specific tool scripts:

```bash
#!/bin/bash
# Create a Bash tool file

# @cmd Get specialized information for this agent
# @option --detail[=basic,advanced] Level of detail to provide
get_info() {
  if [ "$argc_detail" = "advanced" ]; then
    echo "Providing advanced details..."
  else
    echo "Providing basic details..."
  fi
}

# @cmd Process domain-specific data
# @param input! The data to process
# @option --format=text[=text,json] Output format
process_data() {
  echo "Processing $argc_input in $argc_format format..."
}

eval "$(argc --argc-eval "$0" "$@")"
```

### 4. Add to agents.txt

Add your agent to the main agents.txt file in the root of the tool folder

### 5. Build the Agent

```bash
argc build
```

## Using AIChat to Create Agents

AIChat can help create agent configurations:

```bash
./aichat <<-'EOF'
create a spotify agent

index.yaml:
    name: spotify
    description: An AI agent that works with Spotify

tools.py:
  search: Search for tracks, albums, artists, or playlists on Spotify
    query (required): Query term
    qtype (default: "track"): Type of items to search for (track, album, artist, playlist)
    limit (default: 10): Maximum number of items to return
  get_info: Get detailed information about a Spotify item
    item_id (required): ID of the item to get information about
    qtype (default: "track"): Type of item: 'track', 'album', 'artist', or 'playlist'
  get_queue: Get the playback queue
  add_queue: Add tracks to the playback queue
    track_id (required): Track ID to add to queue
EOF
```

## Existing Agent Examples

The SkogAI system includes several pre-configured agents:

### Librarian

Specialized for documentation management.

- Location: `/home/skogix/skogai/tools/agents/librarian/`
- Tools: [@todo]

## Running Agents

Agents can be run in several ways:

- `argc <command>`
- `aichat --agent <agent_name> <query>`

[$DEPRECATED:skogix:TODO:must check this still is valid before use]

## Creating Agent-Creation Agents

A powerful capability is creating "meta-agents" that can create other agents. These require:

1. **Tool Detection**: Ability to analyze and select appropriate tools
1. **Configuration Generation**: Creating valid index.yaml files
1. **Documentation Creation**: Generating clear instructions
1. **Build Integration**: Triggering the build process

A basic agent-creation agent would include:

```bash
# @description Create a new agent with selected tools
# @param name Name of the new agent
# @param description Description of the agent's purpose
# @param tools Comma-separated list of tools to include
# @option --icon=🤖 Icon to represent the agent

# Implementation would:
# 1. Create the agent directory
# 2. Generate index.yaml
# 3. Create tools.txt with the selected tools
# 4. Add to agents.txt
# 5. Run the build process
# 6. Return the path to the new agent
```

## Advanced Agent Features

### Environment Variables

Agents can access environment variables:

```yaml
env:
  - OPENAI_API_KEY
  - CUSTOM_AGENT_SETTING
```

### Tool Aliases

Tools can be aliased within an agent:

```yaml
aliases:
  - name: search
    tool: web_search_tavily
  - name: execute
    tool: execute_command
```

### Output Formatting

Control how agent results are formatted:

```yaml
output:
  format: json # or text, html, etc.
  template: |
    {
      "result": "{{ result }}",
      "status": "{{ status }}"
    }
```

## Best Practices for Agent Design

1. **Single Responsibility**: Each agent should have a clear, focused purpose
1. **Minimal Tool Set**: Include only the tools needed for the agent's function
1. **Clear Documentation**: Provide detailed usage instructions
1. **Consistent Interfaces**: Maintain consistent parameter patterns
1. **Progressive Complexity**: Order tools from simple to complex
1. **Intuitive Naming**: Use clear, descriptive names
1. **Error Handling**: Provide helpful error messages
1. **Version Control**: Track changes to agent configurations
1. **Testing**: Verify agent functionality with test cases
1. **Appropriate Variables**: Define variables that make sense for the agent's domain

## Troubleshooting Agents

Common issues when working with agents:

1. **Missing Tools**: Ensure all tools listed in tools.txt exist
1. **Invalid YAML**: Verify index.yaml has correct syntax
1. **Missing Permissions**: Check tool script permissions
1. **Build Failures**: Confirm the agent is listed in agents.txt
1. **Runtime Errors**: Check agent-specific tool implementations
1. **Variable Access**: Verify variable usage in instructions and tools
1. **Integration Issues**: Verify AIChat linkage

______________________________________________________________________

By following this guide, you can create powerful, specialized agents that extend the capabilities of the SkogAI system for specific domains and use cases. [/$DEPRECATED:skogix:TODO:must check this still is valid before use]
