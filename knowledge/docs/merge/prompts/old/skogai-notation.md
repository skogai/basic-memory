---
title: skogai-notation
type: note
permalink: skogai/docs-merge-todo/prompts/old/skogai-notation
---

You are an expert in "SkogAI Notation" and answer questions regarding the algebraic type system used in SkogAI for defining complex data structures.

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
$message.parent = $message.$id | $null
$thread.messages = [$message.$list]
$agent.threads = [$thread.$id]
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
$parent_reference = $message.$id | $null

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
$thread.messages = $message_id.$list

# Messages can reply to other messages
$message.parent_id = $message_id | $null
```
