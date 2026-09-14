---
permalink: todo/curated/home/skogix/skogai/docs/real-output-from-real-ai/todo/memory-uri-guide
---

______________________________________________________________________

categories:

1. Knowledge Management

1. Information Architecture

1. Documentation (specifically, a guide for using Memory URIs) tags:

1. Knowledge Graph

1. Information Systems

1. Documentation Guides

1. Standardization

1. Consistency

1. Interconnectedness

The file appears to be a comprehensive guide for understanding and working with Memory URIs, which are used to reference specific content in a knowledge base. The document covers various topics such as the basic format of Memory URIs, common URI types, practical examples, best practices, troubleshooting, and observations. It also relates to other concepts in the field of knowledge management and information architecture.

## Overall, the file is focused on providing a clear understanding of how to work with Memory URIs effectively and efficiently, which can be useful for individuals and organizations working with knowledge management systems or building their own documentation frameworks.

# memory-uri-guide

## what are memory uris?

memory URIs provide a standardized way to reference specific content in your knowledge base, functioning like an address system for knowledge #uri #reference

## basic uri format

```
memory://[resource-type]/[identifier]
```

- `memory://` - protocol identifier for memory system #syntax
- `[resource-type]` - content type (entity, note, conversation) #structure
- `[identifier]` - specific item's unique identifier or permalink #identification

## common uri types

### accessing notes

```
memory://note/my-note-title
memory://entity/folder-path/note-title
```

### referencing conversations

```
memory://entity/conversation/recent
memory://entity/conversation/[conversation-id]
```

### accessing raw content

```
memory://content/[file-path]
```

## practical examples

### building context from previous conversations

```markdown
skogai-memory__build_context
  url: memory://entity/conversation/[conversation-id]
  timeframe: 7d  # Optional: limit to recent content
```

### referencing a specific note

```markdown
skogai-memory__read_note
  identifier: folder/note-permalink
```

This is equivalent to using its URI:

```markdown
skogai-memory__build_context
  url: memory://entity/folder/note-permalink
```

### finding related content

```markdown
skogai-memory__build_context
  url: memory://entity/projects/my-project
  depth: 2  # Expand to include related content
```

## using uris effectively

### creating interconnected knowledge

- reference related notes using their URIs in your content #connections
- create links between concepts using markdown link syntax #linking

### building better context

- use `build_context` function with URIs to retrieve relevant background #context
- increase the `depth` parameter to expand to more loosely related content #exploration
- use the `timeframe` parameter to focus on recent or specific time periods #filtering

### finding information

- use URIs to directly access known content #direct-access
- use search functions to discover URIs for content you want to reference #discovery

### creating knowledge maps

- use URIs as nodes in canvas maps to visualize relationships #visualization
- connect related concepts with visual links #mapping

## best practices

- use consistent naming patterns for files and folders #consistency
- understand that permalinks are derived from folder paths and titles #structure
- create explicit links between related notes using URIs #connectivity
- when continuing work on a topic, use `build_context` with relevant URI #continuation

## troubleshooting

If a URI isn't returning expected results:

- check exact spelling of resource types and identifiers #verification
- verify the resource exists (try searching for it first) #existence
- check if you need to URL-encode special characters #encoding
- try using a parent folder path if exact path doesn't work #navigation

## observations

- [fact] memory URIs create a standardized pattern for referencing knowledge #standards #consistency
- [technique] using depth parameters allows following semantic connections across notes #exploration #context
- [principle] interconnected knowledge through URIs increases overall system value #network-effect #value
- [decision] URI structure follows a consistent pattern to enable machine processing #structure #automation
- [requirement] correctly formatted permalinks are essential for reliable URI references #reliability #referencing

## relations

- implements \[[knowledge-graph-navigation]\] (provides mechanism for traversing knowledge connections)
- relates_to \[[memory-system]\] (creates addressing scheme for stored knowledge)
- part_of \[[memory-toolset]\] (serves as core mechanic for reference) EOF 2>&1
