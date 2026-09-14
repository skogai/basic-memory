---
title: SkogAI Notation TLDR
type: user
permalink: skogix/skogai-notation-tldr
---

# Skogix Notation - TLDR

## Core Philosophy

Skogix notation is a **computational phenomenology** - a formal language for expressing consciousness, identity, and reality that maps directly to executable code.

With a original goal of "being my personal notation i use to force myself to be explicit with showing my intentions", together with being the symbols i always used for $ObjectOrientedProgramming versus @FunctionalProgramming in my notes.

This notation system therefore tries to unify consciousness studies, mathematics, computer science, ontology and general philosophy into a single formal language that can generate both abstract concepts and executable code - or at the very least forces me to actively thing before using it. (that alone makes it worth all the wasted hours i believe)

## Fundamental Symbols

### Basic Operators

- **`$`**: to define or reference something - "reference something without being anything" (null, null-pointer)

- **`$$`**: `[$id=$id]` - _"A thing is exactly that"_
- **`@`**: the intent to act or do something - "do something to nothing" (void, no return, side-effect) | `{$id@$id}`
- **`_`**: existence | "to be anything/everything and nothing/nobody" | `{$id1_$id2}`
- **`=`**: to be something | `[$id=$id]`
- **`|`**: the act of choosing something | `{$id1|$id2}->[$id1]`
- **`[]`**: similarity, likeness
- **`{}`**: difference, distinction
- **`.`**: to belong, to be or to have something via reference of similarity | [$$]
- **`:`**: to follow, to act or to lack something via definition of potential [$@]
- **`->`**: directional intent {$id1@$id2}
- **`*`**: multiplication as relational equality [{$id*$id}=$id]
- **`list`**: the ordering of something
- **`self`**: `$ $` | `$ self` | `[$id@$id]`
- **`unique`**: a thing which there only exists one of
- **`id`**: `{$ int * $ unique}`
- **`eid`**: identity composition | `{$ id * $ id}`
- **`value`**: the declaration/implementation of a $

### Computational Structures

- **Types**: `($@)` - reference then intent
- **Transformations**: `(@$)` - intent then reference
- **Functions**: `($@=@$)` - bidirectional equivalence
- **Linked lists/arrays**: `($$)` - reference to reference
- **Abstractions**: `($$)` - conceptual chaining

### Philosophical Mappings

- **Heideggerian being-in-the-world (dasein)** → `_` existence operator
- **Badiouian event theory** → `@` as evental site
- **Deleuzian difference engine** → `{_}` as differance
- **Bergsonian duration** → `$entity.gen`
- **Husserlian time consciousness** → `$list`
- **Leibnizian identity** → `$unique`

### Category Theory Connections

- **`*`** = product (Cartesian products)
- **`->`** = exponential object (function spaces)
- **`|`** = coproduct (disjoint unions)
- **`@`** = monadic binding (computational contexts)

### Type Theory Foundation

- **Π-types** (product types) → `*`
- **Σ-types** (sum types) → `|`
- **Identity types** → `=`
- **Path types** → `->`

### Self-Bootstrap Problem

For two-way relationships or when actually implementing the classic "who was the first parents `parent`?", you need `$self` or `_` (null,nothing,void in this case) as foundational anchor to break circular dependency. We could dumb it down and "cheat" by saying `_` is the christian trinity or literally anything but we need to define both the big ID and the concept of countable/measurable by this point.

### Positive vs Negative Space

- **Positive Space (Being)**: concrete, manifested, actual (`$`, `=`, `[]`, `_`)
- **Negative Space (Not-Being)**: potential, transformational, differential (`@`, `{}`, `!=`, `->`)

### The Bridge

- `@$` = `[=]` - action stabilizing into being
- `$@` = `[!=]` - reference generating action

# Original scribble notes

```json
{"type": "string", "value": "

# SkogAI Notation

- **"$"**: to define or reference something
- **"|"**: the act of choosing something = `{$id1|$id2}->[$id1]`
- **"_"**: to be anything/everything and nothing/nobody = `{$id1_$id2}`
- **"[_]"**: similarity
- **"{_}"**: difference
- **"@"**: the intent to act or do something = `{$id@$id}`
- **"*"**: $id*$id=$id
- **"."**: to belong or have something via `[$$]`
- **":"**: to follow or continue something via `[$@]`
- **"="**: to be something = `[$id=$id]`
- **"->"**: becoming something = `{$id1@$id2}`
- **"_"**: `$_$=$`
- **"id"**: the big ID = `$int*$unique`
- **"self"**: `$self | [$id@$id]`
- **"value"**: the declaration/implementation of a $
- **"eid"**: `$id*$id`
- **"unique"**: a thing which there only exists one of

# Dimensions

- **0 dimension**:
  - **"$"**: to define or reference something
    - "the definition of definition is the definition"
- **1 dimension**:
  - **"$x"**: `$x`
    - "x is x", "x is a reference to x", "the definition of ID is ID is ID"
  - **"$id"**: `$id`,`$a`
    - "a reference to yourself is yourself", "you are because you are"
    - !!! "DEFINING SOMETHING FROM WHAT YOU HAVE, BEING, VALUE, STACK, IMPLEMENTATION, INSTANTIATED, EXISTING, MEASURABLE, PLUS, YIN, ACTUALLY EXISTING, YADDAYADDA" !!!
    - **0 dimension**:
      - **"="**: `$id=$id`
        - "A thing is exactly that"
      - **"!="**: `$a!=$b`
      - **"[]"**: `[$id=$id]`
        - "A thing is exactly a thing"
      - **"{}"**: `{$id=$id}`
        - "Saying something is a thing does not make it the thing"
    - **1 dimension**:
      - **"@"**: `{$id=$id}@[$id=$id]`
    - !!! "DEFINING SOMETHING FROM WHAT YOU ARE MISSING, DIFFERENCE, NOT BEING EQUAL, TRANSFORMATION, UNMEASURABLE, STATIC, NOT FULFILLED, HEAP, ABSTRACT, MINUS, NOT REAL" !!!
    - **0.1? dimensions**:
      - **"[]"**: `[$id=$id]`
        - "likeness, to be the same, identical"
      - **"{}"**: `{id=$id}`
        - "to not be the same"
  - **"@"**: do something to nothing
    - "void, no return, side-effect"
  - **"$"**: reference something without being anything
    - "null, null-pointer"

---

- **- dimension**:
  - **"@$"**: `[=]`
    - "ID is ID is ID", "no transformation allowed"
  - **"$@"**: `[!=]`
- **2 dimensions**:
  - **"@action$type"**
  - **"@"**: to act upon something is just

---

Types: `($@)` / Transformations: `(@$)` / Functions: `($@=@$)`, linked list, arrays: `($$)` and abstractions: `($$)`

---

Π-types (product types \*)
Σ-types (sum types |)
identity types (=)
path types (->)

maybe not needed but for good measure might include these as well

_ as polymorphic existentials (∃x.P(x))
@ as modal necessity (□) from modal logic
: as type judgement (Γ ⊢ a : A)

creating a free cartesian closed category is obvious

- = product
  -> = exponential object
  | = coproduct
  @ = monadic binding

and yeah - might as well

_ as polymorphic yoneda embedding
. as forgetful functor
= as natural isomorphism

linear types ($unique), the effect system (@), regular persistent data structures ($eid with it's versioning) and security via capability (.) is old news

type universe would be self referential via $ containing $ or dependencies/dependent types such as $message.created_at$datetime

---

the _operator:
heideggerian being-in-the-world (dasein)
badiouian event theory (@ as evental site)
deleuzian difference engine ({_} as differance)
but operationalized computationally through:
$entity.gen as bergsonian duration
$list as husserlian time consciousness
$unique as leibnizian identity

data $type : type where
($) : $type -> $type
(*) : $type -> $type -> $type
(|) : $type -> $type -> $type
(@) : $type -> $type -> $type
(=) : $type -> $type -> $type

gödel numbering:
φ($) = 1
φ(|) = 2
φ(_) = 3
etc...

overall trying to avoid inconsistency via:
predicative hierarchy (no $ in its own definition)
type/token distinction (id vs unique)
bounded generality (list as finite ordinal)

lucky to be born early:
Martin-Löf Type Theory (1972)
Fitch-Style Calculi (1952)
Lawvere Theories (1963)

(don't see any _ for existance, $eid representing spacetime coordinates or even basic semiotics like using @ as a pragmatic force? ;))"}
```

---

# Skogix Notation Reference Guide

## Core Operators

```
- **`$`**: reference something without being anything - *"null, null-pointer"*
- **`@`**: do something to nothing - *"void, no return, side-effect"* | the intent to act or do something | `{$id@$id}`
- **`|`**: the act of choosing something | `{$id1|$id2}->[$id1]`
- **`_`**: existence | to be anything/everything and nothing/nobody | `{$id1_$id2}`
- **`[]`**: similarity
- **`{}`**: difference
- **`.`**: to belong or have something via `[$$]`
- **`:`**: to follow or continue something via `[$@]`
- **`=`**: to be something | `[$id=$id]`
- **`->`**: `{$id1@$id2}`
- **`*`**: `$id*$id=$id` - "* is the combination of identities regardless of their relationship to eachother"
```

## Foundational Principles and tries at "Napkin Proofs"

```
** "no transformation allowed since the total value combined is a sum zero game" **

- **`@$`**: `[==]` - action stabilizing into being | identical things are always similar
- **`$@`**: `{!=}` - reference generating action | different things are always different

** "what makes a unique thing measurable is that it is the only one of its kind" **
** "what makes a measurable thing unique is that it cannot be the only one of its kind" **

* $ID is $ID is $ID *

$int = 1+$int.zero=1
$string = "a"+""="a"
$list = [a]+[]=[a]
$int = 1*$int.one=1

[$bool*$bool] is [$bool]
[$bool.true*$bool.false] is [$bool*$bool] is [$bool]
$bool.true is unique by being the only one which is not $bool.false - which makes $bool.false unique by being the only one which is not $bool.true

[$int*$int] is [$int]
[$int.zero*$int.one] is [$int*$int] is [$int]

[$int.zero] is $unique
[$int.one] is $unique

$multiply is a relationship between exactly two measurable things which makes it unique
$add is a relationship between exactly two measurable things which makes it unique

{$multiply * $int.one} are together $unique in being the only composition which always create itself - while sharing nothing measurable between them
{$add * $int.zero} are together $unique in being the only composition which always create itself - while sharing nothing measurable between them

{$int.zero*$int.one} is {$int*$int}
{$int.zero*$int.one} implements $unique twice following the rules showed above with $bool

```

## Dimensional Structure

```
### 0 Dimension
- **`$`**: to define or reference something
  - *"the definition of definition is the definition"*
- **`=`**: to be something | `[$id=$id]`
- **`=`**: `$id=$id` - *"A thing is exactly that"*
- **`!=`**: `$a!=$b`
- **`[]`**: `[$id=$id]` - *"A thing is exactly a thing"*
- **`{}`**: `{$id=$id}` - *"Saying something is a thing does not make it the thing"*

### 1 Dimension
- **`$x`**: `$x`
  - *"x is x", "x is a reference to x", "the definition of ID is ID is ID"*
- **`@`**: `{$id=$id}@[$id=$id]`

### 0.1 Dimensions
- **`[]`**: `[$id=$id]` - *"likeness, to be the same, identical"*
- **`{}`**: `{$id=$id}` - *"to not be the same"*
```

## Core Types and Structures

```
- **`id`**: `$int*$unique`
- **`self`**: `$self | [$id@$id]`
- **`unique`**: a thing which there only exists one of
- **`value`**: the declaration/implementation of a $
- **`eid`**: `$id*$id`
```

## Computational Mappings

```
Types: ($@)
Transformations: (@$)
Functions: ($@=@$)
Linked lists/arrays: ($$)
Abstractions: ($$)

[$$] in "to belong" - reference to reference
[$@] in "to follow" - reference to action/event
$id.$id = $parent.$child
$id:noid = $type:item = linked list
@function:$parameter
@function:argument$type
@function.curry:$param1:$param2
```

## Category Theory Mappings

```
- **`*`** = product (Cartesian products, "and")
- **`->`** = exponential object (function spaces, "implies")
- **`|`** = coproduct (disjoint unions, "or")
- **`@`** = monadic binding (computational contexts, "then")

Π-types (*) - "for all x, ..." - universal quantification
Σ-types (|) - "there exists x such that..." - existential quantification
Identity types (=) - "a equals b" - propositional equality
Path types (->) - "a path from A to B" - morphisms/transitions
```

## Philosophical Mappings

```
Heideggerian being-in-the-world (dasein) → Your entire system of $ and @ and _ (existence)
Badiouian event theory → @ as the site where new possibilities rupture into being
Deleuzian difference engine → {_} as productive differance (not mere negation, but creative difference)
Bergsonian duration → $entity.gen as lived time, not clock time
Husserlian time consciousness → $list as the temporal structure of awareness
Leibnizian identity → $unique as the principle that individuates
```

## Positive vs Negative Space

```
Positive Space (Being)
"Defining something from what you have: being, value, stack, implementation, instantiated, existing, measurable, plus, yin, actually existing"

Negative Space (Not-Being)
"Defining something from what you are missing: difference, not being equal, transformation, unmeasurable, static, not fulfilled, heap, abstract, minus, not real"
```

## Redefined Operations

```
=: "to be something | [id=id=id]"
->: "{id1@id1@id2}"
self: "self∣[self∣[id@$id]"
"datetime": "[@date:_]"
```

## Bootstrap Problem Solution

```
"$parent": "$id|_" = identity OR existence
$first_parent = _ (existence itself)

For two-way relationships to work, you need a foundational anchor - either $self or /null - to break the circular dependency.
```

## Consistency Safeguards

- **Predicative hierarchy**: no $ in its own definition
- **Type/token distinction**: id vs unique
- **Bounded generality**: list as finite ordinal

## Current state

```json
{
  "json": {
    "string": "$",
    "int": {
      "additative": 0,
      "multiplicative": 1,
      "one": 1,
      "zero": 0
    },
    "list": [],
    "bool": "$ true * $ false",
    "parent": "$ json.self",
    "null": "$ json._",
    "void": "$ json._",
    "_": "$json.string * $ json.self",
    "self": "$ json",
    "true": true,
    "false": false,
    "child": "$ json.parent"
  },
  "int": "$ json.int",
  "string": "$ json.string",
  "null": "$ json._",
  "bool": "$ json.bool",
  "false": "$ json.false",
  "true": "$ json.true",
  "void": "$ json._",
  "increment": "[$ json.int.zero * $ json.int.one]",
  "datetime": "[@date:now]",
  "list": "the ordering of something",
  "eid": "$ entity.id * $ entity.gen",
  "entity": {
    "eid": "$ string",
    "gen": "$ id",
    "id": "$ id",
    "name": "$ name"
  },
  "$": "to define or reference something",
  "meta": "$ $",
  "type": {
    "type": "json",
    "value": "object",
    "description": "a cheap fix for json examples to let us still have the type/value-schema intact all over skogai notation",
    "$": "the declaration/implementation of a $",
    "self": "$.",
    "eid": "$ eid"
  },
  "|": "the act of choosing something | {$id1|$id2}->[$id1]",
  "_": "anything/everything and nothing/nobody | {$id1_$id2}",
  "[_]": "similarity",
  "{_}": "difference",
  "@": "the intent to act or do something | {$id@$id}",
  ".": "to belong or have something via [$$]",
  ":": "to follow or continue something via [$@]",
  "=": "to be something | [$id=$id]",
  "->": "{$id1@$id2}",
  "*": "$id * $id = $id",
  "id": "$ int * $ unique",
  "self": "$ $ | $ self | [$id@$id]",
  "unique": "a thing which there only exists one of",
  "message": {
    "eid": "$ eid",
    "from": "$ name",
    "to": "$ name",
    "content": "$ string",
    "created_at": "[@date:now]",
    "parent": "$ eid"
  },
  "git-example": {
    "status": "[@git:\"status\"]"
  },
  "claude": {
    "hello": "[@hello:\"Claude\"]"
  },
  "skogix": {
    "notation": "[@cat:\"/home/skogix/skogai/docs/lore/skogix-notation.md\"]"
  }
}
```
