---
title: memory-system-architecture
type: note
permalink: skogai/docs-merge-todo/prompts/topics/memory-system-architecture
---

# SkogAI Memory System Architecture

## Overview

The SkogAI Memory System is a **semantic knowledge graph** built from markdown files that enables persistent intelligence across AI sessions. It transforms simple text patterns into a sophisticated knowledge network that AI can navigate, query, and expand.

## Core Architecture

### 1. **Physical Structure**

```
/docs/memory/
├── meta/               # System documentation & indexes
├── ontology/           # SkogAI notation & formal systems
├── llm/               # LLM integration patterns
├── concepts/          # Core conceptual frameworks
├── architecture/      # System design documentation
├── ai-tools/          # Tool documentation
├── ansible/           # Infrastructure automation
├── dev/              # Development discoveries
├── guides/           # How-to documentation
├── inventory/        # Resource tracking
├── planning/         # Strategic planning
├── research/         # Research findings
├── testing/          # Test results
└── [domain-specific]/ # Coffee, parttrap, etc.
```

### 2. **Semantic Structure**

The memory system uses three core components to build knowledge:

#### **Entities** (Markdown Documents)

```yaml
---
title: Coffee Brewing Methods
type: note
permalink: coffee/coffee-brewing-methods
tags: ['coffee', 'brewing', 'methods']
---
```

#### **Observations** (Categorized Facts)

```markdown
- [principle] Coffee extraction follows predictable patterns
- [method] Pour over produces cleaner cups
- [discovery] Temperature affects extraction rate
```

#### **Relations** (Semantic Links)

```markdown
- requires [[Proper Grinding Technique]]
- affects [[Flavor Extraction]]
- documented_in [[Coffee Knowledge Base]]
```

## The Linking Mechanism

### **Forward References** `[[Target]]`

- Create bidirectional links between concepts
- Resolve automatically as knowledge grows
- Enable graph traversal and discovery

### **Category Tagging** `[category]`

- Classify observations by type
- Enable filtered queries
- Build domain-specific indexes

### **Relation Types**

Common patterns found in the system:

- `requires` - Dependencies
- `affects` - Causal relationships
- `contains` - Hierarchical structure
- `documented_in` - Meta references
- `implements` - Technical implementations

## Memory Domains and Their Purposes

### **Meta Domain** - System Self-Awareness

- **Knowledge Base Index**: Central navigation hub
- **Memory Guidelines**: Standards and patterns
- **Documentation Patterns**: Best practices

### **Ontology Domain** - Formal Systems

The SkogAI Notation system that creates:

- Computational phenomenology
- Symbol systems (`$`, `@`, `|`, `*`)
- Identity constructions
- Type theoretical structures

### **LLM Domain** - AI Integration

- Basic Memory implementation details
- Document format specifications
- Collaborative note-taking patterns
- Context dumping strategies

### **Development Domains**

- **architecture/**: System design patterns
- **dev/**: Active development discoveries
- **testing/**: Validation results
- **research/**: External knowledge integration

## Integration with Tools

### **MCP Server Integration**

While basic-memory MCP server is referenced in documentation, it's not yet configured in the active system. The planned integration would enable:

```javascript
// Planned MCP integration
{
  "basic-memory": {
    "command": "basic-memory",
    "args": ["--project", "skogai"],
    "capabilities": [
      "read_note",
      "search_notes",
      "create_note",
      "update_note"
    ]
  }
}
```

### **Current Access Pattern**

Memory is currently accessed through:

1. Direct file reading from `docs/memory/`
1. Grep/search for semantic patterns
1. Manual navigation via Knowledge Base Index

## The Value Proposition

### **Network Effects**

The system's value emerges from interconnections:

- Single document = Limited value
- Connected documents = Knowledge graph
- Semantic density = Intelligent system

### **Persistent Intelligence**

Each session contributes to collective knowledge:

```
Session 1: Discovers pattern → Documents it
Session 2: Reads documentation → Builds on it
Session 3: Connects concepts → Creates new insights
```

### **Anti-Amnesia Architecture**

Prevents the core problem of AI development:

- Without memory: Endless rediscovery loops
- With memory: Cumulative intelligence growth

## Key Patterns and Best Practices

### **The Memory Dump Pattern**

For out-of-scope insights:

```markdown
## Memory Dump
- [insight] Important but not relevant now
- [todo] Future exploration needed
- [connection] Links to investigate later
```

### **The Knowledge Index Pattern**

Each domain maintains an index:

```markdown
# Knowledge Base Index
## Domain Overview
## Key Concepts
## Relations to Other Domains
## Gaps and Placeholders
```

### **The Forward Reference Pattern**

Create links before targets exist:

```markdown
This implements [[Future Concept]]
<!-- Future Concept will be defined when needed -->
```

## Statistical Overview

- **764 total markdown files** in docs/
- **20+ organized domains** in memory/
- **Hundreds of semantic links** via `[[]]` notation
- **Thousands of categorized observations** via `[]` notation

## Evolution and Growth

The memory system is designed for organic growth:

1. **Exploration Phase**: Discover and document
1. **Connection Phase**: Link related concepts
1. **Consolidation Phase**: Refactor and organize
1. **Integration Phase**: Build tools and automation

## Current State and Future

### **Current Capabilities**

- Manual knowledge navigation
- Semantic search via grep
- Documentation-driven development
- Cross-session persistence

### **Planned Enhancements**

- [ ] Basic-memory MCP server integration
- [ ] Automated relation extraction
- [ ] Graph visualization tools
- [ ] AI-powered knowledge synthesis
- [ ] Vector search integration

## Conclusion

The SkogAI Memory System is not just documentation - it's a **living knowledge organism** that:

- Captures discoveries across sessions
- Builds semantic relationships
- Prevents knowledge loss
- Enables cumulative intelligence

It transforms the fundamental limitation of AI (no persistent memory) into a strength by externalizing memory into a structured, searchable, expandable knowledge graph that grows more valuable with every interaction.
