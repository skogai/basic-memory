---
title: function-calls
type: note
permalink: skogai/todo/interfaces/aichat/function-calls
---

# AIChat Function Calls

## Overview

AIChat provides the ability to use function calls, allowing the AI to execute predefined functions to perform tasks beyond text generation. These functions enable capabilities like file operations, shell command execution, and accessing external tools.

## Prerequisites

For function calls to work properly in AIChat:

1. **Enable function calling**:

   ```yaml
   function_calling: true
   ```

1. **Disable streaming for some LLMs**: Some LLMs (like Claude models) may not properly support function calling in stream mode.

   ```yaml
   stream: false
   ```

1. **Function definitions**: Functions must be defined in the appropriate location:

   ```
   <aichat-config-dir>/functions/functions.json
   ```

## Available Functions

AIChat comes with built-in functions for file system operations:

- `fs_cat` - Read the contents of a file
- `fs_ls` - List directory contents
- `fs_mkdir` - Create a directory
- `fs_rm` - Remove a file or directory
- `fs_write` - Write to a file

Additionally, the `execute_command` function allows running shell commands.

These functions must be explicitly enabled in the `use_tools` setting:

```yaml
use_tools: fs,execute_command
```

## Custom Functions with llm-functions

The llm-functions framework (located in the `tools` directory) provides additional custom functions that can be used within AIChat:

1. **Build the tools**:

   ```bash
   ./scripts/argc-tool.sh build
   ```

1. **Link to AIChat**:

   ```bash
   ./scripts/argc-tool.sh link-to-aichat
   ```

1. **List available tools**:

   ```bash
   ./scripts/argc-tool.sh list@tool
   ```

## Troubleshooting

Common issues with function calls:

1. **Interruptions with streaming**:

   - Disable stream mode with `.set stream false`

1. **Missing function definitions**:

   - Check if the functions directory is properly linked
   - Rebuild tools with `./scripts/argc-tool.sh build`

1. **Irrelevant queries**:

   - Ensure your queries are relevant to the available functions

1. **Confirmation prompts**:

   - Some functions (like `execute_command`) may require confirmation
   - This can interrupt the function execution flow

## Examples

Using built-in file system functions:

```
Please list the files in the current directory.
```

Using custom functions from llm-functions:

```
Please search the web for information about SkogAI.
```

## References

For more information on the llm-functions framework that provides custom functions:

- [LLM Functions Documentation](../../tools/llm-functions.md)
