---
title: Entity Resolution Protocol
type: note
permalink: skogai-memory/entity-resolution-protocol
---

# Entity Resolution Protocol

**Purpose**: Match text references to existing knowledge graph entities.

## Resolution Strategy

### 1. Exact Title Match (Preferred)

Search for entity by exact title:

```python
results = search_notes(query="Exact Entity Title", search_type="title")
```

**Use exact match when found**: `[[Knowledge Base Index]]`

### 2. Fuzzy Search Fallback

If exact match fails, search content:

```python
results = search_notes(query="key terms from reference")
```

Review results for:

- Title similarity
- Content relevance
- Permalink patterns
- File path location

### 3. Forward Reference

If no match found and entity should exist:

- Create forward reference: `[[Future Entity Name]]`
- Document as unresolved in tracking
- Entity will link when created later

## Search Best Practices

**Query Construction**:

- Use 2-4 distinctive keywords
- Include domain terms (e.g., "memory system", "agent profile")
- Try variations (singular/plural, abbreviations)

**Result Verification**:

```python
# Check if result matches intent
if result.title.lower() == target.lower():
    use_exact_title = result.title
```

**Recent Activity Check**:

```python
# Find recently modified entities
recent = recent_activity(timeframe="1 week", type=["entity"])
```

## Common Resolution Patterns

### Agent Names

- Search: `search_notes(query="Amy agent profile")`
- Link format: `[[Amy]]` or `[[Agent Profile: Amy]]`

### Technical Docs

- Search: `search_notes(query="frontmatter YAML specification")`
- Link format: `[[Basic Memory Document Format]]`

### Project Names

- Search: `list_directory()` to see folder structure
- Link format: `[[SkogAI-0.3-Reunion]]`

## Disambiguation

When multiple entities match:

**Use Context**:

- File location (analysis vs profiles vs system)
- Entity type (note vs index vs guide)
- Permalink domain

**Choose Most Specific**:

- `[[Basic Memory Document Format]]` over `[[Documentation]]`
- `[[Agent Profile: Amy]]` over `[[Amy]]` if both exist

## Validation Checklist

Before creating wikilink:

- [ ] Searched with distinctive keywords
- [ ] Checked recent activity for new entities
- [ ] Verified title capitalization
- [ ] Confirmed entity type matches intent
- [ ] Documented as forward reference if unresolved

## Output Format

**Resolved Entity**:

- `[[Exact Title From Search Result]]`

**Forward Reference**:

- `[[Expected Entity Title]]`
- Note in comments: `<!-- Forward reference: to be created -->`

## Batch Resolution

For multiple references in a document:

1. Extract all potential wikilinks
1. Batch search with combined keywords
1. Build resolution map: `{"text": "Resolved Title"}`
1. Apply replacements with exact titles
1. Mark unresolved as forward references
