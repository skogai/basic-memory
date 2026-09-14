---
title: Observation Categorization Guide
type: note
permalink: skogai-memory/observation-categorization-guide
---

# Observation Categorization Guide

**Purpose**: Add semantic observations to memory notes using standardized categories.

## Syntax

```markdown
## Observations
- [category] Clear statement of fact or insight #tag1 #tag2 (optional context)
```

## Standard Categories

**Knowledge Type**:

- `[fact]` - Verifiable information
- `[principle]` - Fundamental concept or rule
- `[theory]` - Explanatory framework
- `[technique]` - Specific method or approach
- `[method]` - General procedure or practice

**Development**:

- `[idea]` - Conceptual proposal
- `[decision]` - Choice made with rationale
- `[requirement]` - Necessary condition
- `[design]` - Architecture or structure choice
- `[implementation]` - How something is built

**Analysis**:

- `[pattern]` - Recurring structure or behavior
- `[insight]` - Derived understanding
- `[question]` - Unresolved inquiry
- `[issue]` - Problem or concern
- `[solution]` - Resolution approach

**Context**:

- `[preference]` - Subjective choice
- `[practice]` - Established workflow
- `[meta]` - Self-referential observation
- `[history]` - Historical context
- `[status]` - Current state

**Domain-Specific** (examples):

- `[architecture]` - System structure
- `[workflow]` - Process definition
- `[quality]` - Quality attribute
- `[metric]` - Measurable indicator

## Tag Guidelines

**Use 1-3 tags per observation** for discoverability:

- Primary topic keyword
- Secondary classification
- Domain identifier (optional)

**Format**: `#lowercase-kebab-case`

## Quality Standards

**Minimum**: 5-7 observations per document **Good**: Varied categories showing different knowledge types **Excellent**: Specific, actionable observations with precise categorization

## Good vs. Poor Examples

**Poor**:

- `[info] This is important` (vague category, no specifics)

**Good**:

- `[principle] Coffee extraction follows predictable sequence: acids → sugars → bitter compounds #extraction #chemistry`

**Poor**:

- `[fact] The system works well` (subjective, imprecise)

**Good**:

- `[metric] Knowledge graph maintains 3.2 relations per entity average #density #quality`

## Grouping Pattern

Organize observations by subtopic for readability:

```markdown
## Observations

### Technical Architecture
- [architecture] Distributed across 150+ MCP servers #distributed
- [design] Stateless resolution with three-tier hierarchy #stateless

### Workflow Patterns  
- [workflow] Default project mode simplifies repeated operations #convenience
- [practice] CLI constraint enforces project boundaries #constraint
```

## Validation

- [ ] Used specific, recognized category
- [ ] Statement is clear and actionable
- [ ] Added 1-3 relevant tags
- [ ] Observation provides value (not redundant with title/content)
- [ ] Context added where relationship needs clarification
