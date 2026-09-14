---
title: README
type: note
permalink: skogai/todo/context/readme
---

# Context Documentation

Documentation for file structure utilities and project organization tools.

## Overview

This directory contains documentation for utilities that help understand and document project structure within the SkogAI ecosystem.

## Contents

### [file-structure.md](./file-structure.md)

Documentation for the file-structure script that generates project structure overviews. This command-line utility:

- Generates project structure overviews
- Respects `.gitignore` files
- Provides context for humans and AI assistants
- Useful when starting conversations with AI agents to establish working context

**Location**: `/mnt/extra/skogai/scripts/context/file-structure.sh`

**Key Features**:

- Configurable depth traversal
- Target directory specification
- Output to console or file
- Automatic `.gitignore` respect

## Usage

These utilities are particularly useful when:

- Starting new AI agent sessions
- Documenting project structure
- Understanding codebases
- Generating context for collaboration

## Related Documentation

- [@../system/environment-variables.md](../system/environment-variables.md) - Environment variable configuration
- [@../prompts/file-structure.md](../prompts/file-structure.md) - Prompt template for file structure
