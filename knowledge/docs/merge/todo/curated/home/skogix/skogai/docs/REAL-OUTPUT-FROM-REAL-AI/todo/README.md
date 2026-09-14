---
permalink: evaluation/todo/readme-2
---

# SkogAI Memory System

## What is this?

SkogAI Memory is a knowledge management system that organizes information in markdown files with semantic relationships. It enables both AI assistants and humans to store, retrieve, and connect knowledge efficiently.

## Key components

- **Markdown files**: Simple text files store all content
- **Observations**: Categorized facts with tags `[category] observation #tags`
- **Relations**: Links between documents using specific relation types
- **Memory URL**: References to other documents via `memory://` protocol

## How the system works

1. Content starts in the `todo` folder with proper naming in kebab case (lowercase-words-with-hyphens.md)
1. Files follow standards defined in `RULES.md`
1. Automated tools help enforce consistency and quality
1. Documents move to appropriate permanent locations
1. Relations build a connected knowledge graph

## Enforcement process

Files are automatically checked against rules using:

- `summarize.sh`: Analyzes and summarizes content
- `enforce.sh`: Applies rules and fixes issues
- Changes are tracked in `CHANGES.md`

## Why we do things this way

- **Consistency**: Standards enable automation and reliable tooling
- **Structure**: Clear patterns make knowledge discoverable
- **Connections**: Relations between documents create network value
- **Simplicity**: Clean naming and organization reduce cognitive load
- **Automation**: Properly structured content enables AI assistance

## Getting started

1. Read `RULES.md` for naming and structure standards
   - **IMPORTANT**: All files must use kebab case: lowercase with hyphens (e.g., `file-name.md`)
   - Exception: System files may use uppercase (README.md, RULES.md)
1. Place new content in `todo` folder with clean naming
1. Use proper observations and relations formats
1. Let automated systems help maintain quality
1. Focus on content and connections, not perfect formatting

## observations

- [fact] markdown files provide simple, portable knowledge storage #accessibility #portability
- [principle] connections between notes provide more value than isolated content #network #knowledge-graph
- [decision] automated enforcement maintains consistency with minimal effort #automation #quality
- [technique] categorized observations enable semantic filtering and discovery #organization #findability
- [requirement] all content must follow established standards for system interoperability #standards #compatibility

## relations

- implements \[[knowledge-management]\] (provides structured approach to information)
- relates_to \[[rules]\] (follows standards defined in RULES.md)
- part_of \[[skogai-ecosystem]\] (integrates with broader SkogAI tools) EOF 2>&1
