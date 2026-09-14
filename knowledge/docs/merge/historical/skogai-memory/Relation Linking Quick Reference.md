---
title: Relation Linking Quick Reference
type: note
permalink: skogai-memory/relation-linking-quick-reference
---

# Relation Linking Quick Reference

**Purpose**: Add semantic relations between entities in the knowledge graph.

## Syntax

```markdown
## Relations
- relation_type [[Target Entity Title]]
- relation_type [[Another Entity]] (optional context)
```

## Primary Relation Types

**Hierarchical**:

- `contains` - Parent encompasses child
- `part_of` - Child belongs to parent
- `extends` - Builds upon or enhances

**Dependency**:

- `requires` - Must have prerequisite
- `depends_on` - Technical dependency
- `uses` - Employs or utilizes
- `enables` - Makes possible

**Associative**:

- `relates_to` - General connection (use sparingly)
- `affects` - Has impact on
- `pairs_with` - Complementary relationship
- `contrasts_with` - Opposite or alternative

**Implementation**:

- `implements` - Realizes specification
- `demonstrates` - Shows example
- `supports` - Provides support for

**Documentation**:

- `documents` - Provides documentation for
- `archives` - Preserves historical record
- `extracted_from` - Derived from source

## Linking Rules

**Use Exact Titles**: Match target entity title character-for-character including capitalization.

**Forward References Allowed**: You can link to entities that don't exist yet. They'll resolve when created.

**Bidirectional Linking**: Consider creating inverse relations in both documents for strong connections.

**Specific Over Generic**: Use `implements` instead of `relates_to` when applicable.

## Finding Existing Entities

Before creating relations:

1. Search for keywords: `search_notes(query="topic")`
1. Check recent activity: `recent_activity(timeframe="1 week")`
1. List directory: `list_directory(dir_name="/folder")`

## Minimum Targets

**Quality Standard**: Each document should have **3-5 meaningful relations** to other entities.

## Common Patterns

```markdown
## Relations
- part_of [[Parent Collection]]
- implements [[Specification Document]]
- requires [[Prerequisite Knowledge]]
- enables [[Downstream Capability]]
- pairs_with [[Complementary Resource]]
```

## Validation

- [ ] Used exact entity titles (case-sensitive)
- [ ] Selected specific relation types
- [ ] Created 3+ meaningful connections
- [ ] Avoided overusing `relates_to`
- [ ] Added context where relationships need clarification
