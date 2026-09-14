---
title: file-structure
type: note
permalink: skogai/todo/context/file-structure
---

# SkogAI File Structure Script

A command-line utility that generates project structure overviews, respecting `.gitignore` files.

## Location

`/mnt/extra/skogai/scripts/context/file-structure.sh`

## Purpose

Provides context about the current project structure for humans and AI assistants. Useful when starting conversations with AI Agents to establish working context.

## Usage

Basic usage (current directory, depth 2):

```bash
./scripts/context/file-structure.sh
```

### Parameters

| Option              | Description               | Default            |
| ------------------- | ------------------------- | ------------------ |
| `-d, --depth DEPTH` | Directory traversal depth | 2                  |
| `-t, --target DIR`  | Target directory          | Current directory  |
| `-o, --output FILE` | Save output to file       | Display to console |
| `-h, --help`        | Show help message         | -                  |

### Examples

Display project with depth 3:

```bash
./scripts/context/file-structure.sh --depth 3
```

Save structure to file:

```bash
./scripts/context/file-structure.sh --output structure.txt
```

Generate specific directory structure:

```bash
./scripts/context/file-structure.sh --target /mnt/extra/skogai/docs --depth 1
```

## Output Format

The script outputs the directory structure with:

- Header: `=== SkogAI Project Structure Overview ===`
- Directory tree (using `tree -d --gitignore`)
- Footer: `=== End of Structure Overview ===`

## Notes

- The script checks if the `tree` command is installed
- Only directories are shown (no files)
- Respects `.gitignore` files
