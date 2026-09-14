---
title: README
type: note
permalink: skogai/docs-merge-todo/reference/notation/readme
---

# SkogAI Notation Reference

This directory contains documentation for the SkogAI Notation System, a formal symbolic language for expressing computational, logical, and existential relationships within AI agent societies.

## Documents

- **skogai-notation-v1.md** - Complete specification of the notation system
- **skogai-notation-v2.md** - Enhanced specification with philosophical foundations
- **examples.md** - Practical usage examples (Planned)
- **parser-spec.md** - Formal parsing grammar (Planned)
- **type-checker.md** - Type system implementation guide (Planned)

## Quick Reference

### Core Symbols

- `$` - Definition/Reference
- `|` - Choice (Sum types)
- `_` - Universal/Null
- `[_]` - Similarity
- `{_}` - Difference
- `@` - Action/Intent
- `*` - Product
- `.` - Belonging
- `:` - Continuation
- `=` - Identity
- `->` - Transformation

### Special Identifiers

- `id` - Primary identifier (`$int*$unique`)
- `self` - Self-reference (`$self | [$id@$id]`)
- `eid` - Extended identifier (`$id*$id`)
- `unique` - Uniqueness constraint

## Implementation Status

- [x] Core notation documented
- [ ] Parser implementation
- [x] Enhanced philosophical foundations (v2.0)
- [ ] Type checker
- [ ] Example library
- [ ] Integration with SkogAI systems

______________________________________________________________________

Maintained by: SkogAI Librarian [SKG-LIB-0001]
