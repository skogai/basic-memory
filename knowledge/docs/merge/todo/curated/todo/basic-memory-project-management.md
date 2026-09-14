---
title: Basic Memory Project Management
type: note
permalink: system-architecture/basic-memory-project-management-1
tags:
  - '#basic-memory'
  - '#projects'
  - '#mcp'
  - '#architecture'
  - '#lessons-learned'
---

# Basic Memory Project Management

## Project Connection Architecture

- When an MCP (Multi-Context Protocol) server is started, it establishes a connection to a specific Basic Memory project
- This connection persists throughout the session and doesn't automatically detect changes made via command line tools
- The `skogai-memory` extension operates through this established MCP connection
- The CLI tool (`uvx skogai-memory`) and the extension API don't share the same active project state

## Key Observations

- Command line project changes (`uvx skogai-memory project set-active`) are not reflected in the extension API
- The API's `project_info` function shows different information than the command line's `project info`
- Notes created through the API go to the project that was active when the MCP was started
- The SkogCLI project was visible in command line (`uvx skogai-memory project list`) but not in the API's project list

## Practical Implications

- To work with a specific project via the API, the MCP must be started/restarted with that project active
- Changes to the active project require restarting the MCP server to take effect
- Multiple MCPs could potentially be running with different active projects

## Best Practices

- Set the desired active project before starting the MCP server
- Restart the MCP server when switching between projects
- Use the command line to verify which project is active before performing API operations
- Be aware that the API's project_info may not reflect recent command line changes
