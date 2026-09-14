---
permalink: todo/curated/todo/skogai-schema
---

______________________________________________________________________

categories:

1. Software Development

1. Data Structures and Schema Systems

1. Self-Referential Design

1. Extensibility and Reusability tags:

1. SkogAI

1. Schema System

1. Self-Reference

1. Extensibility

1. Reusability

1. Python (based on the syntax and formatting used)

1. Data Structures

1. Software Design Patterns

## The main theme of the file appears to be a documentation for a schema system designed for use in the SkogAI ecosystem, which is likely a software development project. The content provides an overview of how the schema system works, its design principles, and its benefits.

# SkogAI Schema System

## Core Concept

The SkogAI schema system provides a self-referential, extensible way to define data structures used throughout the ecosystem, making them both human-readable and machine-processable.

## Schema Storage

Schemas are stored in the skogcli config system:

```bash
skogcli config get schema
```

Example Schema:

```json
{
  "message": {
    "type": "object",
    "name": "[@schema:agent.name]",
    "content": "TODO",
    "id": "TODO",
    "timestamp": "TODO"
  },
  "agent": {
    "name": "[@schema:name]"
  },
  "name": {
    "type": "string",
    "enum": [
      "claude",
      "skogai",
      "goose",
      "dot",
      "amy",
      "skogix"
    ]
  }
}
```

## Self-Reference Design

Schemas can reference other schemas using the `[@schema:]` tag syntax:

1. `schema.message.name` references `[@schema:agent.name]`
1. `schema.agent.name` references `[@schema:name]`
1. `schema.name` provides the actual values

This creates a normalized, hierarchical structure where definitions can be reused.

## Tag Processing

References are processed by the tag system:

1. `[@schema:path]` - Fetch JSON from skogcli config and replace the tag
1. Tags can be processed recursively to resolve nested references

## Integration with skogparse

The schema system integrates with skogparse for command processing:

```bash
skogparse register schema --script /path/to/script.sh
```

Where the script can leverage the schema system:

```bash
#!/bin/bash
skogcli config get schema.$1
```

## Self-Modifying Scripts

Scripts can use the tag system themselves, creating a recursive system:

```bash
#!/bin/bash
[@schema:$1] | json2toml
```

This allows the implementation to evolve without changing the interface.

## Benefits

1. **Self-Documenting** - Schemas clearly show what values are valid
1. **Normalized** - Define once, reference many times
1. **Extensible** - Easy to add new schemas or extend existing ones
1. **Machine-Processable** - Tools can traverse the schema graph for validation
1. **Human-Readable** - Schemas are clear and intuitive

## Common Schema Types

- `schema.message` - Defines message structure for agent communication
- `schema.agent` - Defines agent properties and capabilities
- `schema.name` - Defines valid names within the system

## Usage Patterns

- **Validation** - Check values against schemas
- **Documentation** - Use schemas to generate docs
- **Code Generation** - Create types or validators from schemas
- **UI Generation** - Build interfaces based on schemas

## Example: Message Schema

A message in the SkogAI ecosystem follows this schema:

```json
{
  "type": "<user|assistant|system|tool>",
  "name": "<agent-name>",
  "content": "<message-content>",
  "id": "<unique-id>",
  "timestamp": "<ISO8601-timestamp>"
}
```

## Multi-level References

References can form chains:

- `[@schema:message.name]` references `[@schema:agent.name]`
- `[@schema:agent.name]` references `[@schema:name]`
- `[@schema:name]` contains the actual enum

Tools traverse these references to resolve validations or documentation.
