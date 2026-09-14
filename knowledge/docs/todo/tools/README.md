---
title: SkogAI Tools Documentation
description: Master index for all documentation related to the SkogAI tools ecosystem
date: '2023-11-06'
tags:
  - tools
  - argc
  - llm-functions
  - index
status: published
permalink: skogai/todo/tools/readme
---

# SkogAI Tools Documentation

This directory contains comprehensive documentation for the SkogAI tools system, which is powered by the llm-functions framework and argc.

## Core Documentation

- [argc Build Process](./argc-build-process.md) - Understanding how tools and agents are built
- [Tool Development Guide](./tool-development-guide.md) - Creating and maintaining tools
- [Agents Guide](./agents-guide.md) - Working with agent configurations
- [Advanced Tool Configuration](./advanced-tool-configuration.md) - Advanced techniques for tool development
- [Integrating with AIChat](./integrating-with-aichat.md) - Connecting tools to AIChat

## Overview

The SkogAI tools system provides a powerful framework for extending AI capabilities through external tools. This system allows:

1. **Tool Creation**: Develop custom tools in Bash, Python, or JavaScript
1. **Tool Organization**: Group tools into specialized agents for specific purposes
1. **AI Integration**: Connect tools to AIChat for LLM function calling
1. **Safety & Security**: Execute external processes within controlled boundaries

## Key Components

The system consists of these main components:

- **llm-functions Framework**: The core library providing tool annotations and execution
- **argc CLI**: Command-line interface for building and running tools
- **Tools Directory**: Contains individual tool implementations
- **Agents Directory**: Contains agent configurations grouping tools for specific purposes
- **Build System**: Processes annotations to generate function definitions and wrappers
- **AIChat Integration**: Connects built tools to AIChat for LLM use

## Getting Started

To get started with the SkogAI tools system:

1. **Build the tools**:

   ```bash
   cd /home/skogix/skogai/tools
   argc build
   ```

1. **Link to AIChat**:

   ```bash
   ./scripts/argc-tool.sh link-to-aichat
   ```

1. **Use the tools in AIChat**:

   ```bash
   aichat
   ```

## Tool Types

The system includes various tool categories:

1. **File System Tools**: `fs_cat`, `fs_write`, `fs_ls`, `fs_mkdir`, `fs_rm`
1. **Execution Tools**: `execute_command`, `execute_js_code`, `execute_py_code`
1. **Web Tools**: `fetch_url_via_curl`, `web_search_aichat`, `web_search_tavily`
1. **Specialized Tools**: Various domain-specific functionalities

## Agent Categories

Pre-configured agents include:

1. **Coder**: Tools for working with code and development tasks
1. **Demo**: Simple demonstration of basic functionality
1. **JSON Viewer**: Tools for working with JSON data
1. **SQL**: Tools for database interactions
1. **Todo**: Tools for task management

## Directory Structure

```
/home/skogix/skogai/tools/
├── agents/                # Agent configurations
│   ├── coder/             # Code-related agent
│   ├── demo/              # Demonstration agent
│   ├── json-viewer/       # JSON analysis agent
│   ├── sql/               # SQL database agent
│   └── todo/              # Task management agent
├── bin/                   # Generated executable wrappers
├── tools/                 # Individual tool implementations
├── scripts/               # Utility scripts
│   ├── build-declarations.sh
│   ├── create-tool.sh
│   ├── run-agent.sh
│   └── run-tool.sh
├── utils/                 # Shared utilities
├── Argcfile.sh            # Main argc configuration
├── functions.json         # Generated function definitions
├── agents.txt             # List of agents to build
└── tools.txt              # List of tools to build
```

## Development Workflow

The typical workflow for tool development is:

1. **Create a Tool**:

   - Add a script to `tools/`
   - Add annotations for parameters and documentation
   - Implement the tool functionality
   - Add the tool to `tools.txt`

1. **Build the Tool**:

   ```bash
   argc build
   ```

1. **Test the Tool**:

   ```bash
   ./bin/my_tool "parameter" --option=value
   ```

1. **Add to Agent** (optional):

   - Add the tool to an agent's `tools.txt`
   - Rebuild the agent

1. **Link to AIChat**:

   ```bash
   ./scripts/argc-tool.sh link-to-aichat
   ```

1. **Use in AIChat**:

   - Start AIChat and request tasks that use the tool

## Contributing

To contribute to the SkogAI tools system:

1. Follow the tool development guidelines in [Tool Development Guide](./tool-development-guide.md)
1. Ensure comprehensive documentation for new tools
1. Test tools thoroughly before integration
1. Create appropriate agent configurations if needed

______________________________________________________________________

For detailed information on any aspect of the system, refer to the specific documentation files linked at the top of this page.
