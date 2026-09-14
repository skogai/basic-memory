# SkogAI Memory System

A semantic knowledge management system for structured information and connected thoughts.

## Table of Contents

- [Overview](#overview)
- [Core Concepts](#core-concepts)
- [Getting Started](#getting-started)
- [File Structure](#file-structure)
- [Creating Memories](#creating-memories)
- [Memory URI System](#memory-uri-system)
- [Observations [@file:README.md] Relations](#observations--relations)
- [Best Practices](#best-practices)
- [Automation [@file:README.md] Enforcement](#automation--enforcement)
- [Troubleshooting](#troubleshooting)
- [Examples](#examples)
- [Related Resources](#related-resources)

## Overview

SkogAI Memory is a knowledge management system that transforms information into an interconnected knowledge graph using simple markdown files. The system enables both humans and AI assistants to store, retrieve, and navigate knowledge efficiently, creating a living network of information that grows in value over time.

Key benefits of using this system:

- **Simplicity**: Plain text markdown files that can be edited with any editor
- **Portability**: No specialized software needed beyond basic text editing
- **Structure**: Clear patterns for organizing knowledge
- **Connectivity**: Built-in mechanisms for relating pieces of information
- **Discoverability**: Easy to find related information through semantic connections
- **Automation**: Structure enables tooling for maintenance and enhancement

The system is designed around the principle that *connected knowledge provides more value than isolated information*.

### Knowledge Graph Visualization

```
                                       +-----------------+
                                       |                 |
                                       |  Document A     |
                                       |  # Title        |
                                       |  Content...     |
                                       |  ## observations|
                                       |  ## relations   |
                                       |                 |
                                       +-----------------+
                                        /      |       \n                                       /       |        \n                                      /        |         \n          +-----------------+   implements    |     relates_to    +-----------------+
          |                 |                 |                   |                 |
          |  Document B     | <---------------+                   |  Document D     |
          |  # Title        |                 |                   |  # Title        |
          |  Content...     |                part_of             |  Content...     |
          |  ## observations|                 |                   |  ## observations|
          |  ## relations   |                 |                   |  ## relations   |
          |                 |                 |                   |                 |
          +-----------------+                 v                   +-----------------+
                  |                  +-----------------+                  ^
                  |                  |                 |                  |
                  |                  |  Document C     |                  |
                  |                  |  # Title        |                  |
                  |                  |  Content...     |                  |
                  +----------------->|  ## observations|------------------+
                      extends        |  ## relations   |    references
                                     |                 |
                                     +-----------------+
```

## Core Concepts

### Markdown Files

All knowledge in the system is stored in simple markdown (.md) files, which are:

- Human-readable and easily edited
- Version control friendly
- Structured enough for machine processing
- Flexible enough for various content types

### Observations

Observations are categorized facts or statements that form the atomic units of knowledge. They follow this format:

```markdown
- [category] description #tags
```

Categories help classify the type of information:

- **[fact]** - Objective, verifiable information
- **[principle]** - Guiding ideas or concepts
- **[technique]** - Methods or approaches
- **[decision]** - Choices made and rationales
- **[requirement]** - Necessary conditions or features

Tags (#) make observations discoverable and connectible across the knowledge base.

### Relations

Relations explicitly define connections between documents, showing how pieces of knowledge relate to each other:

```markdown
- relation_type [[linked-document]] (optional description)
```

Common relation types include:

- **implements** - Shows how concepts are put into practice
- **relates_to** - General connection between topics
- **part_of** - Hierarchical membership
- **extends** - Builds upon or enhances
- **references** - Cites or mentions

These connections form the edges in the knowledge graph, allowing navigation between related concepts.

### Memory URIs

Memory URIs provide a standardized way to reference knowledge within the system:

```
memory://[resource-type]/[identifier]
```

This addressing system enables precise linking and retrieval of information across the knowledge base.

## Getting Started

### Setting Up

1. Understand the folder structure:
   - `/todo`: Starting point for new content
   - Topic folders: Permanent locations for organized content

2. Install recommended tools:
   - A text editor with markdown support
   - Git for version control (optional but recommended)

### Creating Your First Memory

1. Create a new markdown file in the `/todo` folder with a descriptive name
2. Start with a clear title (H1 heading)
3. Add meaningful content in markdown format
4. Include an `## observations` section with categorized facts
5. Add a `## relations` section linking to related content
6. Save the file with a clear, kebab-case filename

## File Structure

### Standard File Format

```markdown
# Title of Memory

Main content goes here in regular markdown format.
This can include various headings, lists, code blocks, etc.

## observations
- [category] Observation statement #tag1 #tag2
- [category] Another observation #tag3

## relations
- relation_type [[related-document]] (optional description)
- another_relation [[another-document]] (description)
```

### Document Structure Visualization

```
+------------------------------------------+
| # Document Title                         |
|                                          |
| Main content in markdown format...       |
| - Lists                                  |
| - Tables                                 |
| - Links                                  |
|                                          |
| ## Subtopic                              |
|                                          |
| More content...                          |
|                                          |
| ## observations                          |
| - [fact] Observation 1 #tag1 #tag2       |
| - [principle] Observation 2 #tag3        |
| - [technique] Observation 3 #tag4 #tag5  |
|                                          |
| ## relations                             |
| - implements [[concept-a]] (description) |
| - relates_to [[concept-b]]               |
| - part_of [[system-c]] (context)         |
+------------------------------------------+
```

### Naming Conventions

- Use kebab-case for filenames (lowercase with hyphens between words)
- Choose descriptive names that reflect the content
- Avoid special characters and spaces
- Example: `knowledge-management-principles.md`

### Folder Organization

The memory system uses a hierarchical folder structure:

```
skogdata/memories/
│
├── todo/                  # Starting location for new content
│   ├── new-document.md
│   └── work-in-progress.md
│
├── system/                # System documentation
│   ├── rules.md
│   └── standards.md
│
├── journal/               # Time-based entries
│   ├── 2023-01-15.md
│   └── 2023-01-16.md
│
├── projects/              # Project-specific information
│   ├── project-a/
│   │   ├── overview.md
│   │   └── details.md
│   │
│   └── project-b/
│       └── documentation.md
│
└── concepts/              # Conceptual information
    ├── knowledge-management.md
    └── documentation-standards.md
```

## Creating Memories

### Step 1: Start in the Todo Folder

New memories begin in the `/todo` folder, following the standard format.

### Step 2: Add Essential Components

Every memory should include:

- A clear title as the first line (# Heading)
- Relevant content in markdown format
- An observations section for key facts
- A relations section to connect to other documents

### Step 3: Use Proper Formatting

```markdown
# Knowledge Management Principles

Knowledge management is the process of creating, sharing, using and managing knowledge in an organization.

## observations
- [principle] Connected information provides more value than isolated facts #network-effect
- [technique] Categorizing observations enables better discovery #organization
- [requirement] Consistent formatting enables automation #standards

## relations
- implements [[information-organization]] (practical application of theory)
- relates_to [[productivity-systems]] (enhances work efficiency)
- part_of [[knowledge-ecosystem]] (component of larger structure)
```

### Step 4: Processing and Placement

After creation, memories go through:

1. Quality checking (automated or manual)
2. Relation verification
3. Placement in appropriate permanent folders

### Memory Creation Workflow

```
+----------------+     +------------------+     +--------------------+
| Create content | --> | Add observations | --> | Establish relations|
+----------------+     +------------------+     +--------------------+
        │                       │                        │
        v                       v                        v
+----------------+     +------------------+     +--------------------+
| Place in /todo | --> | Quality checking | --> | Permanent placement|
+----------------+     +------------------+     +--------------------+
                                │
                                v
                       +------------------+
                       | Ongoing updates  |
                       | and connections  |
                       +------------------+
```

## Memory URI System

### URI Structure

```
memory://[resource-type]/[identifier]
        │            │
        │            └── Specific document or resource
        │                 Examples: my-document, folder/document
        │
        └── Type of resource
            Examples: note, entity, conversation, content
```

### Common Resource Types

- `note`: Direct reference to a specific note by title
- `entity`: Reference to content by path or folder structure
- `conversation`: Reference to chat or discussion history
- `content`: Reference to raw file content

### Usage Examples

#### Accessing Notes

```
memory://note/my-note-title
memory://entity/folder-path/note-title
```

#### Referencing Conversations

```
memory://entity/conversation/recent
memory://entity/conversation/[conversation-id]
```

#### Accessing Raw Content

```
memory://content/[file-path]
```

### Building Context

To retrieve information and build context from memory URIs:

```markdown
skogai-memory__build_context
  url: memory://entity/projects/my-project
  depth: 2  # Include related content
  timeframe: 7d  # Limit to recent content
```

For more detailed information on Memory URIs, see the [Memory URI Reference Guide](memory-uri-reference.md).

## Observations [@file:README.md] Relations

### Creating Effective Observations

Good observations are:

- **Concise**: One clear fact per line
- **Categorized**: Using the appropriate type tag
- **Tagged**: With relevant hashtags for discovery
- **Atomic**: Containing a single piece of information

Example:

```markdown
## observations
- [fact] The memory system uses markdown files for all content #format #standard
- [principle] Connecting information builds network value over time #networking
- [technique] Consistent tagging improves discoverability #organization #findability
- [decision] We chose markdown for its simplicity and portability #accessibility
- [requirement] All documents must include observations and relations #structure
```

### Creating Meaningful Relations

Effective relations:

- Use the appropriate relation type
- Link to existing documents
- Include a brief description when necessary
- Create a clear network of connections

Example:

```markdown
## relations
- implements [[knowledge-management]] (practical application)
- relates_to [[markdown-syntax]] (uses for document formatting)
- part_of [[skogai-ecosystem]] (component of larger system)
- extends [[file-organization]] (adds semantic layer)
```

### Knowledge Network Growth

```
  Initial State                 After Adding Relations               Rich Knowledge Graph
  
  [Doc A]  [Doc B]              [Doc A]-------[Doc B]                [Doc A]-------[Doc B]
                                   |                                    |           / |
                                   |                                    |          /  |
  [Doc C]  [Doc D]              [Doc C]       [Doc D]                [Doc C]--[New]--[Doc D]
                                                                        |     |   /
                                                                        |     |  /
  [Doc E]  [Doc F]              [Doc E]-------[Doc F]                [Doc E]---[Doc F]

  Isolated documents          Basic connections formed            Dense network with
  Limited value               Some paths for navigation           multiple navigation paths
                                                                  Emergent relationships
```

## Best Practices

### Creating Valuable Content

1. **Focus on connections**
   - Link related concepts explicitly
   - Use consistent terminology for better connections
   - Think about how information relates to existing knowledge

2. **Write for retrieval**
   - Use clear, descriptive titles
   - Include relevant keywords naturally in content
   - Add comprehensive observations with appropriate tags

3. **Structure for clarity**
   - Use hierarchical headings to organize content
   - Break complex topics into digestible sections
   - Use lists and tables to present structured information

4. **Enable discovery**
   - Add thorough relations to relevant documents
   - Use consistent tags across related content
   - Include various observation types for different perspectives

### Maintaining the Knowledge Graph

1. **Regular reviews**
   - Periodically check and update existing content
   - Verify that relations still point to relevant documents
   - Ensure observations remain accurate and useful

2. **Connection refinement**
   - Add new relations as the knowledge base grows
   - Update relation descriptions for clarity
   - Remove outdated or incorrect relations

3. **Tag consistency**
   - Use established tags when possible
   - Create new tags thoughtfully
   - Maintain a list of commonly used tags

## Automation [@file:README.md] Enforcement

### Quality Control Tools

The system includes tools to maintain quality and consistency:

- **summarize.sh**: Analyzes content and generates summaries
- **enforce.sh**: Checks files against rules and fixes common issues
- **Changes tracking**: Monitors modifications in `CHANGES.md`

### Enforcement Process

1. New files are placed in the `/todo` folder
2. Automated tools check formatting and structure
3. Issues are identified and either:
   - Fixed automatically, or
   - Flagged for manual correction
4. Verified files move to their permanent locations

### Benefits of Automation

- **Consistency**: Maintains standards across all content
- **Quality**: Catches errors and issues early
- **Efficiency**: Reduces manual checking effort
- **Learning**: Provides feedback to improve future content

## Troubleshooting

### Common Issues

#### Files Not Showing Up in Search

- Check that the file follows naming conventions
- Verify that appropriate observations and tags are included
- Ensure the file is in the correct location

#### Relations Not Working

- Verify that the linked document exists with the exact name
- Check for typos in the relation syntax
- Ensure double brackets are used correctly: `[[document-name]]`

#### URIs Not Resolving

- Confirm the URI format is correct
- Check that resource types are properly specified
- Verify that identifiers match existing documents
- Try URL-encoding special characters if necessary

#### Automation Issues

- Ensure files follow the required structure
- Check for missing sections (observations, relations)
- Verify that formatting follows standards

## Examples

### Simple Standalone Memory

See [example-memory-simple.md](example-memory-simple.md) for a basic memory following all required standards.

### Memory with Rich Observations

See [example-memory-rich-observations.md](example-memory-rich-observations.md) for an example of a memory with comprehensive observations.

### Memory with Multiple Relations

See [example-memory-multiple-relations.md](example-memory-multiple-relations.md) for an example of a memory with a rich network of relations.

## Related Resources

- [RULES.md](RULES.md): Detailed formatting and structure requirements
- [memory-uri-guide.md](memory-uri-guide.md): Comprehensive guide to memory URIs
- [memory-uri-reference.md](memory-uri-reference.md): Detailed URI reference
- [memory-diagrams.md](memory-diagrams.md): Visual representations of system concepts

## observations

- [fact] SkogAI Memory uses markdown files for portable knowledge storage #accessibility #portability
- [principle] Connections between notes provide more value than isolated content #network #knowledge-graph
- [decision] Automated enforcement maintains consistency with minimal effort #automation #quality
- [technique] Categorized observations enable semantic filtering and discovery #organization #findability
- [requirement] All content must follow established standards for system interoperability #standards #compatibility
- [principle] Knowledge systems should balance structure and flexibility #adaptability #usability
- [fact] The memory URI system provides standardized addressing for knowledge #reference #navigation
- [technique] Explicit relations create traversable paths through the knowledge base #connections #exploration

## relations

- implements [[knowledge-management]] (provides structured approach to information)
- relates_to [[markdown-systems]] (uses markdown for content storage)
- part_of [[skogai-ecosystem]] (integrates with broader SkogAI tools)
- foundation_for [[knowledge-graph]] (creates basis for connected information)
- relates_to [[documentation-systems]] (serves similar purposes for knowledge preservation)

---
---
---

# Memory With Multiple Relations

This document demonstrates how to create a memory with rich interconnections to other documents in the knowledge base. Multiple relations create a densely connected knowledge graph with many paths for discovery and navigation.

## The Value of Connected Knowledge

When documents are richly connected:

- Navigation becomes intuitive and multidimensional
- New insights emerge from relationship patterns
- The context becomes richer as you explore connections
- Discovery of relevant information happens naturally

## Relation Types

Different relation types express various semantic connections:

- **implements**: Shows practical applications of concepts
- **relates_to**: Indicates general topical connections
- **part_of**: Establishes hierarchical membership
- **extends**: Builds upon or enhances another concept
- **contrasts_with**: Shows opposing or different approaches
- **precedes/follows**: Establishes sequential relationships
- **requires**: Indicates dependencies
- **supports**: Shows enabling or facilitating relationships

## Example Topic: Documentation Systems

Documentation systems provide structured approaches to creating, organizing, and maintaining information about products, services, processes, or concepts. They range from simple collections of markdown files to complex technical documentation platforms.

## observations

- [fact] Documentation systems range from file-based to database-driven approaches #types #architecture
- [principle] Good documentation reduces support costs and improves user adoption #benefits #roi
- [technique] Generated documentation from code comments ensures accuracy #maintenance #synchronization
- [requirement] Documentation must remain accessible to both technical and non-technical users #accessibility #audience

## relations

- implements [[information-organization]] (practical application of organizing principles)
- relates_to [[technical-writing]] (uses similar techniques and approaches)
- relates_to [[knowledge-base-design]] (shares goals and challenges)
- part_of [[content-management]] (subset of broader discipline)
- extends [[file-organization]] (adds semantic layer to basic structure)
- contrasts_with [[ad-hoc-documentation]] (provides structure instead of chaos)
- supports [[onboarding-processes]] (helps new users understand systems)
- supports [[troubleshooting]] (provides reference information)
- precedes [[knowledge-integration]] (documentation is prerequisite for integration)
- requires [[content-standards]] (needs consistent formatting)
- example_of [[knowledge-systems]] (specific instance of broader category)
- similar_to [[wiki-systems]] (shares collaborative and connective properties)

---
---
---

Above is the knowledge guide for skogai-memory as well as a memory called example-memory-multiple-relations.md

Please return your ratings and what you see as good and bad about the memory example-memory-multiple-relations.md and how it follows the skogai-memory knowledge guide.


