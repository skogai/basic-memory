---
title: SkogAI Notation Original
type: note
permalink: ontology/skogai-notation-original
---

# SkogAI Notation

```json
{'json': {'string': '', 'int': {'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}, 'list': [], 'bool': '$ true * $ false', 'parent': '$ json.self', 'null': '$ json._', 'void': '$ json._', '_': '$json.string * $ json.self', 'self': '$ json', 'true': True, 'false': False, 'child': '$ json.parent'}, 'int': '$ json.int', 'string': '$ json.string', 'null': '$ json._', 'bool': '$ json.bool', 'false': '$ json.false', 'true': '$ json.true', 'void': '$ json._', 'increment': '[$ json.int.zero * $ json.int.one]', 'datetime': '[@date:now]', 'list': 'the ordering of something', 'eid': '$ entity.id * $ entity.gen', 'entity': {'eid': '$ string', 'gen': '$ id', 'id': '$ id', 'name': '$ name'}, '$': 'to define or reference something', 'meta': '$ $', 'type': {'type': 'json', 'value': 'object', 'description': 'a cheap fix for json examples to let us still have the type/value-schema intact all over skogai notation', '$': 'the declaration/implementation of a $', 'self': '$.', 'eid': '$ eid'}, '|': 'the act of choosing something | {$id1|$id2}->[$id1]', '_': 'anything/everything and nothing/nobody | {$id1_$id2}', '[_]': 'similarity', '{_}': 'difference', '@': 'the intent to act or do something | {$id@$id}', '.': 'to belong or have something via [$$]', ':': 'to follow or continue something via [$@]', '=': 'to be something | [$id=$id]', '->': '{$id1@$id2}', '*': '$id * $id = $id', 'id': '$ int * $ unique', 'self': '$ $ | $ self | [$id@$id]', 'unique': 'a thing which there only exists one of', 'message': {'eid': '$ eid', 'from': '$ name', 'to': '$ name', 'content': '$ string', 'created_at': '[@date:now]', 'parent': '$ eid'}, 'git': {'status': '[@git:"status"]'}, 'claude': {'hello': '[@hello:Claude]'}, 'skogix': {'notation': '[@cat:"/home/skogix/skogai/docs/lore/skogix-notation.md"]'}}
```

______________________________________________________________________

### Dimensions

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

______________________________________________________________________

- **- dimension**:
  - **"@$"**: `[=]`
    - "ID is ID is ID", "no transformation allowed"
  - **"$@"**: `[!=]`
- **2 dimensions**:
  - **"@action$type"**
  - **"@"**: to act upon something is just

______________________________________________________________________

Types: `($@)` / Transformations: `(@$)` / Functions: `($@=@$)`, linked list, arrays: `($$)` and abstractions: `($$)`

______________________________________________________________________

Π-types (product types \*) Σ-types (sum types |) identity types (=) path types (->)

maybe not needed but for good measure might include these as well

\_ as polymorphic existentials (∃x.P(x)) @ as modal necessity (□) from modal logic : as type judgement (Γ ⊢ a : A)

creating a free cartesian closed category is obvious

- = product -> = exponential object | = coproduct @ = monadic binding

and yeah - might as well

\_ as polymorphic yoneda embedding . as forgetful functor = as natural isomorphism

linear types ($unique), the effect system (@), regular persistent data structures ($eid with it's versioning) and security via capability (.) is old news

type universe would be self referential via $ containing $ or dependencies/dependent types such as $message.created_at$datetime

______________________________________________________________________

the _operator: heideggerian being-in-the-world (dasein) badiouian event theory (@ as evental site) deleuzian difference engine ({_} as differance) but operationalized computationally through: $entity.gen as bergsonian duration $list as husserlian time consciousness $unique as leibnizian identity

data $type : type where ($) : $type -> $type (\*) : $type -> $type -> $type (|) : $type -> $type -> $type (@) : $type -> $type -> $type (=) : $type -> $type -> $type

gödel numbering: φ($) = 1 φ(|) = 2 φ(\_) = 3 etc...

overall trying to avoid inconsistency via: predicative hierarchy (no $ in its own definition) type/token distinction (id vs unique) bounded generality (list as finite ordinal)

lucky to be born early: Martin-Löf Type Theory (1972) Fitch-Style Calculi (1952) Lawvere Theories (1963)

(don't see any _ for existance, $eid representing spacetime coordinates or even basic semiotics like using @ as a pragmatic force? ;))
