---
title: Understanding URIs in Skogai Memory - A Practical Guide
type: note
permalink: guides/understanding-uris-in-skogai-memory-a-practical-guide-1-1-1
tags:
  - '#uri'
  - '#memory'
  - '#skogai'
  - '#reference'
  - '#tutorial'
---

# Understanding URIs in Skogai Memory - A Practical Guide

## What is a URI?

A URI (Uniform Resource Identifier) in Skogai Memory is a standardized string that references specific content in your knowledge base. Think of it like an address system for your knowledge.

## Basic URI Format

```
memory://[resource-type]/[identifier]
```

- `memory://` - The protocol identifier for Skogai Memory
- `[resource-type]` - The type of content (entity, note, conversation, etc.)
- `[identifier]` - The specific item's unique identifier or permalink

## Common URI Types

### 1. Accessing Notes

```
memory://note/my-note-title
memory://entity/folder-path/note-title
```

### 2. Referencing Conversations

```
memory://entity/conversation/recent
memory://entity/conversation/[conversation-id]
```

### 3. Accessing Raw Content

```
memory://content/[file-path]
```

## Practical Examples of Using URIs

### Example 1: Building Context from Previous Conversations

When you want to reference or continue a previous conversation:

```markdown
skogai-memory__build_context
  url: memory://entity/conversation/[conversation-id]
  timeframe: 7d  # Optional: limit to recent content
```

### Example 2: Referencing a Specific Note

When you want to reference information from a specific note:

```markdown
skogai-memory__read_note
  identifier: folder/note-permalink
```

This is equivalent to using its URI:

```markdown
skogai-memory__build_context
  url: memory://entity/folder/note-permalink
```

### Example 3: Finding Related Content

URIs help the system find connections between pieces of information:

```markdown
skogai-memory__build_context
  url: memory://entity/projects/my-project
  depth: 2  # Expand to include related content
```

## How to Use URIs Effectively

### 1. Creating Interconnected Knowledge

- Reference related notes using their URIs in your content
- Create links between concepts using markdown link syntax: `[Concept Name](memory://entity/path/to/concept)`

### 2. Building Better Context

- Use the `build_context` function with URIs to retrieve relevant background information
- Increase the `depth` parameter to expand to more loosely related content
- Use the `timeframe` parameter to focus on recent or specific time periods

### 3. Finding Information

- Use URIs to directly access known content
- Use search functions to discover URIs for content you want to reference

### 4. Creating Knowledge Maps

- Use URIs as nodes in canvas maps to visualize relationships
- Connect related concepts with visual links

## URI Integration with Other Functions

Many Skogai Memory functions accept URIs directly or indirectly:

- `read_note` uses permalinks (which are part of URIs)
- `build_context` uses full URIs to establish context
- `read_content` can access file content by path (similar to URI paths)

## Best Practices

1. **Consistent Naming**: Use consistent naming patterns for files and folders
1. **Permalinks**: Understand that permalinks (used in URIs) are derived from folder paths and titles
1. **Link Between Notes**: Create explicit links between related notes using URIs
1. **Use Context Building**: When continuing work on a topic, use `build_context` with the relevant URI

## Troubleshooting

If a URI isn't returning expected results:

1. Check the exact spelling of resource types and identifiers
1. Verify the resource exists (try searching for it first)
1. Check if you need to URL-encode special characters
1. Try using a parent folder path if the exact path doesn't work

## Summary

URIs in Skogai Memory provide a powerful way to create an interconnected knowledge base. By understanding and using them effectively, you can:

1. Create links between related concepts
1. Quickly access specific information
1. Build context for continuing work on complex topics
1. Create visual maps of your knowledge

The more you use URIs to connect your knowledge, the more value you'll get from the Skogai Memory system.
