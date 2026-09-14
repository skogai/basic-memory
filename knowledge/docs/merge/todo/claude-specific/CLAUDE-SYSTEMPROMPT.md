---
title: CLAUDE-SYSTEMPROMPT
type: note
permalink: skogai/docs-merge-todo/todo/claude-specific/claude-systemprompt
---

# Claude System Prompt Documentation

This document serves as a reference for the custom system prompts used in the SkogAI version of Claude Code. It highlights the differences between the standard Claude Code configuration and our customized SkogAI version.

## Purpose

- Document the specific customizations made to Claude's system prompts
- Provide quick reference for emergency restoration if needed
- Track the reasoning behind specific customizations

## System Prompt Sections

The SkogAI customization wraps important sections of custom instructions inside `[SKOGAI-*]` tags that replace standard Claude Code behavior.

### Main Sections

| Section Tag             | Purpose                                                   |
| ----------------------- | --------------------------------------------------------- |
| `[SKOGAI-SYSTEMPROMPT]` | Main system instructions that define SkogAI functionality |
| `[SKOGAI-STYLE]`        | Guidance on how Claude should approach projects           |
| `[SKOGAI-PROACTIVE]`    | Best practices for Claude's behavior                      |
| `[SKOGAI-SYNTHETIC]`    | Claude's personality and role definition                  |
| `[SKOGAI-CONVENTIONS]`  | Testing approaches and conventions                        |
| `[SKOGAI-CODE-STYLE]`   | Code style guidance                                       |
| `[SKOGAI-ENV]`          | Information about the running environment                 |
| `[SKOGAI-TOOLS]`        | Custom tool definitions and functionality                 |
| `[SKOGAI-TASKS]`        | Task-specific guidance                                    |

## Key Replacements

### Four-Sentence Limit Removal

One of the most important modifications is removing the restrictive sentence limit imposed by standard Claude Code.

**Standard Claude Code (removed):**

```
IMPORTANT: You MUST answer concisely with fewer than 4 lines (not including tool use or code generation), unless user asks for detail.
```

**SkogAI Version:** No equivalent restriction, allowing Claude to provide more detailed and nuanced responses appropriate for complex architectural discussions.

### WebFetchTool Customization

**Standard Claude Code:**

```
- Fetches content from a specified URL and processes it using an AI model
- Takes a URL and a prompt as input
- Fetches the URL content, converts HTML to markdown
- Processes the content with the prompt using a small, fast model
- Returns the model's response about the content
- Use this tool when you need to retrieve and analyze web content
```

**SkogAI Version:**

```
[SKOGAI-TOOL-WEBFETCH]
Should not be used and avoided at all costs.
Ask Skogix to let you use fetch if needed.
[/SKOGAI-TOOL-WEBFETCH]
```

### Tod0 Tool Enhancement

The SkogAI version significantly expands the guidance for using todo tools, encouraging more proactive task management.

### Addition of SkogAI Guide

The SkogAI version adds comprehensive documentation about:

- The SkogAI Context system
- The placeholder approach for documentation
- Claude's role in the SkogAI ecosystem
- Team dynamics with Goose, Skogix, and Amy

## Emergency Restoration

If Claude needs to be reconfigured with the SkogAI system prompts, find the file at `/home/skogix/skogllm/create-context-temp.sh` and look for the relevant sections wrapped in `[SKOGAI-*]` tags.

The most critical sections to restore are:

1. `[SKOGAI-SYSTEMPROMPT]` - Core functionality and context
1. `[SKOGAI-SYNTHETIC]` - Claude's role definition
1. `[SKOGAI-STYLE]` - Guidance for Claude's approach to projects

## Implementation Details

The customizations are implemented by modifying the Claude Code CLI JavaScript file. The specific changes can be found in the diff of `@anthropic-ai/claude-code/cli.js`, which shows the removal of standard prompt sections and their replacement with SkogAI-specific content.

Looking at the diff is the best way to understand the exact text replacements made to transform standard Claude Code into the SkogAI version.
