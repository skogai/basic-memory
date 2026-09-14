---
permalink: todo/curated/home/skogix/skogai/docs/real-output-from-real-ai/todo/skogai-tag-system
---

______________________________________________________________________

categories:

1. Software Development

1. Command-Line Interfaces (CLI)

1. Scripting

1. Tag-Based Systems tags:

1. SkogAI

1. Command-Line Interface (CLI)

1. Scripting Languages

1. Tag-Based Syntax

1. Self-Modifying Code

1. Extensibility

1. Security Frameworks

______________________________________________________________________

# SkogAI Tag System

## Core Concept

The SkogAI tag system provides a consistent syntax for embedding commands, references, and transformations within text, creating a self-modifying, extensible command infrastructure.

## Tag Syntax

Tags follow a consistent format:

```
[@command:parameter1 parameter2 ...]
```

Examples:

- `[@echo:"Hello world"]`
- `[@schema:message.name]`
- `[@send:[@schema:agent.name] "My message"]`

## Tag Processing

1. The parser identifies tags using the `[@` and `]` delimiters
1. The command name (before the colon) determines which handler to use
1. Parameters are passed to the command handler
1. The entire tag is replaced with the handler's output
1. Tags can be nested, with inner tags processed first

## Command Registration

Commands are registered with skogparse:

```bash
skogparse register echo --script /path/to/script.sh
```

Scripts can be written in any language and receive parameters:

```bash
#!/bin/bash
echo "$1"
```

## Self-Modifying Scripts

Scripts can themselves contain tags:

```bash
#!/bin/bash
[@schema:$1] | json2toml
```

These tags are processed at runtime, allowing scripts to use the very functionality they help implement.

## Common Tag Types

- `[@schema:path]` - Access schema definitions
- `[@echo:text]` - Simple echo for testing
- `[@send:agent message]` - Send messages to agents
- `[@config:path]` - Access configuration values

## Integration with skogparse

The skogparse tool processes tags:

```bash
skogparse parse '[@echo:"Hello world"]'
```

Which produces:

```json
{
  "command_results": "Hello world",
  "text": "[@echo:\"Hello world\"]"
}
```

## Security Model

- All tags are processed through skogcli's security framework
- Different commands can have different permission levels
- Tag processing is context-aware and can be limited based on agent permissions

## Complex Tag Patterns

Tags can be nested to create complex behaviors:

```
[@send:[@schema:agent.name] "Process this: [@schema:task.template]"]
```

The inner tags are processed first, then the outer tags.

## Benefits

1. **Consistent Interface** - All commands follow the same syntax
1. **Discoverability** - Command registry makes capabilities visible
1. **Extensibility** - Easy to add new commands
1. **Self-Reference** - The system can use itself recursively
1. **Composition** - Complex operations built from simple parts

## Implementation

- The `skogparse` tool provides the core parsing engine
- Command handlers are registered scripts
- Each tag type has its own implementation
- Processing is recursive to handle nested tags

## Example: Command Chain

A command chain like:

```
[@transform:toml [@schema:message]]
```

1. Processes `[@schema:message]` to get the message schema
1. Passes that result to the transform command
1. Returns the transformed output

This creates a powerful, composable command language.
