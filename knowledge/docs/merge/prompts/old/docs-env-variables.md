---
permalink: skogai/docs-merge-todo/prompts/old/docs-env-variables
---

______________________________________________________________________

\<<\<<\<<\<< HEAD:docs-merge-todo/prompts/old/docs-env-variables.md title: Environment Variables description: Documentation of environment variables used in the SkogAI tools system date: '2023-11-06' tags:

- environment
- variables
- tools
- agents
- llm-functions permalink: prompts/old/docs-env-variables |||||||| parent of 080afdc (more add):prompts/prompts/old/docs-env-variables.md title: "Environment Variables" description: "Documentation of environment variables used in the SkogAI tools system" date: "2023-11-06" tags: ["environment", "variables", "tools", "agents", "llm-functions"] ======== title: "Environment Variables" description: "Documentation of environment variables used in the SkogAI tools system" date: "2023-11-06" tags: ["environment", "variables", "tools", "agents", "llm-functions"] status: "published"

> > > > > > > > 080afdc (more add):todo/intefaces/aichat/environment-variables.md

______________________________________________________________________

# Environment Variables

The tools system uses various environment variables to control behavior, pass context information, and configure runtime settings. This document provides a comprehensive reference to all environment variables used in the SkogAI tools ecosystem.

## System-Injected Variables

These variables are automatically injected by the tool/agent runtime system.

### Tool Execution Variables

| Variable Name        | Description                                   | Example                                           |
| -------------------- | --------------------------------------------- | ------------------------------------------------- |
| `LLM_ROOT_DIR`       | Path to the llm-functions directory           | `/home/skogix/skogai/tools`                       |
| `LLM_TOOL_NAME`      | Name of the currently executing tool          | `execute_command`                                 |
| `LLM_TOOL_CACHE_DIR` | Directory where the tool can store cache data | `/home/skogix/skogai/tools/cache/execute_command` |

### Agent Execution Variables

| Variable Name         | Description                                    | Example                                 |
| --------------------- | ---------------------------------------------- | --------------------------------------- |
| `LLM_AGENT_NAME`      | Name of the currently executing agent          | `todo`                                  |
| `LLM_AGENT_FUNC`      | Specific agent function being called           | `list_todos`                            |
| `LLM_AGENT_ROOT_DIR`  | Path to the agent's directory                  | `/home/skogix/skogai/tools/agents/todo` |
| `LLM_AGENT_CACHE_DIR` | Directory where the agent can store cache data | `/home/skogix/skogai/tools/cache/todo`  |

## Runtime Injected Variables (AIChat)

These variables are injected by AIChat when it calls tools.

| Variable Name          | Description                                       | Example                                        |
| ---------------------- | ------------------------------------------------- | ---------------------------------------------- |
| `LLM_OUTPUT`           | File path where tool results should be written    | `/dev/stdout`, `/tmp/aichat-result-12345.json` |
| `LLM_AGENT_VAR_<NAME>` | Agent variable values (uppercase version of name) | `LLM_AGENT_VAR_MODE=verbose`                   |

## User-Configurable Variables

These variables can be set by users to control system behavior.

| Variable Name          | Description                                       | Default                 | Example                              |
| ---------------------- | ------------------------------------------------- | ----------------------- | ------------------------------------ |
| `LLM_DUMP_RESULTS`     | Regex pattern of which tools should print results | empty (no printing)     | `get_current_weather\|fs.*\|todo:.*` |
| `LLM_MCP_NEED_CONFIRM` | Regex pattern of which tools require confirmation | empty (no confirmation) | `git_commit\|git_reset\|fs_rm`       |
| `LLM_MCP_SKIP_CONFIRM` | Regex pattern of which tools skip confirmation    | empty (none skip)       | `git_status\|git_diff\|fs_ls`        |

## Built-in Agent Variables

Agent variables that are automatically provided to all agents.

| Variable Name   | Description                      | Example                    |
| --------------- | -------------------------------- | -------------------------- |
| `__os__`        | Operating system name            | `linux`                    |
| `__os_family__` | Operating system family          | `unix`                     |
| `__arch__`      | System architecture              | `x86_64`                   |
| `__shell__`     | Current user's default shell     | `bash`                     |
| `__locale__`    | User's preferred language/region | `en-US`                    |
| `__now__`       | Current timestamp (ISO 8601)     | `2024-07-29T08:11:24.367Z` |
| `__cwd__`       | Current working directory        | `/home/skogix/projects`    |
| `__tools__`     | List of available tools          |                            |

## Environment Variable Usage in Tools

To access these variables in different scripting languages:

### Bash

```bash
#!/bin/bash
# @description Example of accessing environment variables

echo "Tool name: $LLM_TOOL_NAME"
echo "Tool cache directory: $LLM_TOOL_CACHE_DIR"
```

### Python

```python
#!/usr/bin/env python3
# @description Example of accessing environment variables

import os

print(f"Tool name: {os.environ.get('LLM_TOOL_NAME')}")
print(f"Tool cache directory: {os.environ.get('LLM_TOOL_CACHE_DIR')}")
```

### JavaScript

```javascript
#!/usr/bin/env node
// @description Example of accessing environment variables

console.log(`Tool name: ${process.env.LLM_TOOL_NAME}`);
console.log(`Tool cache directory: ${process.env.LLM_TOOL_CACHE_DIR}`);
```

## Using Environment Variables with AIChat

To set environment variables when using AIChat:

1. **Command-line for a single session**:

   ```bash
   LLM_DUMP_RESULTS="fs_.*" aichat
   ```

1. **In your shell profile (e.g., `.bashrc`) for all sessions**:

   ```bash
   export LLM_DUMP_RESULTS="fs_.*"
   ```

1. **Using a `.env` file in the current directory**:

   ```
   LLM_DUMP_RESULTS=fs_.*
   LLM_MCP_NEED_CONFIRM=fs_rm|fs_write
   ```

## Environment Variables in Agent Configuration

Agent variables are defined in the agent's `index.yaml` file:

```yaml
variables:
  - name: mode
    description: Operating mode
    default: normal
  - name: format
    description: Output format
    default: json
```

These become accessible in:

1. **Instructions** using template variables: `{{mode}}`, `{{format}}`
1. **Tool scripts** as environment variables: `$LLM_AGENT_VAR_MODE`, `$LLM_AGENT_VAR_FORMAT`

## Practical Examples

### Debugging Tool Output

To see all file system tools' output:

```bash
export LLM_DUMP_RESULTS="fs_.*"
```

### Adding Safety Confirmations

To require confirmation for potentially dangerous operations:

```bash
export LLM_MCP_NEED_CONFIRM="fs_rm|fs_write|execute_command"
```

### Using Agent Variables

Setting specific behavior for an agent:

```yaml
# In agent's index.yaml
variables:
  - name: detail_level
    description: How much detail to include in outputs
    default: medium
```

Then in an agent tool:

```bash
# @cmd Process data with configured detail level
process_data() {
  case "$LLM_AGENT_VAR_DETAIL_LEVEL" in
    low)
      echo "Processing with minimal detail"
      ;;
    medium)
      echo "Processing with standard detail"
      ;;
    high)
      echo "Processing with maximum detail"
      ;;
  esac
}
```

## Best Practices

1. **Security Sensitivity**: Treat environment variables as potential security boundaries
1. **Validation**: Always validate environment variable content before use
1. **Defaults**: Provide sensible defaults when variables might be unset
1. **Documentation**: Document which environment variables your tools use
1. **Scoping**: Use naming conventions to avoid variable collisions
1. **Secret Handling**: Avoid putting secrets directly in environment variables where possible

______________________________________________________________________

Environment variables provide a flexible way to configure and control the behavior of tools and agents in the SkogAI ecosystem. By understanding and properly utilizing these variables, you can create more adaptable and secure implementations.
