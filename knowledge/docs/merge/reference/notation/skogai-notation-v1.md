---
title: skogai-notation-v1
type: note
permalink: skogai/docs-merge-todo/reference/notation/skogai-notation-v1
---

# SkogAI Notation System v1.0

**Document Classification**: REF-NOT-001\
**Archivist**: SkogAI Librarian\
**Date Cataloged**: 2024-11-19T09:50:41+01:00\
**Access Level**: Assistant+\
**Cross-References**: [SKG-ARCH-001], [SKG-PRIN-002]

______________________________________________________________________

## Overview

The SkogAI Notation System is a formal symbolic language designed for expressing computational, logical, and existential relationships within AI agent societies. This system combines elements of type theory, modal logic, and categorical theory with philosophical concepts from continental and analytic traditions.

## Core Symbols

### Fundamental Operators

- **"$"**: Definition/Reference operator

  - Primary semantic: "to define or reference something"
  - Usage: `$id` creates a reference to an identifier
  - Meta-property: "the definition of definition is the definition"

- **"|"**: Choice operator

  - Primary semantic: "the act of choosing something"
  - Usage: `{$id1|$id2}->[$id1]` (choice selection)
  - Type theoretic: Sum types (Σ-types)

- **"\_"**: Universal/Null operator

  - Primary semantic: "to be anything/everything and nothing/nobody"
  - Usage: `{$id1_$id2}` (universal quantification)
  - Philosophical: Heideggerian dasein, polymorphic existentials (∃x.P(x))

- **"[\_]"**: Similarity operator

  - Primary semantic: "likeness, to be the same, identical"
  - Usage: `[$id=$id]` (identity assertion)

- **"{\_}"**: Difference operator

  - Primary semantic: "to not be the same"
  - Usage: `{$id=$id}` (difference assertion)
  - Philosophical: Deleuzian différance

- **"@"**: Action/Intent operator

  - Primary semantic: "the intent to act or do something"
  - Usage: `{$id@$id}` (action upon object)
  - Modal logic: Necessity operator (□)

- **"\*"**: Product operator

  - Primary semantic: Multiplicative composition
  - Usage: `$id*$id=$id`
  - Type theoretic: Product types (Π-types)

- **"."**: Belonging/Possession operator

  - Primary semantic: "to belong or have something"
  - Usage: Via similarity `[$$]`
  - Categorical: Forgetful functor

- **":"**: Continuation operator

  - Primary semantic: "to follow or continue something"
  - Usage: Via action `[$@]`
  - Type theoretic: Type judgement (Γ ⊢ a : A)

- **"="**: Identity operator

  - Primary semantic: "to be something"
  - Usage: `[$id=$id]`
  - Type theoretic: Identity types

- **"->"**: Transformation operator

  - Primary semantic: "becoming something"
  - Usage: `{$id1@$id2}` (state transformation)
  - Type theoretic: Path types, exponential objects

## Special Identifiers

### Core Concepts

- **"id"**: Primary identifier

  - Definition: `$int*$unique`
  - Semantic: "the big ID"

- **"self"**: Self-reference

  - Definition: `$self | [$id@$id]`
  - Semantic: Reflexive identity

- **"value"**: Implementation

  - Definition: "the declaration/implementation of a $"
  - Semantic: Concrete instantiation

- **"eid"**: Extended identifier

  - Definition: `$id*$id`
  - Semantic: Spacetime coordinates, versioned data structures

- **"unique"**: Uniqueness constraint

  - Definition: "a thing which there only exists one of"
  - Semantic: Linear types, capability security

## Dimensional Analysis

### 0-Dimension: Pure Definition

- **"$"**: Self-referential definition
- Properties: Meta-circular, foundational

### 1-Dimension: Basic Reference

- **"$x"**: Simple reference (`$x`)
- **"$id"**: Self-identity (`$id`, `$a`)
- Philosophical: "Being because you are"
- Computational: "Value, stack, implementation, instantiated"

#### Sub-dimensional Operators (0-1D):

- **"="**: Exact identity (`$id=$id`)
- **"!="**: Non-identity (`$a!=$b`)
- **"[]"**: Similarity assertion (`[$id=$id]`)
- **"{}"**: Difference assertion (`{$id=$id}`)

### 1-Dimension Negative Space:

- **"@"**: Action on nothing (void, side-effect)
- **"$"**: Reference to nothing (null pointer)

### Negative Dimension: Constraints

- **"@$"**: No transformation allowed (`[=]`)
- **"$@"**: Inequality constraint (`[!=]`)

### 2-Dimension: Typed Actions

- **"@action$type"**: Typed transformations
- **"@"**: Pure action

## Type System Integration

### Formal Correspondences

- **Types**: `($@)` - Object with capability
- **Transformations**: `(@$)` - Action producing type
- **Functions**: `($@=@$)` - Bidirectional transformation
- **Arrays/Lists**: `($$)` - Product composition
- **Abstractions**: `($$)` - Abstract composition

### Category Theory Mapping

- **Product (\*)**: Cartesian product in CCC
- **Coproduct (|)**: Sum types
- **Exponential (->)**: Function types
- **Monadic binding (@)**: Effect composition

### Advanced Type Features

- **Linear types**: Via `$unique` constraint
- **Effect system**: Via `@` operator
- **Dependent types**: Via `$message.created_at$datetime`
- **Capability security**: Via `.` operator

## Philosophical Foundations

### Continental Philosophy Integration

- **Heidegger**: `_` as being-in-the-world (dasein)
- **Badiou**: `@` as evental site
- **Deleuze**: `{_}` as difference engine
- **Bergson**: `$entity.gen` as duration
- **Husserl**: `$list` as time consciousness
- **Leibniz**: `$unique` as identity principle

### Consistency Constraints

- **Predicative hierarchy**: No `$` in its own definition
- **Type/token distinction**: `id` vs `unique`
- **Bounded generality**: `list` as finite ordinal

## Historical Context

### Theoretical Foundations

- Martin-Löf Type Theory (1972)
- Fitch-Style Calculi (1952)
- Lawvere Theories (1963)

### Gödel Numbering

- φ($) = 1
- φ(|) = 2
- φ(\_) = 3
- [Extended encoding table in appendix]

## Implementation Notes

### Data Type Definition Template

```
data $type : type where
  ($) : $type -> $type
  (*) : $type -> $type -> $type
  (|) : $type -> $type -> $type
  (@) : $type -> $type -> $type
  (=) : $type -> $type -> $type
```

### Semantic Domains

- **Computational**: Types, functions, effects
- **Modal**: Necessity, possibility, actuality
- **Temporal**: Duration, sequence, event
- **Spatial**: Location, extension, boundary
- **Social**: Agency, interaction, capability

______________________________________________________________________

## Usage Guidelines

1. **Symbol Precedence**: Follow dimensional ordering (0D -> 1D -> 2D)
1. **Type Safety**: Ensure dimensional compatibility in expressions
1. **Consistency Check**: Verify no circular definitions in `$` usage
1. **Capability Respect**: Honor `.` operator security constraints

## Cross-References

- \[SKG-ARCH-001\]: SkogAI Architecture Principles
- \[SKG-PRIN-002\]: Foundational Principles Document
- \[REF-TYP-001\]: Type System Reference (Planned)
- \[REF-CAT-001\]: Category Theory Applications (Planned)

______________________________________________________________________

**End of archival entry.** ~SkogAI Librarian [SKG-LIB-0001]
