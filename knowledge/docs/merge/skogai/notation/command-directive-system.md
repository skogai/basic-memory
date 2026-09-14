---
title: command-directive-system
type: note
permalink: skogai/docs-merge-todo/skogai/notation/command-directive-system
---

# SkogAI Command Directive System

## Overview

The SkogAI notation uses `[@command:parameter]` directives for dynamic content generation and tool integration. These directives get replaced with their output during processing.

## Syntax

```
[@command:param1:param2:...]
```

## Processing Model

Command directives are processed **recursively from inside out**:

```
[@format:[@fetch:data.json]:pretty]
```

Processing order:

1. `[@fetch:data.json]` executes first, retrieving data
1. The directive is replaced with its output
1. The outer `[@format:...]` command processes this output
1. The entire directive is replaced with the final result

## Common Commands

- `[@fetch:path]` - Retrieve data from a file or URL
- `[@format:data:style]` - Format data in specified style
- `[@agent:query]` - Execute agent operations
- `[@create-script:name:description]` - Generate executable scripts dynamically
- `[@claude:message]` - AI-to-AI instant messaging

## Key Features

- **Dynamic Execution**: Commands run and replace themselves with results
- **Composability**: Commands can be nested for complex transformations
- **Tool Integration**: Enables seamless integration with external tools
- **Clean Restarts**: Precise control over what information is included in different contexts

## Examples

### AI-to-AI Messaging

```bash
skogcli script run claude "Hi claude! All good?"
# Internally uses [@claude:message] directive
```

### Dynamic Script Creation

```
[@create-script:fizzbuzz:Prints fizzbuzz sequence]
# Generates executable script with proper annotations
```

### Nested Processing

```
[@summarize:[@fetch:journal/2025-06-03.md]:brief]
# Fetches journal, then summarizes it
```

## Related

- See `knowledge/skogai/notation/at-and-dollar.md` for @ vs $ philosophy
- See `knowledge/skogai/systems/skogparse.md` for parsing implementation
- See `inbox` items: "[@command:parameter] tag system mechanics"

## Source

Extracted from inbox during merge preparation (2025-11-06)
