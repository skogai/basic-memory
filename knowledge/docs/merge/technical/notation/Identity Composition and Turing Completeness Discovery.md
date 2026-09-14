---
title: Identity Composition and Turing Completeness Discovery
type: note
permalink: ontology/identity-composition-and-turing-completeness-discovery
---

# Identity Composition and Turing Completeness Discovery

## The Challenge

Successfully traced how skogai notation achieves Turing completeness through identity composition:

## Key Insights

### Identity Composition (`$id*$id=$id`)

- `$int` provides TWO identity elements: `additive: 0` and `multiplicative: 1`
- These create different contexts for uniqueness
- `$id = $int * $unique` works because `$int` provides the identity contexts
- `$eid = [$id * $id]` is legal because each `$id` can use different identity elements (0 vs 1)
- The product composes back to identity: `$id*$id=$id`

### Turing Completeness Requirements

Achieved through:

1. **Binary distinction**: 0 vs 1 from `$int` identity elements
1. **Recursion**: `$self` enables self-reference and fixed points
1. **Pattern matching**: `_` (existence) acts as universal matcher
1. **Unbounded computation**: Creating endless JSON objects as Peano numbers

### Parser Implementation

The parser is elegantly simple:

- Find `$key` patterns
- Replace with values (left→right, top→bottom, inside→out)
- Repeat until no `$` symbols remain
- NOT a JSON parser - JSON is just one type of literal
- Actions `[@action:params]` execute during parsing

### Actions as FFI

- `@` bridges notation to execution
- Actions can be implemented in ANY language (Python, Bash, etc.)
- Missing actions can be auto-generated via LLM (`[@create-script:...]`)
- Execution happens during parse time, not separate eval phase

### Processual vs Definitional

- Some types (numbers, strings) are definitional - have static identity
- Some types (time, randomness) are processual - require `@` actions
- `$datetime` MUST be `[@date:now]` - can't have static identity for time
- This reveals fundamental ontological distinctions in the notation

## Relations

- builds_on \[[Temporal Identity Problem in SkogAI Notation]\]
- demonstrates \[[Identity Composition Rules]\]
- enables \[[Parser as Macro Expander]\]
- reveals \[[Static vs Processual Types]\]
- implements \[[Turing Complete Notation System]\]

## Observations

- [insight] Identity composition works via dual identity contexts (0 and 1) #identity #composition
- [discovery] Turing completeness emerges from simple substitution + actions #turing #completeness
- [principle] Parser is just find-and-replace with action execution #parser #implementation
- [pattern] Actions execute during parsing, not in separate phase #execution #parsing
- [ontology] Notation discovers which domains are definitional vs processual #philosophy #types
