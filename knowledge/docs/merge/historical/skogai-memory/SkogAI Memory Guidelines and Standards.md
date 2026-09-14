---
title: SkogAI Memory Guidelines and Standards
type: note
permalink: skogai-memory/skog-ai-memory-guidelines-and-standards
tags:
  - guidelines
  - standards
  - ontology
  - knowledge-graph
  - quality
---

# SkogAI Memory Guidelines and Standards

## Purpose

This document establishes comprehensive guidelines for using SkogAI Memory effectively, particularly for sophisticated ontological and computational work like the Skogix notation system.

## Core Principles

### 1. Knowledge Graph Density

- **Minimum Relations**: Every note should connect to at least 2-3 other entities
- **Semantic Categories**: Use specific observation categories that reflect the content domain
- **Forward References**: Create references to entities that don't exist yet - they'll resolve automatically
- **Bidirectional Links**: When appropriate, create inverse relations

### 2. Semantic Markup Standards

#### Observations Format

```markdown
## observations
- [category] Description with semantic meaning #tag1 #tag2
```

**Standard Categories by Domain:**

- **Philosophical**: `[concept]`, `[principle]`, `[insight]`, `[paradox]`, `[foundation]`
- **Computational**: `[algorithm]`, `[structure]`, `[pattern]`, `[operation]`, `[type]`
- **Ontological**: `[symbol]`, `[mapping]`, `[relation]`, `[identity]`, `[transformation]`
- **Practical**: `[technique]`, `[tool]`, `[method]`, `[requirement]`, `[decision]`

#### Relations Format

```markdown
## relations
- relation_type [[Target Entity]] (optional context)
```

**Relation Types by Meaning:**

- **Structural**: `part_of`, `contains`, `extends`, `implements`
- **Logical**: `implies`, `contradicts`, `requires`, `enables`
- **Temporal**: `follows`, `precedes`, `evolves_from`, `generates`
- **Semantic**: `defines`, `exemplifies`, `abstracts`, `concretizes`
- **Computational**: `maps_to`, `compiles_to`, `transforms_into`, `evaluates_as`

### 3. File Organization Standards

Current clean structure achieved:

```
skogai/
├── llm/                    # AI Assistant Documentation
│   ├── example/           # Coffee demo (perfect example)
│   └── [guide documents]  # Usage and technical guides
├── ontology/              # Skogix notation system
├── meta/                  # Guidelines and standards
├── planning/              # Project management
└── test/                  # Testing area
```

### 4. Quality Metrics

#### Knowledge Graph Health

- **Relation Density**: Target 3+ relations per entity
- **Observation Richness**: Target 5+ categorized observations per entity
- **Isolation Rate**: \<20% isolated entities
- **Forward Reference Resolution**: >80% eventually resolved

#### Documentation Standards

- **Clarity**: Complex concepts explained clearly with examples
- **Completeness**: All major aspects covered systematically
- **Cross-References**: Rich connections to related work
- **Consistency**: Stable terminology and formatting

## Implementation Guidelines

### When Recording Context

1. **Permission First**: "Would you like me to record our discussion about [topic]?"
1. **Rich Semantic Markup**: Include at least 3-5 categorized observations
1. **Multiple Relations**: Connect to at least 2-3 related entities
1. **Cross-Domain Links**: Connect practical and theoretical aspects
1. **Confirmation**: "I've recorded our discussion in Basic Memory with connections to [related topics]"

### For Collaborative Work

1. **Shared Vocabulary**: Establish clear definitions for domain-specific terms
1. **Version Tracking**: Document how concepts evolve over time
1. **Cross-Reference**: Link related work across different domains
1. **Integration Points**: Identify where different areas of work connect

## observations

- [standard] Comprehensive guidelines ensure consistent knowledge representation #quality #standards
- [principle] Rich semantic markup enables sophisticated knowledge graph analysis #semantics #analysis
- [framework] Multi-domain approach connects philosophical and computational perspectives #integration #domains
- [success] Clean structure achieved through systematic duplicate removal #cleanup #organization

## relations

- guides \[[Collaborative Note-Taking Best Practices]\] (provides implementation standards)
- supports \[[Basic Memory Document Format]\] (defines semantic markup standards)
- enables \[[Knowledge Graph Construction]\] (establishes quality framework)
- validates \[[Skogix Symbol System]\] (testing framework for ontology work)
