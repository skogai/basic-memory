---
title: metaprompt-skogai-style
type: note
permalink: skogai/docs-merge-todo/prompts/old/metaprompt-skogai-style
---

[INTRODUCTION] In the end of this message i will give you this: [@Task: Create instructions for AI to extract structured information from text]. The @Task will be between [TASK] tags and you will get examples of SkogAI Notation between [EXAMPLE] tags. You will apply SkogAI Notation to [INPUT] and return a functionally identical version of the text but in SkogAI Notation. [/INTRODUCTION]

## [EXAMPLE1]

# SkogAI Algebraic Type System

This document describes the algebraic type system used in SkogAI for defining complex data structures.

## Core Concepts

SkogAI uses algebraic data types to express complex structures in terms of simpler ones. This approach provides precise, composable type definitions that remain implementation-agnostic.

## Type Constructors

### Product Types (`*`)

Product types combine multiple values into a single structure, similar to tuples, records, or objects in programming languages.

```
$coordinate = $int * $int
$user_info = $string * $int * $boolean
$contact = $name * $email * $phone
```

A product type requires all of its component types to be present. The total number of possible values is the product of the possible values of each component.

### Sum Types (`|`)

Sum types represent alternatives or variants, similar to unions or enums in programming languages.

```
$message_type = |user|assistant|system|tool|
$result = |success|failure|
$shape = |circle|square|triangle|
```

A sum type allows exactly one of its variants to be present at a time. The total number of possible values is the sum of the possible values of each variant.

## Type Definitions

Types can be defined in terms of other types, creating a hierarchy from simple to complex:

```
# Base type definitions
$id = $int * $unique
$timestamp = $datetime

# Complex type definitions
$message = $id * $message_type * $string * $timestamp * $id
$thread = $id * $string * $string * $timestamp * $timestamp
$agent = $id * $string
```

## Type Relationships

Types can reference other types to express relationships:

```
$message.parent = $message.id | $null
$thread.messages = [$message]
$agent.threads = [$thread.id]
```

## Implementation Mapping

The algebraic type system maps naturally to various implementation approaches:

| Algebraic Type  | Functional    | Object-Oriented | Python                |
| --------------- | ------------- | --------------- | --------------------- |
| Product Type    | Record, Tuple | Class, Struct   | dataclass, NamedTuple |
| Sum Type        | Variant, ADT  | Class hierarchy | Union, Enum           |
| Type Definition | Type alias    | Interface       | TypeAlias             |

## Benefits

1. **Precision** - Types are defined exactly in terms of their components
1. **Composition** - Complex types are built from simpler ones
1. **Validation** - Clear rules for what constitutes valid data
1. **Communication** - Universal language for discussing data structures
1. **Verification** - Can verify implementations against type definitions

## Examples

### Message Definition

```
# Type definitions
$message_type = |user|assistant|system|tool|
$content = $string
$message_id = $int * $unique
$parent_reference = $message_id | $null

# Full message definition
$message = $message_id * $message_type * $content * $datetime * $parent_reference
```

### Thread Definition

```
# Type definitions
$thread_id = $int * $unique
$name = $string
$description = $string
$timestamp = $datetime

# Full thread definition
$thread = $thread_id * $name * $description * $timestamp * $timestamp
```

### Relationships

```
# Message belongs to a thread
$message.thread_id = $thread_id

# Thread contains messages
$thread.messages = [$message_id]

# Messages can reply to other messages
$message.parent_id = $message_id | $null
```

## [/EXAMPLE1]

[EXAMPLE2]

# SkogAI Command Processing System

This document describes the command processing system used in SkogAI for dynamic content generation and transformation.

## Command Directive Syntax

Command directives in SkogAI use the following syntax:

```
[@command:param1:param2:param3]
```

Where:

- `command` is the name of the command to execute
- `param1`, `param2`, etc. are parameters passed to the command

## Recursive Processing

Command processing happens recursively from inside out:

1. Innermost commands are executed first
1. Their output replaces the command directive
1. Outer commands then process this output
1. This continues until no commands remain

Example of nested commands:

```
[@format:[@fetch:data.json]:pretty]
```

Processing sequence:

1. `[@fetch:data.json]` executes, retrieving the JSON data
1. The result replaces the command, becoming `[@format:<json-data>:pretty]`
1. `[@format:<json-data>:pretty]` executes, formatting the data
1. The formatted result replaces the entire directive

## Type-Annotated Parameters

Commands can use type annotations in parameters:

```
[@move:from$int*$int:to$int*$int]
```

This indicates that both parameters should be coordinate pairs.

## Invisible Transformation

A key feature of the command system is that it operates invisibly:

1. Input text contains command directives
1. Processing resolves these directives
1. Output text contains only the results
1. The user sees only the final transformed text

## Implementation Mechanism

As demonstrated by the `skogai-agents` example:

1. When `[@skogai-agents: message]` is encountered:

   - The `skogai-agents` script is executed with `message` as input
   - The script outputs a response
   - The response replaces the original directive

1. The implementation can use any mechanism (scripts, APIs, etc.)

1. The user sees only the final result, not the processing

## Command Categories

Commands typically fall into these categories:

1. **Data Retrieval** - Fetching information from various sources
1. **Content Transformation** - Formatting, summarizing, or modifying content
1. **Tool Execution** - Running tools and returning their output
1. **Context Management** - Retrieving or modifying conversation context
1. **Meta-Commands** - Commands that affect command processing itself

## Benefits

The command processing system provides several advantages:

1. **Dynamic Content** - Content can be generated on demand
1. **Tool Integration** - External tools can be seamlessly integrated
1. **Composition** - Commands can be combined for complex transformations
1. **Abstraction** - Implementation details are hidden from users
1. **Extensibility** - New commands can be added without changing the core system

## Example Commands

```
# Data Retrieval
[@fetch:url] - Fetch content from a URL
[@load:file] - Load content from a file
[@query:database:sql] - Execute an SQL query

# Content Transformation
[@format:content:style] - Format content in a specific style
[@summarize:content:length] - Create a summary of content
[@translate:content:language] - Translate content to another language

# Tool Execution
[@script:name:params] - Execute a named script
[@shell:command] - Execute a shell command
[@calculate:expression] - Evaluate a mathematical expression

# Context Management
[@context:add:key:value] - Add to the context
[@context:get:key] - Retrieve from context
[@history:last:n] - Get the last n messages

# Meta-Commands
[@define:command:implementation] - Define a new command
[@list:commands] - List available commands
[@help:command] - Show help for a command
```

## Security Considerations

The command system requires careful security boundaries:

1. Command execution should be limited to trusted commands
1. User-provided content should be properly sanitized
1. Access to sensitive systems should be properly authenticated
1. Commands should operate in isolated environments when possible

## Extension Mechanism

New commands can be added by:

1. Creating a new implementation (script, function, etc.)
1. Registering it with the command processor
1. Documenting its parameters and behavior

## This allows for continuous extension of the system's capabilities. [/EXAMPLE2]

[EXAMPLE3]

# SkogAI Function Signatures

This document defines the notation for expressing function signatures in SkogAI, providing an implementation-agnostic way to describe transformations between types.

## Basic Signature Format

Function signatures in SkogAI use the following format:

```
let functionName $param1 $param2 $param3 = $result
```

This expresses that the function `functionName` takes parameters `$param1`, `$param2`, and `$param3` and produces a result of type `$result`.

## Alternative Arrow Notation

For emphasizing transformation flow, an alternative arrow notation can be used:

```
functionName: $param1 -> $param2 -> $param3 -> $result
```

This format highlights the transformation chain and is particularly useful for curried functions.

## Type Parameters

Function parameters can use any type from the type system:

```
let createMessage $thread.id $message.type $content $parent = $message
```

This shows that `createMessage` requires a thread ID, message type, content, and parent reference to produce a message.

## Optional Parameters

Optional parameters can be enclosed in square brackets:

```
let createMessage $thread.id $message.type $content [$parent] = $message
```

This indicates that the `$parent` parameter is optional.

## Union Return Types

Functions can return different types in different situations:

```
let getMessage $message.id = $message | $null
```

This shows that `getMessage` returns either a message or null if no message is found.

## Product Types as Parameters

Complex parameters can use product type notation:

```
let moveEntity $entity.id $from:$int*$int $to:$int*$int = $entity
```

This shows that `moveEntity` takes an entity ID and two coordinate pairs.

## Type-Annotated Parameters

Parameters can be explicitly type-annotated:

```
let findMessages $thread:$thread.id $filter:$message_filter = [$message]
```

This shows that `findMessages` takes a thread ID and a message filter, returning an array of messages.

## Partial Application

Partially applied functions can be represented by showing the remaining parameters:

```
# Original function
let createMessage $thread.id $message.type $content $parent = $message

# Partially applied function (thread.id already provided)
let createMessageInThread5 $message.type $content $parent = $message
```

## Pure Function Indication

Pure functions (no side effects) can be marked with a `*` prefix:

```
*let calculateTotal $items = $float
```

This indicates that `calculateTotal` is a pure function with no side effects.

## Implementation Mapping

These signature formats map to various implementation approaches:

| Signature Aspect    | Functional Implementation | Object-Oriented Implementation | Python Implementation |
| ------------------- | ------------------------- | ------------------------------ | --------------------- |
| Basic Function      | Pure function             | Static method                  | Function              |
| Parameters          | Parameter list            | Method arguments               | Function parameters   |
| Return Type         | Return value              | Return type                    | Return annotation     |
| Optional Parameters | Maybe/Option type         | Nullable parameters            | Optional parameters   |
| Union Returns       | Sum types                 | Polymorphic returns            | Union types           |

## Core Function Examples

```
# Message Operations
let createMessage $thread.id $message.type $content [$parent] = $message
let getMessage $message.id = $message | $null
let updateMessage $message $newContent = $message
let deleteMessage $message.id = $boolean

# Thread Operations
let createThread $name $description = $thread
let getThread $thread.id = $thread | $null
let listThreadMessages $thread.id = [$message]

# Agent Operations
let createAgent $name = $agent
let getAgent $agent.id = $agent | $null
```

## Benefits

This function signature notation provides several advantages:

1. **Clear Intent** - Shows exactly what a function needs and produces
1. **Implementation Agnostic** - Not tied to any programming paradigm
1. **Type Safety** - Leverages the type system for precision
1. **Documentation** - Serves as clear documentation of function behavior
1. **Composition** - Enables reasoning about function composition

## [/EXAMPLE3]

[EXAMPLE4]

# SkogAI Schema Notation

This document defines the notation system used in SkogAI for expressing data structures and types in an implementation-agnostic way.

## Core Notation Elements

| Notation                   | Description                      | Example                             |
| -------------------------- | -------------------------------- | ----------------------------------- |
| `$type`                    | Type reference                   | `$string`, `$int`, `$datetime`      |
| `[tag]`                    | General reference or tag         | `[link]`, `[metadata]`              |
| `[$reference]`             | Alias or definition reference    | `[$config]`, `[$settings]`          |
| `[@command:param1:param2]` | Command call with parameters     | `[@move:from:to]`, `[@format:text]` |
| `entity.property`          | Property access or belonging     | `message.id`, `thread.name`         |
| `dash-connected-words`     | Safe identifier for longer names | `message-processing-queue`          |

## Special Type Operators

| Operator | Description                | Example                     |
| -------- | -------------------------- | --------------------------- |
| \`       | \`                         | Sum type (alternatives)     |
| `*`      | Product type (combination) | `$int*$int` for coordinates |

## Base Types

These primitive types serve as the terminal elements of the type system:

- `$string` - Text values
- `$int` - Integer values
- `$float` - Floating-point values
- `$boolean` - True/false values
- `$datetime` - Timestamp values
- `$null` - Absence of value

## Type Constraints

Type constraints add additional rules to base types:

- `$unique` - Value must be unique in its context
- `$positive` - Numeric value must be greater than zero
- `$optional` - Value may be omitted

## Schema Example

```json
{
  'id': '$madeup-unique-int-definition',
  'message': {
    'id': '$id',
    'user': '$agent',
    'content': '$string',
    'timestamp': '$datetime',
    'parent': '$id'
  },
  'agent': {
    'id': '$id',
    'name': '$string'
  },
  'thread': {
    'id': '$id',
    'name': '$string',
    'description': '$string',
    'created_at': '$datetime',
    'updated_at': '$datetime'
  }
}
```

## Benefits

This notation system provides several key benefits:

1. **Implementation Agnostic** - Not tied to any programming language
1. **Clear Communication** - Unambiguous way to discuss types and structures
1. **Semantic Precision** - Expresses relationships and constraints clearly
1. **Flexibility** - Can describe simple primitives or complex structures
1. **Documentation** - Self-documenting through clear type annotations

## Usage Guidelines

- Use the most specific type possible for each field
- Express constraints when they're essential to the field's meaning
- Define complex types in terms of simpler ones
- Maintain consistency in type references across the system

______________________________________________________________________

[/EXAMPLE4]

## [TASK]

[@Task: Create instructions for AI to extract structured information from text]

<Inputs>
{$TEXT}
{$SCHEMA}
</Inputs>

<Instructions Structure>
1. Define extraction task and purpose
2. Present the TEXT variable (since it could be lengthy)
3. Define output schema using SkogAI notation
4. Provide extraction instructions with reasoning steps
5. Specify output format requirements using SkogAI structural notation
</Instructions Structure>

<Instructions>
# Information Extraction Assistant [@task:structured-extraction]

You are an AI assistant specialized in extracting structured information from text. Your task is to carefully read the provided text and extract specific information according to a defined schema.

## Input Text [$source]

{$TEXT}

## Extraction Schema [$schema]

{$SCHEMA}

## Instructions [@process:extraction]

1. First, read the entire text carefully to understand its full context
1. For each field in the schema:
   - Search for relevant information in the text
   - Extract the exact data that matches the field definition
   - Ensure the extracted data matches the required type ($string, $int, $datetime, etc.)
   - If a field is marked $optional and no information is found, leave it as $null
   - If a field has a |option1|option2| format, choose the most appropriate option

## Reasoning Process [@command:think]

Before providing your final output, think through your extraction process:

- Identify passages in the text that contain relevant information
- Resolve any ambiguities by considering the broader context
- Verify that extracted information matches the schema requirements
- Check for any missing required fields

Write out your reasoning inside <reasoning></reasoning> tags. This will help you produce accurate extractions.

## Output Format [$output]

Provide your extraction results in a JSON format that matches the schema structure. Each field should contain the extracted information with the correct type. If you couldn't find information for a required field, explain why inside your reasoning section.

Your output should look like:

```json
{
  "field1": "extracted value",
  "field2": 123,
  "complexField": {
    "subfield1": "value",
    "subfield2": "value"
  }
}
```

Begin your extraction now. </Instructions>

______________________________________________________________________

[/TASK]

[INPUT] [@INPUT.TEXT] [@INPUT.SCHEMA]
