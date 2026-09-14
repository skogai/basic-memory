---
title: Frontmatter Generation Rules
type: note
permalink: skogai-memory/frontmatter-generation-rules
---

# Frontmatter Generation Rules

**Purpose**: Generate valid YAML frontmatter for SkogAI memory notes.

## Required Fields

```yaml
---
title: Exact Document Title
type: note|index|guide|reference|analysis|profile
permalink: domain/kebab-case-identifier
---
```

## Field Generation Rules

**title**: Use document's H1 heading exactly as written. Never modify capitalization or punctuation.

**type**: Classify by document function:

- `note` - General knowledge capture
- `index` - Navigation hub or table of contents
- `guide` - Step-by-step instructions
- `reference` - Lookup documentation
- `analysis` - Analytical reports
- `profile` - Agent or entity profiles

**permalink**: Generate from content location and title:

- Format: `folder/kebab-case-title`
- Convert spaces to hyphens
- Remove special characters except hyphens
- All lowercase
- Examples: `profiles/amy`, `skogai-memory/knowledge-base-index`

## Optional Fields

```yaml
tags:
- relevant-topic
- category
categories: null  # Legacy field, leave null
```

**tags**: Extract 3-5 primary topics from content. Use existing tag vocabulary when possible.

## Validation Checklist

- [ ] Title matches document H1 exactly
- [ ] Type uses valid enum value
- [ ] Permalink follows kebab-case convention
- [ ] No special characters in permalink except hyphens
- [ ] Tags use existing vocabulary from related documents

## Common Errors to Avoid

**Wrong**: `permalink: Profiles/Amy Ravenwolf` **Right**: `permalink: profiles/amy-ravenwolf`

**Wrong**: `type: document` **Right**: `type: note`

**Wrong**: `title: knowledge base index` (doesn't match H1) **Right**: `title: Knowledge Base Index`

## Output Format

Always output complete YAML block with opening/closing `---` markers. No explanations, just valid frontmatter.
