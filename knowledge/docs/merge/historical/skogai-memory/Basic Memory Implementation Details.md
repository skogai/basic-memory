---
title: Basic Memory Implementation Details
type: note
permalink: skogai-memory/basic-memory-implementation-details
tags:
  - implementation
  - technical
  - data-model
  - parsing
---

# Basic Memory Implementation Details

## Knowledge Organization

Knowledge in Basic Memory is organized as a semantic graph:

### Entities

Distinct concepts represented by Markdown documents

### Observations

Categorized facts and information about entities

### Relations

Connections between entities that form the knowledge graph

This structure emerges from simple text patterns in standard Markdown:

## Example Markdown Input

```yaml
---
title: Coffee Brewing Methods
type: note
permalink: coffee/coffee-brewing-methods
tags:
- '#coffee'
- '#brewing'
- '#methods'
- '#demo'
---
```

```markdown
# Coffee Brewing Methods

An exploration of different coffee brewing techniques, their characteristics, and how they affect flavor extraction.

## Overview

Coffee brewing is both an art and a science. Different brewing methods extract different compounds from coffee beans,
resulting in unique flavor profiles, body, and mouthfeel. The key variables in any brewing method are:

- Grind size
- Water temperature
- Brew time
- Coffee-to-water ratio
- Agitation/turbulence

## Observations

- [principle] Coffee extraction follows a predictable pattern: acids extract first, then sugars, then bitter compounds
  #extraction
- [method] Pour over methods generally produce cleaner, brighter cups with more distinct flavor notes #clarity

## Relations

- requires [[Proper Grinding Technique]]
- affects [[Flavor Extraction]]
```

## Parsed JSON Structure

```json
{
  "entities": [
    {
      "permalink": "coffee/coffee-brewing-methods",
      "title": "Coffee Brewing Methods",
      "file_path": "Coffee Notes/Coffee Brewing Methods.md",
      "entity_type": "note",
      "entity_metadata": {
        "title": "Coffee Brewing Methods",
        "type": "note",
        "permalink": "coffee/coffee-brewing-methods",
        "tags": "['#coffee', '#brewing', '#methods', '#demo']"
      },
      "checksum": "bfa32a0f23fa124b53f0694c344d2788b0ce50bd090b55b6d738401d2a349e4c",
      "content_type": "text/markdown",
      "observations": [
        {
          "category": "principle",
          "content": "Coffee extraction follows a predictable pattern: acids extract first, then sugars, then bitter compounds #extraction",
          "tags": [
            "extraction"
          ],
          "permalink": "coffee/coffee-brewing-methods/observations/principle/coffee-extraction-follows-a-predictable-pattern-acids-extract-first-then-sugars-then-bitter-compounds-extraction"
        },
        {
          "category": "method",
          "content": "Pour over methods generally produce cleaner, brighter cups with more distinct flavor notes #clarity",
          "tags": [
            "clarity"
          ],
          "permalink": "coffee/coffee-brewing-methods/observations/method/pour-over-methods-generally-produce-cleaner-brighter-cups-with-more-distinct-flavor-notes-clarity"
        }
      ],
      "relations": [
        {
          "from_id": "coffee/coffee-bean-origins",
          "to_id": "coffee/coffee-brewing-methods",
          "relation_type": "pairs_with",
          "permalink": "coffee/coffee-bean-origins/pairs-with/coffee/coffee-brewing-methods",
          "to_name": "Coffee Brewing Methods"
        },
        {
          "from_id": "coffee/flavor-extraction",
          "to_id": "coffee/coffee-brewing-methods",
          "relation_type": "affected_by",
          "permalink": "coffee/flavor-extraction/affected-by/coffee/coffee-brewing-methods",
          "to_name": "Coffee Brewing Methods"
        }
      ],
      "created_at": "2025-03-06T14:01:23.445071",
      "updated_at": "2025-03-06T13:34:48.563606"
    }
  ]
}
```

Basic Memory understands how to build context via its semantic graph.

## Entity Model

Basic Memory's core data model consists of:

### Entities

Documents in your knowledge base

### Observations

Facts or statements about entities

### Relations

Connections between entities

### Tags

Additional categorization for entities and observations

The system parses Markdown files to extract this structured information while preserving the human-readable format.

## Files as Source of Truth

Plain Markdown files store all knowledge, making it accessible with any text editor and easy to version with git.

## observations

- [technical] System parses markdown into structured JSON for semantic processing #parsing #json
- [architecture] Files remain source of truth while enabling rich semantic queries #architecture #files
- [model] Core entities are documents, observations, relations, and tags #data-model #structure
- [processing] Automatic extraction creates knowledge graph from simple text patterns #automation #graph
- [accessibility] Plain markdown ensures content works with any text editor #accessibility #portability

## relations

- implements \[[Basic Memory Document Format]\] (technical implementation of format specification)
- enables \[[Knowledge Graph Construction]\] (underlying mechanism for graph building)
- supports \[[AI Assistant Guide for Basic Memory]\] (technical foundation for assistant usage)
- complements \[[Memory URI System]\] (technical details of addressing system)
