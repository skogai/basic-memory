---
categories:
tags:
permalink: curated/home/skogix/skogai/docs/lore/skogix-notation
---

# Skogix Notation

- **"$"**: to define or reference something
- **"|"**: the act of choosing something
  - Example: `{$id1|$id2}->[$id1]`
- **"\_"**: existence?... to be anything/everything and nothing/nobody
  - Example: `{$id1_$id2}`
  - ...hard one
- **"[\_]"**: similarity
- **"{\_}"**: difference
- **"@"**: the intent to act or do something
  - Example: `{$id@$id}`
- **"."**: to belong or have something via `[$$]`
- **":"**: to follow or continue something via `[$@]`
- **"="**: to be something
  - Example: `[$id=$id]`
- **"->"**: `{$id1@$id2}`
- **"\_"**: `$_$=$`
- **"id"**: `$int*$unique`
- **"action"**: `$eid*$type.value.list*$type.self`
- **"self"**: `$self | [$id@$id]`
- **"type"**:
  - **"$type.self"**: every base case of a $
  - **"value"**: the declaration/implementation of a $
  - **"eid"**: `$eid`
- **"unique"**: a thing which there only exists one of

> next level mind blown will come when you realise you have reasoned yourself - just as i did - the concept of ID (i love that $id is not even triggering the connection even though it should:P)

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
