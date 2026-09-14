---
permalink: claude-context
---

# LC Context System Guide

## Overview

The LC Context system provides tools for generating and managing context for Claude Code, improving its understanding of project structure and code relationships. These are local commands that run on the local machine, with source code located at `/home/skogix/.local/src/llm-functions`, which is the definitive source from which the program is compiled.

## Commands

### Core Commands

- `lc-init`: [Probably initializes the context system for a project, creating config files and initial context]
- `lc-context`: [Likely generates the main context document from the project files]
- `lc-outlines`: [Probably creates code outline summaries without full file contents]
- `lc-prompt`: [Likely generates or displays the current prompt template used]
- `lc-version`: [Probably displays the version of the LC Context system]

### Selection Commands

- `lc-sel-files`: [Likely a tool to manually select specific files to include in context]
- `lc-sel-outlines`: [Probably selects specific files for outline generation rather than full content]
- `lc-clip-files`: [Likely copies selected file contents to clipboard for pasting elsewhere]
- `lc-clip-implementations`: [Probably copies specific code implementations to clipboard]

### Configuration Commands

- `lc-set-profile`: [Likely changes the active context profile defining what's included]
- `lc-mcp`: [Probably generates context specifically formatted for MCP integration]
- `lc-changed`: [Likely identifies files that have changed since last context generation]

## Configuration Files

### Main Configuration

- `config.yaml`: [Likely the main configuration file defining profiles, paths, and settings]
- `curr_ctx.yaml`: [Probably tracks the current context state, including selected files and profile]
- `lc-state.yaml`: [Likely stores persistent state between runs, including timestamps]

### Content Files

- `lc-project-notes.md`: [Probably contains manual notes about the project to include in context]
- `lc-prompt.md`: [Likely contains the current prompt being used with the context]

### Templates

- `templates/lc-context.j2`: [Probably the Jinja2 template for generating the main context document]
- `templates/lc-context-mcp.j2`: [Likely the template specialized for MCP format]
- `templates/lc-definitions.j2`: [Probably the template for code definitions section]
- `templates/lc-files.j2`: [Likely the template for selected files section]
- `templates/lc-highlights.j2`: [Probably the template for important code highlights]
- `templates/lc-prompt.j2`: [Likely the template for generating prompts]

## Example Workflows

- Initial setup: [Probably describes steps to initialize context in a new project]
- Context regeneration: [Likely explains process to regenerate context after code changes]
- Selective context updates: [Probably describes how to update only parts of context]

## Integration with Claude Code

- Usage patterns: [Likely describes how Claude uses the generated context]
- Best practices: [Probably provides tips for optimal context generation]
- Troubleshooting: [Likely covers common context issues and solutions]
