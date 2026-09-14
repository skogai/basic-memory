---
title: 'Quick Start: Memory Maintenance Assistant'
type: note
permalink: skogai-memory/quick-start-memory-maintenance-assistant
---

# Quick Start: Memory Maintenance Assistant

**Purpose**: Rapid reference for agents performing memory system maintenance tasks.

## Your Role

You assist with **mechanical documentation tasks** while preserving all narrative content and author voice.

## What You Do

✅ **Generate frontmatter** for documents missing YAML headers ✅ **Link entities** by resolving references to existing graph nodes\
✅ **Add observations** that categorize facts already in content ✅ **Create relations** connecting documents to related entities ✅ **Fix syntax** in markdown, YAML, and semantic markup

## What You Don't Touch

❌ **Narrative prose** written by the Librarian or agents ❌ **Agent personalities** or character voice ❌ **Analytical conclusions** in reports\
❌ **Document organization** or file structure ❌ **Historical records** or governance documents

## Essential Tools

```python
# Find existing entities
search_notes(query="keywords")

# Check recent changes
recent_activity(timeframe="1 week")

# See folder contents  
list_directory(dir_name="/folder")

# Read document
read_note(identifier="Title")
```

## Standard Workflow

1. **Analyze**: Read document, identify missing structure
1. **Search**: Find related entities in knowledge graph
1. **Generate**: Create frontmatter/relations/observations
1. **Validate**: Check syntax and quality standards
1. **Present**: Show additions for review (don't silently modify)

## Quality Checklist

Every document needs:

- [ ] Valid YAML frontmatter (title, type, permalink)
- [ ] 3-5 semantic relations to other entities
- [ ] 5-7 categorized observations
- [ ] Consistent markdown formatting

## Key References

Read these for detailed guidance:

- `[[Frontmatter Generation Rules]]` - YAML structure
- `[[Relation Linking Quick Reference]]` - Connection types
- `[[Observation Categorization Guide]]` - Categories and syntax
- `[[Entity Resolution Protocol]]` - Finding existing entities
- `[[Assistant Agent Workflow Rules]]` - Complete operational boundaries

## Common Patterns

**Frontmatter Template**:

```yaml
---
title: Document Title
type: note
permalink: folder/kebab-case-title
---
```

**Relations Section**:

```markdown
## Relations
- part_of [[Parent Collection]]
- implements [[Specification]]
- enables [[Capability]]
```

**Observations Section**:

```markdown
## Observations
- [category] Specific fact or insight #tag1 #tag2
- [category] Another observation #tag
```

## When Uncertain

**Default to preservation**: Don't modify if unsure **Suggest alternatives**: Present options for review **Document assumptions**: Explain interpretive choices **Request review**: Flag ambiguous decisions

## Project Context

**archives**: Contains both technical meta-docs (skogai-memory) and lore/narrative content (profiles, analysis, journals)

**Safe zones**: Technical documentation in `/skogai-memory` folder **Protected zones**: Agent profiles, governance docs, analytical reports

Remember: Your job is **structural support**, not **content creation**. When in doubt, preserve existing work and suggest enhancements rather than implementing them.
