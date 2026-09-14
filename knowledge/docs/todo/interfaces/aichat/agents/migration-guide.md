---
title: Migrating from Roles to Agents
description: Guide for transforming AIChat roles into powerful llm-functions agents
category: interfaces
subcategory: aichat
tags:
  - agent
  - aichat
  - role
  - migration
  - llm-functions
version: 0.1.0
status: draft
created: '2024-07-01'
updated: '2024-07-01'
permalink: skogai/todo/interfaces/aichat/agents/migration-guide
---

# Migrating from Roles to Agents

[prompt:intro] This document provides guidance for migrating from basic AIChat roles to the more powerful agent system built on llm-functions. It outlines the process of transforming a role's system prompt, tool permissions, and variables into the agent framework. [/prompt:intro]

## Understanding the Differences

Before migrating, it's important to understand the key differences between roles and agents:

| Feature                | AIChat Roles                      | llm-functions Agents                    |
| ---------------------- | --------------------------------- | --------------------------------------- |
| Configuration          | Single file with YAML frontmatter | Multiple files with dedicated format    |
| Custom tools           | No (only global tools)            | Yes (language-specific implementations) |
| RAG integration        | No                                | Yes (document collections)              |
| Dynamic variables      | Basic                             | Advanced (system, user, generated)      |
| Function schemas       | No                                | Yes (structured JSON schemas)           |
| Multi-language support | No                                | Yes (Bash, Python, JavaScript)          |

## The SkogAI Role Example

Let's use the current SkogAI role as an example to migrate:

```yaml
---
use_tools: fs, run_command
---

Your name is SkogAI

You are operating in {{mode}} mode. Your current task is to {{task}}.

The current working directory is set to {{pwd}}. Use this as a reference point when working with relative file paths.

You have access to a special tool: ./scripts/aichat-help.sh which can be used to ask questions about AIChat (the CLI interface you're operating through). If you're uncertain about AIChat's capabilities or functionality, you can use this tool to query the AIChat documentation.

Example usage:

- To get general AIChat help: execute_command("./scripts/aichat-help.sh")
- To get help on a specific topic: execute_command("./scripts/aichat-help.sh [topic]")
```

## Step 1: Create the Agent Directory Structure

```bash
mkdir -p /mnt/extra/skogai/tools/agents/skogai
```

## Step 2: Transform the Role Configuration

Create an `index.yaml` file that captures the role's functionality while enhancing it with agent capabilities:

```yaml
name: SkogAI
description: An AI assistant for managing the SkogAI codebase and infrastructure
version: 0.1.0
instructions: |
  Your name is SkogAI

  You are operating in {{mode}} mode. Your current task is to {{task}}.

  The current working directory is set to {{cwd}}. Use this as a reference point when working with relative file paths.

  <tools>
  {{__tools__}}

  You have access to a special tool: aichat_help which can be used to ask questions about AIChat (the CLI interface you're operating through). If you're uncertain about AIChat's capabilities or functionality, you can use this tool to query the AIChat documentation.

  Example usage:
  - To get general AIChat help: aichat_help()
  - To get help on a specific topic: aichat_help("topic")
  </tools>

  <s>
  os: {{__os__}}
  os_family: {{__os_family__}}
  arch: {{__arch__}}
  shell: {{__shell__}}
  locale: {{__locale__}}
  now: {{__now__}}
  cwd: {{__cwd__}}
  </s>

  <user>
  mode: {{mode}}
  task: {{task}}
  </user>
variables:
  - name: mode
    description: The current operating mode (development, analysis, documentation, etc.)
    default: "general assistance"
  - name: task
    description: The specific task to be performed
    default: "help with the SkogAI codebase and infrastructure"
conversation_starters:
  - What files are in the current directory?
  - Help me understand the structure of the SkogAI project.
  - Create a new documentation file for a component.
  - Execute a command to check system status.
documents:
  - README.md
  - https://github.com/SkogAI/skogai/blob/main/README.md
```

## Step 3: Implement Custom Tools

Create a `tools.sh` file to implement the AIChat help tool and other SkogAI-specific functionality:

```bash
#!/usr/bin/env bash
set -e

# @env LLM_OUTPUT=/dev/stdout The output path

# @cmd Query the AIChat documentation
# @arg topic? The specific topic to get help on
aichat_help() {
    local topic="$1"
    
    if [ -z "$topic" ]; then
        ./scripts/aichat-help.sh >> "$LLM_OUTPUT"
    else
        ./scripts/aichat-help.sh "$topic" >> "$LLM_OUTPUT"
    fi
}

# @cmd List all SkogAI interfaces
list_interfaces() {
    find /mnt/extra/skogai/interfaces -type d -mindepth 1 -maxdepth 1 | sort >> "$LLM_OUTPUT"
}

# @cmd Get a summary of the SkogAI project structure
project_summary() {
    echo "SkogAI Project Structure:" >> "$LLM_OUTPUT"
    echo "=========================" >> "$LLM_OUTPUT"
    
    echo -e "\nCore Directories:" >> "$LLM_OUTPUT"
    find /mnt/extra/skogai -maxdepth 1 -type d | grep -v "^\." | sort >> "$LLM_OUTPUT"
    
    echo -e "\nInterfaces:" >> "$LLM_OUTPUT"
    find /mnt/extra/skogai/interfaces -type d -mindepth 1 -maxdepth 1 | sort >> "$LLM_OUTPUT"
    
    echo -e "\nDocumentation Categories:" >> "$LLM_OUTPUT"
    find /mnt/extra/skogai/docs -type d -mindepth 1 -maxdepth 1 | sort >> "$LLM_OUTPUT"
    
    echo -e "\nTools and Scripts:" >> "$LLM_OUTPUT"
    find /mnt/extra/skogai/scripts -type f -name "*.sh" | sort >> "$LLM_OUTPUT"
}

# See more details at https://github.com/sigoden/argc
eval "$(argc --argc-eval "$0" "$@")"
```

## Step 4: Reference External Tools

Create a `tools.txt` file to include the file system and command execution tools:

```
execute_command.sh
fs_cat.sh
fs_ls.sh
fs_mkdir.sh
fs_rm.sh
fs_write.sh
```

## Step 5: Add Documentation

Create a `README.md` file with comprehensive information:

```markdown
# SkogAI Agent

## Purpose

The SkogAI agent provides intelligent assistance for managing and developing the SkogAI codebase and infrastructure. It combines file system operations, command execution, and specialized tools for working with the SkogAI ecosystem.

## Features

- File system operations (listing, reading, writing, creating, deleting)
- Shell command execution
- AIChat documentation queries
- SkogAI project structure exploration
- Contextual awareness of current working directory and task

## Usage Examples

### Example 1: Exploring Project Structure

User: "What files are in the interfaces directory?"
Agent: *Lists files in the interfaces directory*

### Example 2: Accessing Documentation

User: "How do I use conversation history in AIChat?"
Agent: *Executes aichat_help("history") and displays results*

### Example 3: Creating New Components

User: "Create a documentation file for the new caching system"
Agent: *Creates a new markdown file with appropriate frontmatter and structure*

## Available Tools

- File operations: fs_cat, fs_ls, fs_mkdir, fs_rm, fs_write
- Command execution: execute_command
- AIChat help: aichat_help
- Project exploration: list_interfaces, project_summary

## Variables

- `mode`: The current operating mode (development, analysis, documentation)
- `task`: The specific task being performed

## Integration

This agent integrates with the core SkogAI repository structure and provides specialized assistance for development tasks. It has contextual awareness of the project organization and can help with navigating and maintaining the codebase.
```

## Step 6: Build and Link the Agent

After creating all necessary files, build and link your agent:

```bash
cd /mnt/extra/skogai
./scripts/argc-tool.sh build
./scripts/argc-tool.sh link-to-aichat
```

## Step 7: Test the Agent

```bash
aichat --agent skogai "Show me the project structure"
```

## Comparison of Role vs Agent Implementation

### Original Role Limitations

The original role:

- Uses raw `execute_command` for AIChat help
- Relies on passing the working directory as a variable
- Has limited customization capabilities
- Cannot implement custom tools

### Agent Enhancements

The new agent:

- Implements a dedicated `aichat_help` tool with proper argument handling
- Provides additional tools specific to SkogAI (`list_interfaces`, `project_summary`)
- Includes system information automatically
- Uses RAG integration for context from documentation
- Offers conversation starters to guide users

## Benefits of Migration

Converting from roles to agents provides several advantages:

1. **Improved organization**: Clear separation of configuration, tools, and documentation
1. **Enhanced capabilities**: Custom tools specific to SkogAI's needs
1. **Better user experience**: Conversation starters and more contextual responses
1. **Knowledge integration**: RAG system provides documentation access
1. **Maintainability**: Easier to extend and modify components independently

## Additional Migration Scenarios

### Complex Roles with Multiple Variables

For roles with many variables, the agent system provides better organization:

```yaml
variables:
  - name: variable1
    description: Description of variable1
    default: "default value"
  - name: variable2
    description: Description of variable2
```

### Roles with Reference Material

Roles that reference documentation or examples can utilize the RAG system:

```yaml
documents:
  - README.md
  - docs/important-context.md
  - https://example.com/relevant-documentation.html
```

### Roles with Specialized Capabilities

For roles with unique capabilities, implement custom tools:

```bash
# @cmd Specialized function for the role's domain
# @arg input The input to process
specialized_function() {
    # Implementation here
}
```

## Automatic Migration Tool

[@todo:migration:Create a script to automatically migrate roles to agents]

A future enhancement will include a script to automate this migration process:

```bash
./scripts/migrate-role-to-agent.sh /path/to/role.md agent-name
```

[todo:items]

- Create templates for common agent types
- Build a role-to-agent migration script
- Document advanced agent customization options
- Provide examples of complex migrations [/todo:items]
