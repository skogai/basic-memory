---
categories:
tags:
permalink: curated/home/skogix/skogai/docs/lore/old-backup/brainstorm-early-skogcli
---

# SkogAI Brainstorm

## Ideas for Development

1. **CLI Tool**:

   - The `skogai` CLI tool will be the core component for managing the system.
   - Modular commands for interacting with agents, configurations, and logs.

1. **Configuration Management**:

   - Use YAML for flexible, agent-specific settings stored in `~/.config/skogai/agents.d`.

1. **Agent Isolation**:

   - Consider virtual environments or lightweight containers to ensure dependency isolation.

1. **API Integration**:

   - Initial preference for LiteLLM as the AI interface, with room to adapt if needed.

1. **Documentation Tools**:

   - Focus on an agent or process to generate and maintain clear documentation for configurations and workflows.

1. **Dashboard**:

   - A potential web dashboard to visualize agent statuses and logs, though the exact framework or tool remains undecided.

1. **AUR Distribution**:

   - Package SkogAI for the Arch AUR to streamline installation and updates.

______________________________________________________________________

## Documentation

### Purpose of Documentation

- Documentation will serve a dual role:
  1. As a reference for developers and users.
  1. As dynamic instructions for local AI agents to adapt their behavior based on context.

### Folder-Specific Conventions

- Each project folder will include a `.skogai/conventions.md` file to:
  - Document folder-specific workflows, standards, and conventions.
  - Provide contextual rules for local AI agents to adjust their behavior dynamically.

### Integration with RAG

- Documentation will integrate with a Retrieval-Augmented Generation (RAG) system to:
  - Retrieve relevant information for queries based on the current project context.
  - Limit AI scope to avoid irrelevant or out-of-context suggestions.

### Standardization

- The structure of `.skogai/conventions.md` will be standardized to include:
  - **Project Overview**: High-level details about the project.
  - **Folder-Specific Guidelines**: Rules for workflows, coding standards, or processes.
  - **AI Behavior Expectations**: Specific directives for how AI agents should behave within the folder.

### Automation

- Implement tools within the `skogai` CLI to:
  - Parse `conventions.md` for AI initialization.
  - Automatically apply folder-specific conventions during AI operation.

### Documentation Generator

- Develop a generator to create or update `conventions.md` files based on the project's needs.

### Version Control

- Integrate version control for `conventions.md` files to:
  - Track changes over time.
  - Ensure consistency and minimize conflicts.

______________________________________________________________________

## Short-Term Goals

1. Develop the `skogai` CLI tool.
1. Set up the foundational development environment.
1. Establish robust documentation standards and tools.

______________________________________________________________________

## Open Questions

1. How to balance folder-specific conventions with global defaults as the project grows?
1. What should the default behavior be when no `conventions.md` is present in a folder?
1. How deeply should the `skogai` CLI integrate with existing tools like Aider for dynamic conventions?
