---
title: skogai-memory
type: note
permalink: agents/claude/skogai-memory-1
---

# SkogAI-Memory Quick Reference

## Naming Convention

Note titles should follow the format "lowercase and connected via -" (kebab-case).

This ensures that files are named consistently with their permalinks.

Example:

- Correct: `my-note-title`
- Incorrect: `My Note Title`, `my_note_title`, `myNoteTitle`

## Core Commands

### Search

```
Search for "query terms"
Search for "python AND flask NOT django"
What do I know about [topic]?
```

### Read & Reference

```
memory://permalink
memory://folder/note-name
memory://auth* (wildcard pattern)
memory://project/*/requirements (folder wildcards)
```

### Context Building

```
Continue our conversation about [topic]
Build context from memory://permalink
Follow relations from memory://permalink
What have we been discussing recently?
```

### Creating/Updating Notes

```
Create a note about [topic]
Update memory://permalink with [information]
```

## Boolean Search Operators

- AND: Both terms required
- OR: Either term
- NOT: Exclude term
- (): Group expressions

## Relation Types

- implements, part_of, contains
- depends_on, affected_by, enhances
- relates_to, similar_to, complements
- precedes, follows

## Tips

- Be specific when searching
- Use memory:// URLs for precision
- Build connections between notes
- Reference existing knowledge in conversations
