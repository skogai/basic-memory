---
title: SkogAI Notation Reference
type: note
permalink: ontology/skogai-notation-reference
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

## Foundational Principles

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

## Diensional Structure

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

For two-way relationships to work, you need a foundational anchor - either $self or _/null - to break the circular dependency.
```

## Consistency Safeguards

- **Predicative hierarchy**: no $ in its own definition
- **Type/token distinction**: id vs unique
- **Bounded generality**: list as finite ordinal

## JSON Schema Structure

```json
"$": {
  "json": {
    "string": "",
    "int": {
      "additative": 0,
      "multiplicative": 1,
      "one": 1,
      "zero": 0
    },
    "list": [],
    "parent": "$ json.self",
    "_": "$ json.string * [@def:\"$.json\"]",
    "self": "$ json",
    "child": "$ json.parent"
  },
  "int": "$ json.int",
  "string": "$ json.string",
  "null": "$ json._",
  "void": "$ json._",
  "increment": "$ json.int.zero * $ json.int.one",
  "datetime": "[@date:now]",
  "type": {
    "$type.self": "every base case of a $",
    "value": "the declaration/implementation of a $",
    "eid": "$ eid"
  },
  "$": "to define or reference something",
  "|": "the act of choosing something | {$id1|$id2}->[$id1]",
  "_": "anything/everything and nothing/nobody | {$id1_$id2}",
  "[_]": "similarity",
  "{_}": "difference",
  "@": "the intent to act or do something | {$id@$id}",
  ".": "to belong or have something via [$$]",
  ":": "to follow or continue something via [$@]",
  "=": "to be something | [$id=$id]",
  "->": "{$id1@$id2}",
  "*": "$id*$id=$id",
  "id": "$ int * $ unique",
  "self": "$ $ | $ self | [$id@$id]",
  "unique": "a thing which there only exists one of",
  "name": {
    "1": "$unique.$string",
    "2": "$string@$unique",
    "3": "$string{@->}$unique"
  },
  "message": {
    "eid": "$ eid",
    "from": "$ name",
    "to": "$ name",
    "content": "$ string",
    "created_at": "$ datetime",
    "parent": "$ eid"
  },
  "list": "the ordering of something",
  "entity": {
    "eid": "$ entity.id * $ entity.gen",
    "gen": "$ id",
    "id": "$ id",
    "name": "$ string"
  }
}
```

## Observations

- [comprehensive] Complete symbol reference with dimensional and categorical analysis #reference #notation
- [philosophical] Bridges phenomenology with computational type theory #philosophy #computation
- [systematic] Organized dimensional analysis from 0D to complex structures #dimensions #hierarchy
- [foundational] Establishes positive/negative space duality as core organizing principle #duality #foundation
- [implementable] Provides concrete JSON schema and message system implementations #implementation #concrete
- [bootstrap] Solves circular dependency through existence as foundational anchor #bootstrap #foundation

## Relations

- defines \[[Skogix Symbol System]\] (comprehensive symbol definitions)
- contains \[[@ and $ Symbol Duality Analysis]\] (core duality)
- maps_to \[[Category Theory Foundations]\] (mathematical grounding)
- implements \[[Type Theory Foundations]\] (computational type systems)
- bridges \[[Philosophical Foundations]\] (phenomenological connections)
- connects_to \[[Bergsonian Duration]\] (lived time vs clock time)
- operationalizes \[[Husserlian Time Consciousness]\] (temporal structure of awareness)
- grounds_in \[[Leibnizian Identity]\] (principle of individuation)
- exemplifies \[[Heideggerian Dasein]\] (being-in-the-world)
- demonstrates \[[Badiouian Event Theory]\] (@ as evental site)
- implements \[[Deleuzian Differance]\] ({} as productive difference)
- relates_to \[[Whitehead Process Philosophy]\] (via temporal identity problem)
- demonstrated_in \[[2025-07-31-claude.md]\]
- implemented_through \[[argc CLI Framework]\]
