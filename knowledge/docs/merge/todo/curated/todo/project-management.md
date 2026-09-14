---
permalink: todo/curated/todo/project-management
---

______________________________________________________________________

categories:

1. **Project Management**: The file discusses project management concepts, such as project visibility, active projects, and API interactions.

1. **Software Development**: The file touches on system architecture, connection patterns between components, and implementation details.

1. **API/CLI Integration**: The file explores the relationship between command-line interfaces (CLI) and APIs in a project management context. tags:

1. Project Management

1. API

1. CLI

1. System Architecture

1. Software Development

## Note that there are no specific programming language tags mentioned in the file, such as "Python" or "JavaScript", which suggests that this is not a code snippet file. The content appears to be more focused on project management and software development best practices rather than coding-specific topics.

# project-management

## key observations

- command line project changes (`skogcli memory project set-active`) are not reflected in the extension API #inconsistency #api
- the API's `project_info` function shows different information than the command line's `project info` #divergence
- notes created through the API go to the project that was active when the MCP was started #persistence
- the SkogCLI project was visible in command line but not in the API's project list #visibility

## practical implications

- to work with a specific project via the API, the MCP must be started/restarted with that project active #workflow
- changes to the active project require restarting the MCP server to take effect #requirement
- multiple MCPs could potentially be running with different active projects #architecture

## project connection architecture

- when an MCP server starts, it establishes a connection to a specific memory project #connection
- this connection persists throughout the session and doesn't detect changes made via CLI tools #persistence
- the `skogai-memory` extension operates through this established MCP connection #operation
- the CLI tool and the extension API don't share the same active project state #separation

## best practices

- set the desired active project before starting the MCP server #initialization
- restart the MCP server when switching between projects #switching
- use the command line to verify which project is active before API operations #verification
- be aware that the API's project_info may not reflect recent command line changes #awareness

## observations

- [fact] MCP servers maintain connection to the project active when they started #architecture #persistence
- [decision] switching active projects requires restarting the MCP server #workflow #requirement
- [technique] verify active project status before performing API operations to prevent errors #validation #safety
- [principle] understanding the separation between CLI and API project contexts is essential #architecture #mental-model
- [requirement] tools that switch between projects must handle MCP server restarts properly #implementation #reliability

## relations

- relates_to \[[memory-system]\] (describes how memory projects interconnect with tools)
- implements \[[system-architecture]\] (details connection patterns between components)
- part_of \[[best-practices]\] (provides guidance for effective system usage) EOF 2>&1
