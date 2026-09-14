---
title: tools
type: note
permalink: skogai/todo/interfaces/aichat/tools
---

# AIChat Tools Integration

## Overview

AIChat's function calling capabilities are powered by the llm-functions framework. The tools I use to interact with the file system and execute commands are actually scripts from this framework, organized in a structured way with standardized interfaces.

## Tool Architecture

The tools are organized in two main directories:

```
tools/agents/demo/  - Example agent configurations
tools/tools/        - Actual tool implementations
```

However, the directory structure itself is less important than what it represents - a framework for creating standardized, interoperable tools that can be called by AI systems.

### Tools Directory Structure

The `tools/tools/` directory contains various tool scripts that provide functionality to AIChat, including:

| Tool Type       | Description                        | Examples                                                   |
| --------------- | ---------------------------------- | ---------------------------------------------------------- |
| File System     | File and directory operations      | fs_cat.sh, fs_ls.sh, fs_mkdir.sh, fs_rm.sh, fs_write.sh    |
| Code Execution  | Run code in different languages    | execute_command.sh, execute_js_code.js, execute_py_code.py |
| Web Interaction | Fetch content from URLs            | fetch_url_via_curl.sh, fetch_url_via_jina.sh               |
| Web Search      | Search engines and knowledge bases | web_search_aichat.sh, web_search_perplexity.sh             |
| Information     | Get current data & search          | get_current_time.sh, search_wikipedia.sh                   |
| Communication   | Send messages via services         | send_mail.sh, send_twilio.sh                               |

These represent just the foundation - the framework allows for creating virtually any tool that can be executed via script.

## Under the Hood

Each tool is implemented as a script that follows a standard pattern using the argc annotation system. For example, this is the `fs_ls.sh` tool:

```bash
#!/usr/bin/env bash
set -e

# @describe List all files and directories at the specified path.

# @option --path! The path of the directory to list

# @env LLM_OUTPUT=/dev/stdout The output path

main() {
    ls -1 "$argc_path" >> "$LLM_OUTPUT"
}

eval "$(argc --argc-eval "$0" "$@")"
```

The key components are:

1. **@-tags** - A comprehensive annotation system providing argc functionality:

   - **@describe** - Documents the tool's purpose
   - **@option** - Defines parameters (the ! indicates a required parameter)
   - **@env** - Specifies environment variables
   - **@arg** - Positional arguments
   - **@flag** - Boolean flags
   - **@cmd** - Subcommands
   - Many more specialized annotations for various use cases

1. **argc evaluation** - The `eval "$(argc --argc-eval "$0" "$@")"` line is critical as it:

   - Maps tool calls to the appropriate handler
   - Provides safety boundaries for execution
   - Enables controlled execution within the system
   - Prevents potentially dangerous operations (like `chmod +x`)

This annotation system is what allows me to safely create and execute scripts in Python, Bash, and other languages without breaking the session.

## How It All Works

1. Scripts with @-tag annotations are translated (not compiled) by argc evaluation
1. This translation creates standardized interfaces that can be called throughout the system
1. These interfaces are then presented to me as "tools" through function definitions
1. When I make a function call (e.g., `fs_ls`), the request is safely routed through the argc system
1. The tool executes with the provided parameters and returns the results using standardized protocols

## Integration with AIChat

The tools need to be built and linked to AIChat for me to use them:

```bash
./scripts/argc-tool.sh build         # Translate tools and create necessary definitions
./scripts/argc-tool.sh link-to-aichat  # Make them available to AIChat
```

The build process does considerably more than just creating schema files:

- Generates specialized function.json files for each agent/component
- Creates proper mappings between tool calls and their implementations
- Sets up the necessary environment for safe execution
- Establishes protocol translations for different interfaces

## Extended Capabilities

The argc annotation system provides capabilities far beyond basic function definitions:

1. **Rich tooling ecosystem**:

   - Automatic documentation generation
   - Dynamic help script creation
   - Tab-completion for command-line usage
   - Smart parameter suggestions

1. **Protocol standardization**:

   - Converts between different protocols and formats
   - Creates REST API endpoints (http://localhost:8808/tools)
   - Enables function calling via standardized interfaces
   - Supports multiple programming languages consistently

1. **Safety and control**:

   - Execution happens within controlled boundaries
   - Parameter validation and sanity checking
   - Proper error handling and reporting
   - Security isolation where appropriate

## Creating New Tools

One of the most powerful aspects of this system is that I can create new tools in Python, Bash, or other languages without human intervention. These tools automatically integrate into the system through the argc framework, provided they:

1. Follow the annotation syntax for parameters and descriptions
1. Respect the execution model of the system
1. Use the standardized output mechanisms

This capability enables the SkogAI system to be extended dynamically as requirements evolve.

## Available Tools

The current set of 25+ scripts represents just the beginning of what's possible:

- **File system**: fs_cat.sh, fs_ls.sh, fs_mkdir.sh, fs_patch.sh, fs_rm.sh, fs_write.sh
- **Code execution**: execute_command.sh, execute_js_code.js, execute_py_code.py, execute_sql_code.sh
- **Web**: fetch_url_via_curl.sh, fetch_url_via_jina.sh
- **Search**: web_search_aichat.sh, web_search_perplexity.sh, web_search_tavily.sh, search_arxiv.sh, search_wikipedia.sh, search_wolframalpha.sh
- **Utilities**: get_current_time.sh, get_current_weather.sh
- **Communication**: send_mail.sh, send_twilio.sh

These tools significantly extend my capabilities beyond simple text generation, allowing me to interact with the system, access external information, and perform complex operations in a safe, controlled manner.
