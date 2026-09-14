---
title: SkogAI Notation Formatted
type: note
permalink: ontology/skog-ai-notation-formatted
---

# SkogAI Notation

## Core Operators

| Operator | Definition | Example | | -------- | -------------------------------------- | ------------------------- | ---------------------- | | `$` | Define or reference something | `$id` | | `|` | Act of choosing something | `{$id1\|$id2}->[$id1]` | | `_` | Anything/everything and nothing/nobody | `{$id1_$id2}` | | `[_]` | Similarity | `[$id=$id]` | | `{_}` | Difference | `{$id=$id}` | | `@` | Intent to act or do something | `{$id@$id}` | | `*` | Product operation | `$id*$id=$id` | | `.` | Belong or have something | `[$$]` | | `:` | Follow or continue something | `[$@]` | | `=` | To be something | `[$id=$id]` | | `->` | Becoming something | `{$id1@$id2}` |

## Special Constructs

- **id**: The big ID = `$int*$unique`
- **self**: `$self | [$id@$id]`
- **value**: The declaration/implementation of a `$`
- **eid**: `$id*$id`
- **unique**: A thing which there only exists one of

## Dimensional Analysis

### Zero Dimension

**Core Reference**: `$` - to define or reference something

> "The definition of definition is the definition"

### One Dimension

**Identity Operations**:

- `$x` → "x is x", "x is a reference to x"
- `$id` → "a reference to yourself is yourself"

**Existential State**: _Defining something from what you have, being, value, implementation, instantiated, existing, measurable_

#### Sub-dimensional Operations

**Zero-level**:

- `=` → `$id=$id` ("A thing is exactly that")
- `!=` → `$a!=$b`
- `[]` → `[$id=$id]` ("A thing is exactly a thing")
- `{}` → `{$id=$id}` ("Saying something is a thing does not make it the thing")

**One-level**:

- `@` → `{$id=$id}@[$id=$id]`

**Fractional (0.1?) Dimensions**:

- `[]` → `[$id=$id]` (likeness, identical)
- `{}` → `{id=$id}` (not the same)

**Negational State**: _Defining something from what you are missing, difference, transformation, unmeasurable, abstract_

**Void Operations**:

- `@` → do something to nothing (void, side-effect)
- `$` → reference something without being anything (null pointer)

### Negative Dimension

- `@$` → `[=]` ("ID is ID is ID", no transformation allowed)
- `$@` → ``` [!=]`` ("ID is not ID is not ID, simple negation will not help) ```

### Two Dimensions

- `@action$type` → action intend to act on type
- `$type@action` → type can do action

## Type System

### Basic Types

- **Types**: `($@)`
- **Transformations**: `(@$)`
- **Functions**: `($@=@$)`
- **Linked lists/arrays**: `($$)`
- **Abstractions**: `($$)`

### Category Theory Mappings

#### Homotopy Type Theory

- **Π-types** (product types): `*`
- **Σ-types** (sum types): `|`
- **Identity types**: `=`
- **Path types**: `->`

#### Extended Interpretations

- `_` as polymorphic existentials: `∃x.P(x)`
- `@` as modal necessity: `□` (modal logic)
- `:` as type judgement: `Γ ⊢ a : A`

#### Cartesian Closed Category

- `*` = product
- `->` = exponential object
- `|` = coproduct
- `@` = monadic binding

#### Advanced Category Theory

- `_` as polymorphic yoneda embedding
- `.` as forgetful functor
- `=` as natural isomorphism

### Advanced Features

**Linear types**: `$unique` **Effect system**: `@` **Persistent data structures**: `$eid` with versioning **Security via capability**: `.`

**Type universe**: Self-referential via `$` containing `$` or dependent types like `$message.created_at$datetime`

## Philosophical Foundations

### Continental Philosophy Mappings

**The `_` operator**:

- **Heideggerian**: being-in-the-world (dasein)
- **Badiouian**: event theory (`@` as evental site)
- **Deleuzian**: difference engine (`{_}` as differance)

**Computational operationalization**:

- `$entity.gen` as Bergsonian duration
- `$list` as Husserlian time consciousness
- `$unique` as Leibnizian identity

## Formal Definition

```haskell
data $type : type where
  ($) : $type -> $type
  (*) : $type -> $type -> $type
  (|) : $type -> $type -> $type
  (@) : $type -> $type -> $type
  (=) : $type -> $type -> $type
```

## Gödel Numbering

```
φ($) = 1
φ(|) = 2
φ(_) = 3
...
```

## Consistency Measures

**Avoiding inconsistency via**:

- **Predicative hierarchy**: no `$` in its own definition
- **Type/token distinction**: `id` vs `unique`
- **Bounded generality**: `list` as finite ordinal

## Historical Context

**Foundational theories**:

- Martin-Löf Type Theory (1972)
- Fitch-Style Calculi (1952)
- Lawvere Theories (1963)

## Notes

Potential extensions could include `_` for existence, `$eid` representing spacetime coordinates, and basic semiotics using `@` as pragmatic force.
