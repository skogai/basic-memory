---
title: project-knowledge-architecture
type: note
permalink: architecture/project-knowledge-architecture
tags:
  - '["architecture"'
  - '"knowledge-system"'
  - '"claude-md"'
  - '"basic-memory"]'
---

# Project Knowledge Architecture

## Concept

Hybrid knowledge system combining local CLAUDE.md files with basic-memory semantic linking.

## Architecture Pattern

### Local Context (CLAUDE.md files)

Each project folder contains focused CLAUDE.md with:

- Build commands specific to that project
- Architecture overview for immediate context
- Technology stack and dependencies
- Development patterns and conventions

### Semantic Links (basic-memory)

Cross-project knowledge graph connecting:

- Shared architectural patterns
- Technology relationships
- Learning from one project applied to another
- Cross-cutting concerns and dependencies

## Observations

- [strategy] CLAUDE.md provides immediate context when tools access project paths #context #local
- [strategy] Basic-memory creates semantic connections between projects #knowledge-graph #semantic
- [pattern] Progressive knowledge building through research and cross-referencing #progressive #research
- [benefit] Distributed cognitive load across the system #distributed #cognitive
- [workflow] Memory URIs allow referencing cross-project information #memory-uri #cross-reference

## Relations

- implements \[[Distributed Knowledge System]\]
- uses \[[Progressive Knowledge Building]\]
- connects \[[Project-Specific CLAUDE.md Files]\]
- enables \[[Cross-Project Learning]\]
- supports \[[Semantic Project Linking]\]

## Example Implementation

### Parttrap Project

```
/mnt/extra/work/Parttrap-One/CLAUDE.md
-> memory://projects/parttrap-project-overview
```

### Future Projects

```
/path/to/other-project/CLAUDE.md
-> memory://projects/other-project-overview
-> relates_to [[Parttrap Project Overview]]
```

## Workflow

1. Create focused CLAUDE.md in project directory
1. Write to basic-memory with semantic markup
1. Create relations to other projects
1. Use memory:// URIs for cross-project planning
1. Incrementally add detail through research
