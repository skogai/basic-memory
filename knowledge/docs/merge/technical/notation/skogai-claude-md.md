---
title: claude-md
type: note
permalink: ontology/claude-md
---

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is the project where we both decide what parser rules should exist as well as discuss if they make sense overall and work together with what we are parsing: skogai notation.

## Working Instructions

- Update CLAUDE.md essentially every message in small increments often
- Build understanding incrementally as we work

### Best Practices for skogcli and skogparse

- Use single quotes `'...'` by default - write what you want the end result to be
- Only use double quotes `"..."` when you have a reason to or want it read as a literal string
- **RULE: NEVER USE ' OR " EVER IN ACTUAL CONTENT**

## Tools

### skogcli config

Simple key-value store in a JSON file:

- `skogcli config get <key>` - retrieves value by key path
- `skogcli config set <key> <value>` - stores value at key path
- `skogcli config get <key> --raw` - retrieves raw stored value without executing
- Dot notation creates nested JSON objects (e.g., `foo.bar.baz` → `{"foo":{"bar":{"baz":"value"}}}`)

Example:

```bash
skogcli config set '$.claude.hello' '[@hello:Claude]'
skogcli config get '$.claude.hello'          # Returns void (reference, not invocation)
skogcli config get '$.claude.hello' --raw    # Shows [@hello:Claude]
```

**Key concept**:

- `skogcli` is like `Datetime.Now` - references definitions without executing
- `skogparse-bin --execute` is like `Datetime.Now()` - actually invokes and executes

**View all definitions**:

```bash
skogcli config get '$'    # Shows entire runtime configuration
```

## Skogai Notation

### All Runtime Definitions

From `skogcli config get '$'`:

#### Operators

- `$.$` = to define or reference something
  - Example: `$claude` is a reference to the definition of what `claude` is
  - Even when `claude` is not in the configuration, `$claude` is still a valid reference (points to void/null)
- `$.*` = $id * $id = $id
  - The `*` operator uses multiplicative identity (like `x * 1 = x`)
  - Works with types that have multiple identity functions
  - Example: `$ int * $ unique` works because int has identity elements (0, 1) to generate from
  - In category theory: product types (Π-types)
- `$.@` = the intent to act or do something | {$id@$id}
  - Example: `[@todo:skogix:"i must do foo"]` - the intent to create a todo for skogix with content "i must do foo"
  - Example: `[@certainty:"95":"i am almost sure that bar will happen"]` - the intent to express certainty level "95" with content "i am almost sure that bar will happen"
  - Note: Actions require arguments - `[@claude.hello:_]` invokes with void/unit (like `Foo()` in programming)
- `$.|` = the act of choosing something | {$id1|$id2}->[$id1]
  - Example: `{$mode.verbose | $mode.quiet}` - choosing between different modes collapses into one selected mode
  - The pattern shows: difference (choice space) collapses via choosing into similarity (single result)
  - In programming: similar to union types or disjoint union
- `$._` = anything/everything and nothing/nobody | {$id1\_$id2}
  - Example: `$user._` - no user (null) or any user (wildcard)
  - Example: `$type._` - no type (void) or all types (any)
  - In JSON implementation: `json.string * json` = empty string (nothing) and all json types (everything)
  - Represents both extremes: the universal wildcard and the null/void
- `$.[_]` = similarity
  - Example: `[$mode.verbose, $mode.quiet, $mode.debug]` - showing things that are similar (all modes)
  - Intent: emphasize what they have in common
- `$.{_}` = difference
  - Example: `{$int.52, $string."foo", $bool.true}` - showing things that are different (different types)
  - Intent: emphasize variety/distinction between things
- `$..` = to belong or have something via [$$]
  - Example: `$user.profile` - profile belongs to user (profile knows its parent is user)
  - Example: `$entity.id` - id belongs to entity
  - The right side knows what itself is because of what the left side is (child knows parent)
- `$.:` = to follow or continue something via [$@]
  - Example: `a:b:c` - linked list where a points to b, b points to c (each knows the next)
  - Example: `[@hello:claude]` - hello acts upon claude (left knows about right)
  - Example: `[@claude.hello:_]` - invoke the hello that belongs to claude with void/unit argument
  - Unlike `.` where right knows left, `:` means left knows right (forward chain)
- `$.=` = to be something | [$id=$id]
  - Example: `[$id=$id]` - identity equals itself (identity type/morphism)
  - Expresses the fundamental reflexive property - something is what it is
  - In type theory: the identity type
  - In category theory: the identity morphism
- `$.->` = {$id1@$id2}
  - Example: `$claude->$hello` - claude influences hello, but hello doesn't influence claude (one-way)
  - Example: `$int->$int` - the identity function on integers (like `1+0=1` or `2*1=2` - no change)
  - The exception: when the identity function acts upon itself, no transformation occurs
  - Shows directional flow/transformation, but identity morphisms preserve the original

### Fundamental Duality: $ and @

The entire notation is built on the distinction between positive and negative space:

**`$` (Positive Space / Being):**

- Defining something from what you have
- Being, value, implementation, instantiated, existing, measurable
- The "plus" side - actually existing things
- References point to what exists

**`@` (Negative Space / Not-Being):**

- Defining something from what you are missing
- Difference, transformation, unmeasurable, abstract, potential
- The "minus" side - what could be, actions, changes
- Actions create change, transform, generate difference

This duality explains why:

- `$` references things (points to what is)
- `@` acts on things (creates what could be)
- `$id` represents measurable existence
- `[@action]` represents transformative potential

#### Basic Types ($.json namespace)

- `$.json.string` = ""
- `$.json.int` = { additative: 0, multiplicative: 1, one: 1, zero: 0 }
- `$.json.list` = []
- `$.json.bool` = $ true * $ false
- `$.json.true` = true
- `$.json.false` = false
- `$.json.null` = $ json.\_
- `$.json.void` = $ json.\_
- `$.json._` = $json.string * $ json.self
- `$.json.self` = $ json
- `$.json.parent` = $ json.self
- `$.json.child` = $ json.parent

#### Type References

- `$.int` = $ json.int
- `$.string` = $ json.string
- `$.null` = $ json.\_
- `$.bool` = $ json.bool
- `$.false` = $ json.false
- `$.true` = $ json.true
- `$.void` = $ json.\_

#### Core Definitions

- `$.id` = $ int * $ unique
  - More generally: `$measurable * $unique` or `$measurable _ $like-everyone-else`
  - The paradox: having at least two identity functions is what allows uniqueness
  - `$int` works because it has multiple identity elements (additative: 0, multiplicative: 1)
  - `$datetime` also works (temporal occasions generate uniqueness via progression)
  - `$string` and `$list` only have one identity (empty), so cannot generate unique ids
  - To be unique, you must first be able to "not be unique" (have multiple identities to choose from)
- `$.unique` = a thing which there only exists one of
- `$.self` = $ $ | $ self | [$id@$id]
- `$.meta` = $ $
- `$.list` = the ordering of something
- `$.increment` = [$ json.int.zero * $ json.int.one]
- `$.datetime` = [@date:now]
- `$.eid` = $ entity.id * $ entity.gen

#### Structures

**$.entity:**

- eid = $ string
- gen = $ id
- id = $ id
- name = $ name

**$.message:**

- eid = $ eid
- from = $ name
- to = $ name
- content = $ string
- created_at = [@date:now]
- parent = $ eid

**$.type:**

- type = json
- value = object
- description = a cheap fix for json examples to let us still have the type/value $-keys
- $ = the declaration/implementation of a $
- self = $.
- eid = $ eid

## skogparse

`skogparse-bin` parses skogai notation and outputs typed AST as JSON.

**Correct usage:**

```bash
skogparse-bin <file> --execute
```

Example with echo:

```bash
echo '[[@foo],$ bar,true,52,[],{}]' | skogparse-bin
```

Output types:

- `[@foo]` → `{"type": "action", "parts": ["foo"]}`
- `[@hello:Claude]` → `{"type": "action", "parts": ["hello", "Claude"]}`
- `$ bar` → `{"type": "ref", "path": "bar"}`
- `true` → `{"type": "bool", "value": true}`
- `52` → `{"type": "number", "value": 52}`
- `[]` → `{"type": "array", "value": []}`
- `{}` → `{"type": "object", "value": {}}`

**Note:** Actions require brackets - `@foo` alone will not parse, must use `[@foo]` or `[@name:arg]` syntax.

### Notation difference: skogcli vs skogparse

- **skogcli**: Uses `$.foo.bar` notation (with `.` after `$`)
- **skogparse**: Uses `$foo` or `$ foo` notation (without `.` after `$`)
- `"$foo"` inside quotes → still parsed as reference
- `"$.foo"` inside quotes → literal string (invalid reference syntax)
- `$.foo` outside quotes → would break

**Best practice:**

- Use `$.foo` with skogcli
- Use `$ foo` (with space) for parsing with skogparse
- `$foo` works with both but has annoying problems

### --execute flag

`skogparse-bin --execute` evaluates references by looking them up in skogcli config:

```bash
echo '$ id' | skogparse-bin           # Returns {"type": "ref", "path": "id"}
echo '$ id' | skogparse-bin --execute # Resolves to actual definition from $.id
```

With `--execute`, `$ id` expands to `$ int * $ unique` and recursively resolves those references to their full definitions.
