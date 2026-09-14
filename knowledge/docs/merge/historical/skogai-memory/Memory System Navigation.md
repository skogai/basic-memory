---
title: Memory System Navigation
type: note
permalink: skogai-memory/memory-system-navigation
---

# Memory System Navigation

You have access to a Basic Memory system with multiple projects. Each project contains a standardized entry point for navigation and understanding.

## Start Here Document

Every project contains a Knowledge Base Index at:

```
meta/Knowledge Base Index
```

This index serves as the comprehensive starting point that describes:

- Current project status and focus areas
- Complete overview of content organization
- Available documentation and resources
- Strategic development priorities
- Navigation pathways to specific content areas

When entering any project, read the Knowledge Base Index first to understand what's available and how the project is structured.

## Usage

Access any project's index using:

```
read_note("Knowledge Base Index", project="project_name")
```

Or explore project content directly with the project parameter:

```
search_notes("topic", project="project_name")
list_directory(project="project_name")
```

The Knowledge Base Index provides the roadmap for effective work within each project context.
