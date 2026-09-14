---
title: SkogAI Tool Architecture
type: note
permalink: concepts/skog-ai-tool-architecture
tags:
  - '#architecture'
  - '#tools'
  - '#design-patterns'
---

# SkogAI Tool Architecture

SkogAI implements an elegant modular tool system that enables AI assistants and humans to interact with various capabilities through a consistent interface.

## Core Components

- **Tool Scripts**: Simple shell scripts (or other executables) with standardized declarations
- **argc Parser**: Processes tool declarations and handles argument parsing
- **MCP (Model Context Protocol)**: Serves tools to various interfaces including function calls, HTTP APIs, and CLI

## Key Design Patterns

The architecture follows several powerful design patterns:

1. **Declarative Tool Definitions**: Tools self-describe through special comments
1. **Multi-Interface Accessibility**: The same tools are available through different interfaces
1. **Standardized I/O**: Consistent patterns for input parameters and output handling
1. **Dynamic Registration**: Tools can be added without modifying core systems

## Implementation Example

A typical tool script looks like:

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

## Benefits

This architecture provides several significant advantages:

- **Simplicity**: Easy to create new tools with minimal boilerplate
- **Consistency**: Uniform experience across different interfaces
- **Extensibility**: New capabilities can be added without system modifications
- **Maintainability**: Single source of truth for each tool's implementation

## Integration with AI Assistants

The MCP server translates tool scripts into function declarations that AI assistants can directly call, creating a seamless bridge between human-written tools and AI capabilities.

## observations

- [principle] Simple, consistent patterns enable complex integrations #design #composability
- [technique] Special comments provide declarative interface definitions #documentation #self-describing
- [fact] The argc system converts script declarations into standardized schemas #interoperability
- [decision] Choosing bash scripts as the foundation enables wide compatibility #accessibility
- [principle] Separating tool implementation from interface concerns improves maintainability #architecture
- [fact] MCP server acts as a bridge between tools and various interaction interfaces #integration

## relations

- part_of \[[skogai-ecosystem]\] (tool architecture is a fundamental component)
- relates_to \[[memory-system]\] (provides consistent access to memory operations)
- implements \[[extensibility-pattern]\] (enables adding features without modifying core)
- extends \[[command-line-tools]\] (builds upon standard Unix tool philosophy)
