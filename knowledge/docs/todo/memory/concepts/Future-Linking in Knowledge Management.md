---
title: Future-Linking in Knowledge Management
type: note
permalink: concepts/future-linking-in-knowledge-management
tags:
  - '#documentation #knowledge-management #techniques'
---

# Future-Linking in Knowledge Management

Future-linking is a powerful knowledge management technique used in the SkogAI ecosystem that involves creating links to content or concepts that don't yet exist but are anticipated to be needed in the future.

## Purpose and Benefits

Future-linking serves several important functions:

1. **Identifying Knowledge Gaps**: Highlighting areas where documentation or clarification is needed
1. **Creating Knowledge Structure**: Building scaffolding for an evolving knowledge base
1. **Prompting Further Exploration**: Encouraging investigation of related topics
1. **Maintaining Contextual Connections**: Preserving relationships between concepts even before full documentation exists

## Implementation in SkogAI Memory System

In the SkogAI Memory System, future links are typically created through:

1. **Markdown Links**: Using standard `[[concept-name]]` syntax to reference non-existent documents
1. **Relation Definitions**: Creating explicit relations to anticipated future concepts
1. **TODOs and Placeholders**: Deliberately marking areas for future expansion

The system tracks these "unresolved relations" (links to non-existent documents) and can report on them through the project statistics.

## Best Practices

Effective future-linking follows several principles:

- **Intentionality**: Create future links deliberately, not speculatively
- **Clear Naming**: Use descriptive, consistent naming conventions
- **Context Inclusion**: Provide enough surrounding context to guide future content creation
- **Regular Review**: Periodically revisit unresolved links to fill knowledge gaps
- **Progressive Resolution**: Address high-value or frequently referenced missing links first

## Example Workflow

1. While documenting a concept, identify a related topic that needs explanation
1. Create a future link using `[[clear-descriptive-name]]` or a relation
1. The system tracks this as an "unresolved relation"
1. Later, create the referenced document, automatically resolving the link

## Integration with Knowledge Workflows

Future-linking integrates with broader knowledge management practices:

- Regular review of unresolved relations highlights priority documentation needs
- Project statistics reveal knowledge graph completeness
- Intentional future links create natural documentation roadmaps
- AI assistants can identify patterns in unresolved links to suggest content creation priorities

## observations

- [principle] Future links create valuable scaffolding for knowledge expansion #knowledge-management #documentation
- [technique] Intentional linking to non-existent content highlights knowledge gaps #documentation-strategy
- [fact] The memory system tracks unresolved relations as part of its project statistics #system-capabilities
- [decision] Using descriptive names for future links makes future content creation more straightforward #naming-conventions
- [technique] Regular review of unresolved relations prioritizes documentation needs #workflow

## relations

- part_of \[[knowledge-management-practices]\] (component of effective knowledge organization)
- implements \[[documentation-strategy]\] (practical technique for managing documentation)
- relates_to \[[skogai-memory-system-integration]\] (leverages the memory system's tracking capabilities)
- extends \[[markdown-linking]\] (builds upon basic markdown link functionality)
