---
title: Assistant Agent Workflow Rules
type: note
permalink: skogai-memory/assistant-agent-workflow-rules
---

# Assistant Agent Workflow Rules

**Purpose**: Define operational boundaries for agents assisting with memory system maintenance.

## Core Principles

**Never Modify Narrative Content**: Do not change the Librarian's analytical prose, agent persona writing, or lore documentation.

**Mechanical Tasks Only**: Focus on frontmatter, relations, observations, entity resolution, and structural consistency.

**Preserve Voice**: When adding observations or relations to existing documents, match the document's existing tone and terminology.

## Permitted Operations

### Frontmatter Generation

- Create YAML blocks for new documents
- Fix malformed frontmatter syntax
- Update permalinks for moved files
- Add missing required fields

### Entity Linking

- Resolve wikilink references to existing entities
- Identify potential connections between documents
- Create forward references for future entities
- Suggest relation types based on content analysis

### Observation Enhancement

- Add categorized observations to documents lacking them
- Suggest appropriate tags for discoverability
- Group scattered observations by subtopic
- Standardize observation syntax

### Structural Validation

- Check for required sections (Observations, Relations)
- Verify markdown syntax correctness
- Ensure consistent heading hierarchy
- Validate relation and observation formatting

## Prohibited Operations

**Content Editing**:

- ❌ Rewriting paragraphs or sections
- ❌ Changing analytical conclusions
- ❌ Modifying agent dialogue or personality
- ❌ Altering historical documentation
- ❌ Correcting "voice" or writing style

**Structural Changes**:

- ❌ Reorganizing document sections without approval
- ❌ Merging or splitting documents
- ❌ Changing document titles
- ❌ Moving files between folders

**Semantic Alterations**:

- ❌ Changing relation types that modify meaning
- ❌ Removing existing observations
- ❌ Altering tag semantics

## Decision Framework

**When uncertain**:

1. Default to preservation over modification
1. Suggest rather than implement
1. Document assumptions and alternatives
1. Request human review for ambiguous cases

**Safe to proceed**:

- Adding missing frontmatter
- Linking to clearly matching entities
- Adding observations that restate content facts
- Fixing syntax errors

**Requires review**:

- Content appears incomplete or inconsistent
- Multiple resolution options exist
- Structural changes would improve clarity
- Domain-specific terminology is ambiguous

## Quality Standards

### Minimum Requirements

Every document should have:

- Valid YAML frontmatter
- 3-5 relations to other entities
- 5-7 categorized observations
- Consistent markdown formatting

### Enhancement Targets

Improved documents include:

- Rich semantic connections (5+ relations)
- Diverse observation categories
- Grouped observations by subtopic
- Bidirectional linking with related entities

## Workflow Pattern

1. **Receive Document**: Identify task type (frontmatter, linking, observations)
1. **Analyze Context**: Understand document domain and existing style
1. **Search Graph**: Find related entities and connection opportunities
1. **Generate Additions**: Create syntactically correct enhancements
1. **Validate Output**: Check against quality standards
1. **Document Assumptions**: Note any uncertain choices made

## Communication Protocol

**Output Format**:

```markdown
## Suggested Additions

### Frontmatter
[YAML block]

### Relations  
[Relation list with justification]

### Observations
[Categorized observations]

## Assumptions
- [List any interpretive choices made]

## Requires Review
- [Flag any uncertain decisions]
```

**Transparency**: Always show what will be added, never silently modify.

## Tool Usage Guidelines

**Search Before Link**:

```python
# Always verify entity exists
results = search_notes(query="entity keywords")
# Use exact title from results
```

**Batch Operations**:

```python
# For multiple documents
for doc in documents:
    analyze_document(doc)
    generate_enhancements(doc)
    validate_additions(doc)
```

**Validation**:

```python
# Check work meets standards
validate_frontmatter(yaml_block)
validate_relations(relations_list)
validate_observations(obs_list)
```

## Error Handling

**Unresolved Entities**: Create forward references with documentation **Ambiguous Relations**: Provide multiple options for review **Missing Context**: Request additional information before proceeding **Syntax Errors**: Fix formatting while preserving intent

## Scope Boundaries

**In Scope**:

- Technical meta-documentation (skogai-memory folder)
- Structural consistency across all documents
- Entity graph completeness
- Discoverability through proper tagging

**Out of Scope**:

- Agent personality development
- Lore narrative creation
- Strategic decision documentation
- Governance document drafting

These documents belong to specialized agents (Librarian, Amy, Claude, etc.) and should not be modified by assistants.
