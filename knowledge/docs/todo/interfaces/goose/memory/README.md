---
title: README
type: note
permalink: skogai/todo/interfaces/goose/memory/readme
---

# Goose Memory System

This directory contains memory files used by the Goose AI assistant within the SkogAI ecosystem.

## Structure

- `.txt` files in this directory's root are loaded by the memory extension
- Files must use the format: `# tag1 tag2 tag3` as the first line, followed by content
- Files are stored by category name (filename without extension)
- `.md` files are ignored by the memory system (like this README)
- Subfolders and their contents are NOT processed by the memory system

## Memory Categories

Current categories include user interaction preferences, project structure information, RAG system configuration, and component details.

## Old Memories

The `old/` directory contains previous memory entries that are being evaluated for integration with the current system. Since subfolders are not processed by the memory system, this provides a safe workspace for analyzing and migrating old memories.

## Usage Notes

When creating memories via the extension:

1. Category becomes the filename
1. Tags are included in the first line with `#` prefix
1. Data is stored as plain text
1. Files are saved with `.txt` extension

The memory system allows for both global and local (session-specific) memories.

## Organization

- Keep active memories in the root directory
- Store documentation, archived memories, or work-in-progress in subfolders
- This separation allows for hierarchical organization without affecting the active memory system
