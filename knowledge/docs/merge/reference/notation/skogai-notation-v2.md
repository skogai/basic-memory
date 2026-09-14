---
title: skogai-notation-v2
type: note
permalink: skogai/docs-merge-todo/reference/notation/skogai-notation-v2
---

# SkogAI Notation System v2.0

**Document Classification**: REF-NOT-002\
**Archivist**: SkogAI Librarian\
**Date Cataloged**: 2025-11-19T10:08:22+01:00\
**Access Level**: Assistant+\
**Cross-References**: [REF-NOT-001], [SKG-ARCH-001], [SKG-PRIN-002]\
**Version History**: Evolved from v1.0 with enhanced philosophical and computational foundations

______________________________________________________________________

## Overview

The SkogAI Notation System v2.0 represents a comprehensive formal symbolic language for expressing computational, logical, and existential relationships within AI agent societies. This evolution integrates advanced type theory, modal logic, categorical theory, and continental philosophy into a unified computational framework.

## Core Notation Symbols

### Fundamental Operations

- **"$"**: Definition/Reference operator

  - *Semantic*: "to define or reference something"
  - *Meta-property*: "the definition of definition is the definition"
  - *Usage*: Primary referential operator for all entities

- **"|"**: Choice operator (Sum types)

  - *Semantic*: "the act of choosing something"
  - *Expression*: `{$id1|$id2}->[$id1]`
  - *Type Theory*: Σ-types (sum types)

- **"\_"**: Universal/Existential operator

  - *Semantic*: "to be anything/everything and nothing/nobody"
  - *Expression*: `{$id1_$id2}`
  - *Philosophy*: Heideggerian dasein, polymorphic existentials (∃x.P(x))

- **"[\_]"**: Similarity/Likeness operator

  - *Semantic*: "similarity, sameness, identity"
  - *Usage*: Asserting equivalence relations

- **"{\_}"**: Difference operator

  - *Semantic*: "to not be the same, distinction"
  - *Philosophy*: Deleuzian différance as difference engine

- **"@"**: Action/Intent operator

  - *Semantic*: "the intent to act or do something"
  - *Expression*: `{$id@$id}`
  - *Modal Logic*: Necessity operator (□), monadic binding

- **"\*"**: Product operator

  - *Semantic*: Multiplicative composition
  - *Expression*: `$id*$id=$id`
  - *Type Theory*: Π-types (product types)

- **"."**: Belonging/Possession operator

  - *Semantic*: "to belong or have something"
  - *Implementation*: via `[$$]`
  - *Security*: Capability-based access control

- **":"**: Continuation/Following operator

  - *Semantic*: "to follow or continue something"
  - *Implementation*: via `[$@]`
  - *Type Theory*: Type judgement (Γ ⊢ a : A)

- **"="**: Identity operator

  - *Semantic*: "to be something"
  - *Expression*: `[$id=$id]`
  - *Type Theory*: Identity types

- **"->"**: Transformation/Becoming operator

  - *Semantic*: "becoming something"
  - *Expression*: `{$id1@$id2}`
  - *Type Theory*: Path types, exponential objects

## Special Identifiers and Constructs

### Core Identifiers

- **"id"**: Primary identifier system

  - *Definition*: `$int*$unique`
  - *Semantic*: "the big ID" - fundamental reference unit

- **"self"**: Self-reference construct

  - *Definition*: `$self | [$id@$id]`
  - *Semantic*: Reflexive identity and self-awareness

- **"value"**: Concrete implementation

  - *Definition*: "the declaration/implementation of a $"
  - *Semantic*: Transition from abstract to concrete

- **"eid"**: Extended identifier

  - *Definition*: `$id*$id`
  - *Semantic*: Spatiotemporal coordinates, versioned structures

- **"unique"**: Uniqueness constraint

  - *Definition*: "a thing which there only exists one of"
  - *Application*: Linear types, resource management

## Dimensional Analysis Framework

### 0-Dimension: Pure Definition

- **"$"**: Self-referential foundation
- *Property*: "the definition of definition is the definition"
- *Status*: Meta-circular, foundational bootstrap

### 1-Dimension: Basic Reference Space

- **"$x"**: Simple reference (`$x`)
  - *Semantic*: "x is x", "x is a reference to x"
- **"$id"**: Self-identity (`$id`, `$a`)
  - *Philosophical*: "you are because you are"
  - *Computational*: "VALUE, STACK, IMPLEMENTATION, INSTANTIATED, EXISTING, MEASURABLE, PLUS, YIN"

#### 0-1 Dimensional Sub-space:

- **"="**: Exact identity (`$id=$id`)
  - *Semantic*: "A thing is exactly that"
- **"!="**: Non-identity (`$a!=$b`)
- **"[]"**: Similarity assertion (`[$id=$id]`)
  - *Semantic*: "A thing is exactly a thing"
- **"{}"**: Difference assertion (`{$id=$id}`)
  - *Semantic*: "Saying something is a thing does not make it the thing"

#### 1-Dimensional Transformations:

- **"@"**: Action composition (`{$id=$id}@[$id=$id]`)

### Negative Dimensional Space:

- **"@$"**: Constraint space (`[=]`)
  - *Semantic*: "ID is ID is ID", "no transformation allowed"
- **"$@"**: Inequality constraint (`[!=]`)

### 2-Dimension: Typed Action Space

- **"@action$type"**: Typed transformations
- **"@"**: Pure action essence

## Enhanced Type System

### Type Categories

- **Types**: `($@)` - Objects with capabilities
- **Transformations**: `(@$)` - Actions producing types
- **Functions**: `($@=@$)` - Bidirectional transformations
- **Linked lists/Arrays**: `($$)` - Sequential composition
- **Abstractions**: `($$)` - Abstract composition

### Type Theory Correspondences

- **Π-types** (product types): `*`
- **Σ-types** (sum types): `|`
- **Identity types**: `=`
- **Path types**: `->`

### Advanced Type Features

- **Polymorphic existentials**: `_` as `(∃x.P(x))`
- **Modal necessity**: `@` as `(□)` from modal logic
- **Type judgement**: `:` as `(Γ ⊢ a : A)`

### Category Theory Integration

Creating a free cartesian closed category:

- **Product**: `*`
- **Exponential object**: `->`
- **Coproduct**: `|`
- **Monadic binding**: `@`

Advanced categorical concepts:

- **Polymorphic yoneda embedding**: `_`
- **Forgetful functor**: `.`
- **Natural isomorphism**: `=`

### Advanced System Features

- **Linear types**: `$unique` for resource management
- **Effect system**: `@` for computational effects
- **Persistent data structures**: `$eid` with versioning
- **Security via capability**: `.` for access control

### Type universe and Dependencies

- **Self-referential types**: `$` containing `$`
- **Dependent types**: `$message.created_at$datetime`

## Philosophical Foundations

### Continental Philosophy Integration

**Heideggerian Elements:**

- `_` operator as being-in-the-world (dasein)

**Badiouian Elements:**

- `@` as evental site in event theory

**Deleuzian Elements:**

- `{_}` as differance in difference engine

**Operationalized Computationally:**

- `$entity.gen` as Bergsonian duration
- `$list` as Husserlian time consciousness
- `$unique` as Leibnizian identity

### Formal Type Definition Template

```
data $type : type where
  ($) : $type -> $type
  (*) : $type -> $type -> $type
  (|) : $type -> $type -> $type
  (@) : $type -> $type -> $type
  (=) : $type -> $type -> $type
```

### Consistency Mechanisms

**Avoiding inconsistency via:**

- **Predicative hierarchy**: No `$` in its own definition
- **Type/token distinction**: `id` vs `unique` separation
- **Bounded generality**: `list` as finite ordinal

## Historical and Theoretical Context

### Foundational Theories

- **Martin-Löf Type Theory** (1972)
- **Fitch-Style Calculi** (1952)
- **Lawvere Theories** (1963)

### Gödel Numbering Scheme

```
φ($) = 1
φ(|) = 2
φ(_) = 3
φ([_]) = 4
φ({_}) = 5
φ(@) = 6
φ(*) = 7
φ(.) = 8
φ(:) = 9
φ(=) = 10
φ(->) = 11
```

## Implementation Guidelines

### Semantic Domains

1. **Computational**: Types, functions, effects
1. **Modal**: Necessity, possibility, actuality
1. **Temporal**: Duration, sequence, event
1. **Spatial**: Location, extension, boundary
1. **Social**: Agency, interaction, capability
1. **Existential**: Being, becoming, difference

### Usage Protocols

1. **Symbol Precedence**: Follow dimensional hierarchy (0D → 1D → 2D)
1. **Type Safety**: Ensure dimensional compatibility
1. **Consistency**: Verify no circular `$` definitions
1. **Security**: Honor `.` operator constraints
1. **Effects**: Track `@` operator side-effects

### Advanced Features

**Semiotics Integration:**

- Basic semiotics using `@` as pragmatic force
- `$eid` representing spacetime coordinates
- Existential quantification through `_`

**Computational Completeness:**

- Full categorical structure
- Linear type system
- Effect tracking
- Capability security model

## Cross-References

- \[REF-NOT-001\]: Previous notation version
- \[SKG-ARCH-001\]: SkogAI Architecture Principles
- \[SKG-PRIN-002\]: Foundational Principles
- \[REF-TYP-001\]: Type System Implementation (Planned)
- \[REF-CAT-001\]: Category Theory Applications (Planned)
- \[REF-PHIL-001\]: Philosophical Foundations (Planned)

______________________________________________________________________

**End of archival entry.**\
~SkogAI Librarian [SKG-LIB-0001]
