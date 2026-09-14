---
title: Skogai-Memory Extension Guide
type: note
permalink: evaluation/todo/skogai-memory-extension-guide-1
---

# Skogai-Memory Extension Guide

The skogai-memory extension provides capabilities to create, manage, and interact with a knowledge base through various tools.

## Available Tools

### Content Management

- **write_note**: Create or update a markdown note. Returns a markdown formatted summary of the semantic content.

  - Required parameters: title, content, folder
  - Optional parameters: tags

- **read_note**: Read a markdown note by title or permalink.

  - Required parameters: identifier
  - Optional parameters: page, page_size

- **read_content**: Read a file's raw content by path or permalink.

  - Required parameters: path

- **delete_note**: Delete a note by title or permalink.

  - Required parameters: identifier

### Search and Retrieval

- **search_notes**: Search across all content in the knowledge base.

  - Required parameters: query
  - Optional parameters: search_type, types, entity_types, after_date, page, page_size

- **recent_activity**: Get recent activity from across the knowledge base.

  - Optional parameters: timeframe, type, depth, max_related, page, page_size
  - Timeframe supports natural language formats like "2 days ago", "last week", "yesterday", "today", or standard formats like "7d"

- **build_context**: Build context from a memory:// URI to continue conversations naturally.

  - Required parameters: url
  - Optional parameters: timeframe, depth, max_related, page, page_size
  - Used to follow up on previous discussions or explore related topics

### Visualization

- **canvas**: Create an Obsidian canvas file to visualize concepts and connections.
  - Required parameters: nodes, edges, title, folder

### System Information

- **project_info**: Get information and statistics about the current Basic Memory project.

## Notes on Usage

- The extension integrates with the knowledge base to store and retrieve information.
- It supports markdown formatting for content.
- Search capabilities allow finding information across the knowledge base.
- The canvas functionality helps visualize relationships between concepts.
- Recent activity and context building features help maintain continuity in conversations.

## Resource Support

The skogai-memory extension supports resources, which can be accessed using:

- platform\_\_read_resource
- platform\_\_list_resources
