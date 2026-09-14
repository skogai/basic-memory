---
title: README
type: note
permalink: skogai/todo/prompts/readme
---

# Prompts Documentation

Reusable prompt templates for various tasks in the SkogAI ecosystem.

## Overview

This directory contains curated prompt templates designed for common workflows, project management, and AI agent interactions. These templates help maintain consistency and efficiency across different tasks and sessions.

## Contents

### [intro.md](./intro.md)

Introduction prompt template for starting new sessions or introducing the SkogAI environment to AI agents.

**Purpose**: Establish context and set expectations at the beginning of agent interactions.

### [next-session.md](./next-session.md)

Session continuity prompt template for resuming work across multiple sessions.

**Key Features**:

- Session state preservation
- Context restoration
- Task continuity
- Progress tracking

**Use Case**: Starting a new session and need to restore context from previous work.

### [project-summary-pre.md](./project-summary-pre.md)

Pre-summary prompt for generating project overviews and status reports.

**Purpose**:

- Prepare for project summaries
- Gather context before reporting
- Structure project information

**Use Case**: Before creating comprehensive project documentation or status updates.

### [todo.md](./todo.md)

Todo management prompt template for task organization and tracking.

**Features**:

- Task structuring
- Priority management
- Progress tracking
- Action item organization

**Use Case**: Managing project tasks, creating task lists, and tracking progress.

### [file-structure.md](./file-structure.md)

File structure prompt template for generating and documenting project organization.

**Purpose**:

- Document directory structures
- Explain file organization
- Provide navigation context
- Generate structure overviews

**Use Case**: When needing to explain or document project file organization.

### [uv.md](./uv.md)

UV package manager workflow prompt for Python package management.

**Key Topics**:

- Package installation and management
- Virtual environment setup
- Dependency resolution
- UV command patterns

**Use Case**: Working with Python projects and UV package manager.

## Usage Guidelines

### How to Use These Prompts

1. **Direct Copy**: Copy prompt content directly into agent interactions
1. **Customization**: Adapt prompts to specific project needs
1. **Combination**: Combine multiple prompts for complex workflows
1. **Reference**: Use as reference for creating new prompts

### When to Use Prompts

- **Starting New Sessions**: Use intro and session continuity prompts
- **Project Documentation**: Use file-structure and project-summary prompts
- **Task Management**: Use todo prompts for organizing work
- **Package Management**: Use uv prompt for Python dependency work
- **Context Setting**: Use any prompt to establish working context

## Best Practices

### Effective Prompt Usage

1. **Adapt to Context**: Customize prompts for specific situations
1. **Maintain Consistency**: Use similar prompts across sessions for consistency
1. **Update Regularly**: Keep prompts current with project evolution
1. **Document Changes**: Note significant modifications to prompt templates
1. **Share Patterns**: Contribute successful prompt patterns back

### Creating New Prompts

1. **Clear Purpose**: Define specific use case
1. **Structured Format**: Use consistent formatting
1. **Actionable Content**: Include concrete steps or examples
1. **Reusable Design**: Make templates adaptable
1. **Documentation**: Explain prompt purpose and usage

## Integration with Workflows

### AI Agent Sessions

- Load relevant prompts at session start
- Use prompts to restore context
- Apply prompts for specific tasks
- Maintain prompt library for quick access

### Development Workflow

- Use file-structure prompts during code review
- Apply todo prompts for sprint planning
- Utilize uv prompts for dependency management
- Leverage summary prompts for documentation

### Documentation Workflow

- Generate structure documentation with file-structure prompts
- Create project summaries with summary prompts
- Maintain task lists with todo prompts
- Document session work with continuity prompts

## Related Documentation

- [@../context/file-structure.md](../context/file-structure.md) - File structure utility documentation
- [@../system/uv.md](../system/uv.md) - UV package manager setup
- [@../tools/](../tools/) - Tool development that may use prompts
- [@../interfaces/aichat/](../interfaces/aichat/) - AIChat integration for prompt delivery
