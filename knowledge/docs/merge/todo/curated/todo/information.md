---
title: Synthesis of Skogai Memory Information
type: note
permalink: evaluation/todo/information-1
---

# Synthesis of Skogai Memory Information

## Overview

The "SkogAI-Memory User Guide" provides a comprehensive overview of using SkogAI-Memory to capture, organize, and reference knowledge effectively. The guide outlines the workflow, from having conversations with AI assistants to building a rich semantic network.

## Key Insights

1. **Workflow**:

   - **Conversations**: Capture knowledge through conversations with AI assistants.
   - **Capturing Knowledge**: Create Markdown files with semantic markup.
   - **Building Connections**: Use relations to connect pieces of knowledge.
   - **Referencing Knowledge**: Use memory:// URLs and natural language references.
   - **Editing Files**: Directly edit Markdown files and sync changes.
   - **Syncing**: Automatic syncing with the `skogcli memory sync` command.

1. **Creating Knowledge**:

   - **Through Conversations**: Use prompts to ask AI assistants to create notes summarizing discussions.
   - **Direct File Creation**: Manually create Markdown files with frontmatter and structured content.

1. **Using Special Prompts**:

   - **Continue Conversation**: Pick up where you left off on a topic.
   - **Recent Activity**: Get an overview of recent discussions.
   - **Search**: Find specific information using natural language, search prompts, and boolean operators.
   - **Memory URL Pattern Matching**: Use advanced patterns for precise searches.
   - **Combining Search with Context Building**: Build comprehensive context by following relationships.

1. **Referencing Knowledge**:

   - **Using memory:// URLs**: Reference specific documents directly.
   - **Natural Language References**: Refer to knowledge conversationally.
   - **Advanced References**: Follow connections across the knowledge graph.

1. **Working with Files**:

   - **File Location and Organization**: Store files in `~/skogdata/memories`.
   - **File Format**: Structure files with frontmatter, observations, and relations.
   - **Editing Files**: Use any text editor to modify files.

1. **Building a Knowledge Graph**:

   - **Creating Relations**: Build connections between pieces of knowledge.
   - **Forward References**: Reference documents that don't exist yet.

1. **Conversation Continuity**:

   - **Starting New Sessions with Context**: Use special prompts to continue conversations.
   - **Long-Term Projects**: Maintain context for complex projects over time.

1. **Advanced Features**:

   - **Importing External Knowledge**: Import existing conversations.
   - **Obsidian Integration**: Use Obsidian to visualize the knowledge network.
   - **Canvas Visualizations**: Create visual knowledge maps.
   - **Advanced Memory URI Patterns**: Use wildcards and patterns for detailed searches.

1. **Command Line Interface**:

   - **Sync Commands**: Sync changes with the `skogcli memory sync` command.
   - **Status and Information**: Check system status and CLI help.
   - **Import Commands**: Import from different sources.

1. **Multiple Projects**:

- **Managing Projects**: List, add, set default, and remove projects.
- **Using Projects in Commands**: Specify projects with the `--project` flag.
- **Project Isolation**: Maintain separate knowledge graphs for different purposes.

11. **Workflow Tips**:

- Run sync in watch mode, use git for version control, review AI-created content, and build rich connections.

12. **Troubleshooting**:

- **Sync Issues**: Verify sync status and run manual sync.
- **Missing Content**: Check paths and search terms.
- **Relation Problems**: Ensure exact title matching and verify document existence.

## Observations

- **Comprehensive Workflow**: The guide provides a structured approach to managing knowledge, from initial capture to long-term maintenance.
- **Rich Connections**: The emphasis on building relations and using memory:// URLs enhances the utility of the knowledge base.
- **Advanced Features**: Features like Obsidian integration and canvas visualizations offer powerful tools for organizing and visualizing knowledge.
- **Multiple Projects**: Support for multiple projects ensures that different aspects of life and work can be managed separately.

## Relations

- relates_to \[[SkogAI-Memory User Guide]\]
