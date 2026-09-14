---
title: llm-functions Framework
description: Comprehensive documentation on the llm-functions framework integrated in SkogAI
date: '2023-11-06'
tags:
  - llm-functions
  - framework
  - tools
  - agents
  - submodule
status: published
permalink: skogai/todo/tools/llm-functions
---

# llm-functions Framework

## Overview

The llm-functions framework is a powerful, extensible system for creating, managing, and executing tools and agents that can be called by Large Language Models (LLMs). This document provides a comprehensive guide to the framework as implemented within SkogAI as a Git submodule.

## Core Concepts

The framework is built around three fundamental concepts:

### 1. Tools

Individual executable components that perform specific tasks:

- Single-purpose functions with clearly defined inputs and outputs
- Each tool focuses on one capability (file operations, web search, data processing)
- Can be implemented in various languages (Bash, Python, JavaScript)
- Annotated with structured comments to define their interfaces

### 2. Agents

Higher-level components that coordinate multiple tools:

- Can combine multiple tools into cohesive workflows
- Provide specialized environments for specific domains
- Define custom interfaces tailored to particular use cases
- Support stateful operations and multi-step processes

### 3. The argc System

The command-line interface and build system that ties everything together:

- Processes annotations to generate standardized interfaces
- Builds wrappers that handle parameter validation and execution
- Provides a consistent execution environment
- Manages security boundaries and permissions

## Architecture

The llm-functions framework is structured as follows:

```
tools/
├── Argcfile.sh          # Main interface file for argc
├── agents/              # Agent configurations
│   ├── coder/           # Code-focused agent
│   ├── demo/            # Demonstration agent
│   ├── json-viewer/     # JSON analysis agent
│   ├── sql/             # Database interaction agent
│   └── todo/            # Task management agent
├── bin/                 # Generated executable wrappers
├── src/                 # Core framework source code
├── tools/               # Individual tool implementations
│   ├── execute_command.sh
│   ├── fs_cat.sh
│   ├── fs_write.sh
│   └── ...
├── scripts/             # Utility scripts
├── functions.json       # Generated function definitions
├── agents.txt           # List of agents to build
└── tools.txt            # List of tools to build
```

## Integration with SkogAI

### Git Submodule Integration

The llm-functions framework is maintained as a Git submodule with a dual remote setup:

- **origin** - Points to the SkogAI fork (`SkogAI/llm-functions`)
- **upstream** - Points to the original repository (`sigoden/llm-functions`)

This setup enables SkogAI to:

- Track and incorporate upstream changes
- Maintain SkogAI-specific modifications
- Contribute improvements back to the original project

### Branch Organization

The repository follows a structured branch organization:

- **master** - Matches the upstream master branch
- **develop** - Integration branch for development
- **main** - SkogAI-specific customizations
- **feature/\*** - Individual feature development branches

### AIChat Integration

The framework integrates with AIChat through:

1. **Function Definitions** - JSON schema files that AIChat can consume
1. **Symbolic Links** - Connect AIChat's functions directory to the tool wrappers
1. **Execution Bridge** - AIChat can execute the tools and capture their outputs

## Building and Using Tools

### Build Process

The build process converts annotated scripts into executable tools:

1. **Read Configuration**:

   ```bash
   # Lists of tools and agents to build
   tools.txt
   agents.txt
   ```

1. **Parse Annotations**: Extracts interface definitions from structured comments

1. **Generate Wrappers**: Creates executable scripts in the `bin/` directory

1. **Create Function Definitions**: Produces `functions.json` files that follow the OpenAI function calling schema

### Running Tools

Tools can be executed in several ways:

1. **Direct Execution**:

   ```bash
   cd /home/skogix/skogai/tools
   ./bin/tool_name "parameter" --option=value
   ```

1. **Using argc-tool.sh**:

   ```bash
   ./scripts/argc-tool.sh run@tool tool_name "parameter" --option=value
   ```

1. **Via AIChat**: AIChat uses function calling to invoke tools based on conversational context

### Linking to AIChat

To make tools available in AIChat:

```bash
./scripts/argc-tool.sh link-to-aichat
```

This creates symbolic links from AIChat's functions directory to:

- The main `functions.json` file
- Individual agent function definitions
- Wrapper scripts in the `bin/` directory

## Creating Custom Components

### Creating a New Tool

1. **Create the script file**:

   ```bash
   ./scripts/argc-tool.sh create@tool my-new-tool
   ```

1. **Edit the annotations and implementation**:

   ```bash
   # @description My custom tool
   # @param input Input parameter
   # @option --format=text[text,json] Output format
   ```

1. **Add to tools.txt**:

   ```
   my-new-tool.sh
   ```

1. **Build and test**:

   ```bash
   ./scripts/argc-tool.sh build
   ./bin/my-new-tool "test input" --format=json
   ```

### Creating a New Agent

1. **Create the agent directory**:

   ```bash
   mkdir -p agents/my-agent
   ```

1. **Create configuration files**:

   ```bash
   # index.yaml - Agent configuration
   # tools.txt - List of tools to include
   # README.md - Documentation
   ```

1. **Add agent-specific tools** (optional):

   ```bash
   # tools.sh, tools.py, or tools.js file with agent-specific functionality
   ```

1. **Add to agents.txt**:

   ```
   my-agent
   ```

1. **Build and test**:

   ```bash
   ./scripts/argc-tool.sh build
   ./bin/my-agent "test query"
   ```

## Available Commands

The framework provides numerous commands for managing tools and agents:

### Tool Management

```bash
# List all tools
./scripts/argc-tool.sh list@tool

# Create a new tool
./scripts/argc-tool.sh create@tool tool-name

# Run a specific tool
./scripts/argc-tool.sh run@tool tool-name "parameter"

# Get documentation for a tool
./scripts/argc-tool.sh doc@tool tool-name
```

### Agent Management

```bash
# List all agents
./scripts/argc-tool.sh list@agent

# Create a new agent
./scripts/argc-tool.sh create@agent agent-name

# Run a specific agent
./scripts/argc-tool.sh run@agent agent-name "query"
```

### Build System

```bash
# Build all tools and agents
./scripts/argc-tool.sh build

# Build function declarations only
./scripts/argc-tool.sh build-declarations

# Clean build artifacts
./scripts/argc-tool.sh clean
```

### Integration Commands

```bash
# Link to AIChat
./scripts/argc-tool.sh link-to-aichat

# Generate documentation
./scripts/argc-tool.sh gen-docs
```

## Extending the Framework

The framework can be extended in several ways:

### Adding New Languages

Support for new programming languages requires:

1. **Annotation Parser** - To extract interface definitions
1. **Execution Wrapper** - To handle parameters and execution
1. **Output Formatter** - To standardize tool outputs

### Custom Agents

Advanced agents can be created using:

1. **Custom Tools** - Agent-specific tools written in agent directories
1. **Input Processors** - Special handlers for agent inputs
1. **Output Formatters** - Customize how agent results are presented
1. **Chain Execution** - Define workflows that combine multiple tools

### Integration with External Systems

The framework can be integrated with:

1. **Web Services** - Connect to APIs and online resources
1. **Databases** - Store and retrieve data persistently
1. **Local Applications** - Interact with installed software
1. **IoT Devices** - Control and monitor connected devices

## Security Considerations

The framework implements several security measures:

1. **Parameter Validation** - Ensures inputs match expected formats
1. **Execution Boundaries** - Limits what tools can access and modify
1. **Resource Controls** - Prevents excessive resource consumption
1. **Permission Management** - Controls which operations are allowed
1. **Sanitization** - Cleans potentially dangerous inputs

## Troubleshooting

Common issues and their solutions:

### Build Issues

**Problem**: Tools fail to build **Solution**:

- Verify `tools.txt` and `agents.txt` exist and contain the correct entries
- Check script permissions (`chmod +x`)
- Validate annotation syntax

### Execution Issues

**Problem**: Tools fail to execute **Solution**:

- Ensure dependencies are installed
- Check for consistent parameter names between annotations and code
- Verify path resolution and working directory

### Integration Issues

**Problem**: AIChat can't find tools **Solution**:

- Re-run the link-to-aichat command
- Check AIChat configuration has tools enabled
- Verify symbolic links aren't broken

## Best Practices

1. **Clear Documentation** - Document tools thoroughly in annotations
1. **Modular Design** - Create small, focused tools
1. **Consistent Interfaces** - Use consistent parameter patterns
1. **Error Handling** - Return helpful error messages
1. **Progressive Complexity** - Implement simple functionality first
1. **Testing** - Test tools with various inputs
1. **Security First** - Validate all inputs and outputs

______________________________________________________________________

The llm-functions framework provides a powerful foundation for extending AI capabilities through external tools. By following this guide, you can effectively use, create, and manage tools and agents within the SkogAI ecosystem.
