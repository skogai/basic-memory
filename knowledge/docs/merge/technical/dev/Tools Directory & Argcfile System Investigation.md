---
title: Tools Directory & Argcfile System Investigation
type: note
permalink: dev/tools-directory-argcfile-system-investigation
---

# Tools Directory & Argcfile System Investigation

## Overview

Investigation of `/home/skogix/skogai/tools/` directory and `Argcfile.sh` system as part of SkogAI system documentation.

## Directory Structure

```
tools/
├── Argcfile.sh (23KB)
├── agents/ (10 subdirectories)
├── docs/
├── mcp/
├── scripts/
├── tools/
├── utils/
├── README.md
├── AGENTS.md
└── configuration files (tools.txt, agents.txt, mcp.json)
```

## Argcfile.sh Analysis

- Size: 23,474 bytes
- Framework: argc-based CLI tool
- Languages supported: bash, node, python via `LANG_CMDS` array
- Core directories: `bin/`, `cache/__tmp__/`, `.venv/`

### Main Commands

- `run@tool` - Execute tools with JSON input/output
- `run@agent` - Execute agents with actions and JSON data
- `build` - Build entire project (tools, agents, MCP functions)
- `build@tool/build@agent` - Build specific components
- `test@tool/test@agent` - Test components with demo functionality
- `check` - Verify dependencies and environment
- `clean` - Remove build artifacts
- `list@tool/list@agent` - Show available components

### Integration Features

- `link-to-aichat` - Connect to aichat functions
- `link-web-search/code-interpreter` - Link specific tool types
- `mcp` - MCP server integration
- `create@tool` - Generate tool boilerplate

## Agent Directories

Located in `agents/`:

- blacksmith/
- coder/
- demo/
- git-flow/
- json-viewer/
- librarian/
- sql/
- todo/

Each agent directory contains function declarations and implementation files.

## Build Output (argc build)

### Tools Built (25+ tools)

- File operations: fs_cat, fs_ls, fs_mkdir, fs_patch, fs_rm, fs_write
- Execution: execute_command, execute_js_code, execute_py_code, execute_sql_code
- Web/API: fetch_url_via_curl, fetch_url_via_jina, web_search\_\*
- Search: search_arxiv, search_wikipedia, search_wolframalpha
- Communication: send_mail, send_twilio
- Utilities: get_current_time, get_current_weather, get-uncertainty
- Custom: skogai, test, demo\_\*, fizz, wawa

### Agents Built

Each agent generates:

- Individual functions.json file
- Binary executable in bin/
- Associated tool dependencies

## MCP Integration (argc mcp start)

Starts MCP Bridge server and builds 19 basic-memory functions:

- skogai_memory_delete_note
- skogai_memory_read_content
- skogai_memory_build_context
- skogai_memory_recent_activity
- skogai_memory_search_notes
- skogai_memory_read_note
- skogai_memory_view_note
- skogai_memory_write_note
- skogai_memory_canvas
- skogai_memory_list_directory
- skogai_memory_edit_note
- skogai_memory_move_note
- skogai_memory_sync_status
- skogai_memory_list_memory_projects
- skogai_memory_switch_project
- skogai_memory_get_current_project
- skogai_memory_set_default_project
- skogai_memory_create_memory_project
- skogai_memory_delete_project

## Public API Endpoint

URL: https://tools.skogai.se/tools Returns: JSON array of tool definitions with name, description, parameters, and mcp metadata Size: 12,397 bytes response

## File Dependencies

- `tools.txt` - Lists tools to build
- `agents.txt` - Lists agents to build
- `mcp.json` - MCP server configuration
- `functions.json` - Generated function declarations

## Environment Variables Referenced

- `SKOGAI_ARGC=/home/skogix/skogai/tools/Argcfile.sh` (from plan.md)

## Status

- Repository cloned from skogai/tools
- Build system functional
- MCP server operational
- Public API endpoint accessible
- All major components documented
