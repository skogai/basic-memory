---
title: Basic Memory Tools Guide
type: note
permalink: skogai-memory/basic-memory-tools-guide
tags:
  - tools
  - documentation
  - guide
  - basic-memory
---

# Basic Memory Tools Guide

## Overview

This guide explains each Basic Memory tool, what it does, and how to use it effectively. Created by analyzing the actual tool descriptions rather than making assumptions.

## Core Tools

### skogai-memory:write_note

**Purpose**: Create or update a markdown note with semantic content **Returns**: Markdown formatted summary of the semantic content

**Parameters**:

- `title` (required): The title of the note
- `content` (required): The markdown content
- `folder` (required): Which folder to save in
- `tags` (optional): Tags for categorization
- `entity_type` (optional): Defaults to "note"
- `project` (optional): Which project (defaults to current)

**Key Features**:

- Creates semantic knowledge graph from simple text patterns
- Automatically parses observations and relations
- Returns summary showing parsed semantic content

### skogai-memory:read_note

**Purpose**: Read a markdown note by title or permalink **Parameters**:

- `identifier` (required): Title or permalink
- `page`, `page_size` (optional): For pagination
- `project` (optional): Which project

**Usage**: Use exact titles or permalinks to retrieve note content

### skogai-memory:search_notes

**Purpose**: Search across all content with advanced syntax support **Parameters**:

- `query` (required): Text to search for
- `search_type` (optional): Defaults to "text"
- `entity_types`, `types` (optional): Filter by entity types
- `after_date` (optional): Date filtering
- `page`, `page_size` (optional): Pagination
- `project` (optional): Which project

**Usage**: Find notes containing specific terms or concepts

### skogai-memory:build_context

**Purpose**: Build context from a memory:// URI to continue conversations naturally **Key Feature**: Follow up on previous discussions or explore related topics

**Parameters**:

- `url` (required): Memory URL like "folder/note" or "memory://folder/note"
- `depth` (optional): How many relationship hops to follow (default 1)
- `max_related` (optional): Maximum related items (default 10)
- `timeframe` (optional): Natural language like "2 days ago", "last week" (default "7d")
- `page`, `page_size` (optional): Pagination
- `project` (optional): Which project

**Memory URL Patterns**:

- `"folder/note"` or `"memory://folder/note"`
- `"folder/*"` matches all notes in folder
- Valid characters: letters, numbers, hyphens, underscores, forward slashes
- Avoid: double slashes (//), angle brackets (\<>), quotes, pipes (|)

### skogai-memory:recent_activity

**Purpose**: Get recent activity from across the knowledge base **Parameters**:

- `timeframe` (optional): Natural language like "2 days ago", "yesterday", "today", "3 weeks ago" or standard "7d" (default "7d")
- `type` (optional): Filter by activity types
- `depth`, `max_related`, `page`, `page_size` (optional): Standard pagination
- `project` (optional): Which project

**Usage**: See what's been created or modified recently

## File Management Tools

### skogai-memory:read_content

**Purpose**: Read a file's raw content by path or permalink **Parameters**:

- `path` (required): File path or permalink
- `project` (optional): Which project

**Usage**: Access raw file content without semantic parsing

### skogai-memory:list_directory

**Purpose**: List directory contents with filtering and depth control **Parameters**:

- `dir_name` (optional): Directory to list (default "/")
- `depth` (optional): How deep to traverse (default 1)
- `file_name_glob` (optional): Pattern matching for files
- `project` (optional): Which project

**Usage**: Explore the file structure and find content

### skogai-memory:move_note

**Purpose**: Move a note to a new location, updating database and maintaining links **Parameters**:

- `identifier` (required): Current note identifier
- `destination_path` (required): New location
- `project` (optional): Which project

**Usage**: Reorganize notes while preserving relationships

### skogai-memory:delete_note

**Purpose**: Delete a note by title or permalink **Parameters**:

- `identifier` (required): Note to delete
- `project` (optional): Which project

**Usage**: Remove notes from the knowledge base

## Advanced Tools

### skogai-memory:edit_note

**Purpose**: Edit an existing note using various operations **Parameters**:

- `identifier` (required): Note to edit
- `operation` (required): Type of edit (append, prepend, find_replace, replace_section)
- `content` (required): Content to add/replace
- `find_text` (optional): Text to find for find_replace
- `section` (optional): Section name for replace_section
- `expected_replacements` (optional): Expected number of replacements (default 1)
- `project` (optional): Which project

**Operations**:

- `append`: Add content to end
- `prepend`: Add content to beginning
- `find_replace`: Replace specific text
- `replace_section`: Replace entire section

### skogai-memory:canvas

**Purpose**: Create an Obsidian canvas file to visualize concepts and connections **Parameters**:

- `nodes` (required): Array of node objects with id, label, etc.
- `edges` (required): Array of edge objects showing connections
- `title` (required): Canvas title
- `folder` (required): Where to save
- `project` (optional): Which project

**Usage**: Create visual knowledge maps and concept diagrams

## Project Management Tools

### skogai-memory:list_memory_projects

**Purpose**: List all available projects with their status **Shows**: Which projects exist, which is active, which is default

### skogai-memory:get_current_project

**Purpose**: Show currently active project and basic stats **Returns**: Current project name and statistics

### skogai-memory:switch_project

**Purpose**: Switch to a different project context **Parameters**:

- `project_name` (required): Name of project to switch to **Effect**: Changes active project for all subsequent tool calls

### skogai-memory:set_default_project

**Purpose**: Set default project in config (requires restart) **Parameters**:

- `project_name` (required): Project to make default

### skogai-memory:create_memory_project

**Purpose**: Create a new Basic Memory project **Parameters**:

- `project_name` (required): Unique name for project
- `project_path` (required): File system path
- `set_default` (optional): Whether to make this the default (default False)

### skogai-memory:delete_project

**Purpose**: Delete a project from configuration and database **Warning**: Does NOT delete actual files on disk, only removes from Basic Memory **Parameters**:

- `project_name` (required): Project to delete

## System Tools

### skogai-memory:sync_status

**Purpose**: Check status of file synchronization and background operations **Usage**:

- Check if file sync is in progress or completed
- Get detailed sync progress information
- Understand if files are fully indexed
- Get error details if sync operations failed
- Monitor initial project setup and legacy migration

**Covers**: Initial project setup, legacy migration, ongoing file monitoring, background processing

## Key Insights

### Memory URL System

Basic Memory uses special URLs to reference entities:

- `memory://title` - Reference by title
- `memory://folder/title` - Reference by folder and title
- `memory://permalink` - Reference by permalink
- `memory://path/relation_type/*` - Follow all relations of specific type
- `memory://path/*/target` - Find all entities with relations to target

### Semantic Patterns

Basic Memory automatically creates knowledge graphs from simple markdown patterns:

- **Observations**: `- [category] This is an observation #tag1 #tag2 (optional context)`
- **Relations**: `- relation_type [[Target Entity]] (optional context)`

### Best Practices

1. **Use exact titles** when referencing entities in relations
1. **Check sync status** if information seems outdated
1. **Use build_context** to explore relationships around topics
1. **Use natural language timeframes** like "last week" instead of dates
1. **Start with search_notes** to find existing content before creating new

## Observations

- [guide] Created comprehensive tool reference from actual descriptions #documentation
- [insight] Memory URLs are key to navigating the knowledge graph #navigation
- [pattern] Tools follow consistent parameter patterns across functions #api-design
- [feature] Natural language timeframes make tools more user-friendly #usability

## Relations

- documents \[[Basic Memory System]\]
- enables \[[Effective Tool Usage]\]
- supports \[[AI Agent Development]\]
