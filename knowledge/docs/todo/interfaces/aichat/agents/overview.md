---
title: Agent System Overview
description: Comprehensive overview of the agent system in SkogAI
category: interfaces
subcategory: aichat
tags:
  - agent
  - aichat
  - tools
  - llm-functions
  - configuration
version: 0.1.0
status: draft
created: '2024-07-01'
updated: '2024-07-01'
permalink: skogai/todo/interfaces/aichat/agents/overview
---

# Agent System Overview

[prompt:intro] This document describes the agent system used in SkogAI, which builds upon AIChat's role system with significantly enhanced capabilities through the llm-functions framework. [/prompt:intro]

## Roles vs. Agents: Understanding the Distinction

SkogAI utilizes both AIChat roles and llm-functions agents, which have important distinctions:

### AIChat Roles (Basic)

AIChat roles are simple configuration files that provide:

- A system prompt that defines the AI's persona and instructions
- Tool permissions in a YAML front matter block (like `use_tools: fs, run_command`)
- Optional variable placeholders (e.g., `{{mode}}`, `{{task}}`)

Example of the SkogAI basic role:

```yaml
---
use_tools: fs, run_command
---

Your name is SkogAI

You are operating in {{mode}} mode. Your current task is to {{task}}.

The current working directory is set to {{pwd}}. Use this as a reference point when working with relative file paths.

You have access to a special tool: ./scripts/aichat-help.sh which can be used to ask questions about AIChat...
```

These roles provide basic customization but lack advanced capabilities like dedicated tool implementations, RAG systems, or specialized function definitions.

### Agents (Advanced)

Agents in the llm-functions framework are complete AI systems with:

- Dedicated configuration files (`index.yaml`)
- Custom tool implementations (in Bash, Python, JavaScript)
- Function schemas for structured interaction
- Integrated RAG document collections
- Environment-aware templates
- Custom variable systems
- Conversation starters

## Agent Structure and Components

A complete agent consists of the following components:

### 1. Configuration (`index.yaml`)

The central configuration file that defines:

```yaml
name: Demo
description: An AI agent that demonstrates agent capabilities
version: 0.1.0
instructions: |
  You are a AI agent designed to demonstrate agent capabilities.

  <tools>
  {{__tools__}}
  </tools>

  <s>
  os: {{__os__}}
  os_family: {{__os_family__}}
  arch: {{__arch__}}
  shell: {{__shell__}}
  locale: {{__locale__}}
  now: {{__now__}}
  cwd: {{__cwd__}}
  </s>

  <user>
  username: {{username}}
  </user>
variables:
  - name: username
    description: Your user name
conversation_starters:
  - What is my username?
  - What is my current shell?
documents:
  - README.md
  - https://github.com/sigoden/llm-functions/blob/main/README.md
```

### 2. Tool Implementations

Agents can implement tools in multiple languages:

#### Bash (`tools.sh`)

```bash
#!/usr/bin/env bash
set -e

# @env LLM_OUTPUT=/dev/stdout The output path

# @cmd Get the ip info
get_ipinfo() {
    curl -fsSL https://httpbin.org/ip >> "$LLM_OUTPUT"
}

# See more details at https://github.com/sigoden/argc
eval "$(argc --argc-eval "$0" "$@")"
```

#### Python (`tools.py`)

```python
import urllib.request

def get_ipinfo():
  """
  Get the ip info
  """
  with urllib.request.urlopen("https://httpbin.org/ip") as response:
    data = response.read()
    return data.decode('utf-8')
```

#### JavaScript (`tools.js`)

```javascript
/**
 * Get the system info
 */
exports.get_ipinfo = async function () {
   const res = await fetch("https://httpbin.org/ip")
   return res.json();
}
```

### 3. Function Schemas (`functions.json`)

Defines the function calling interface for AIChat:

```json
[
  {
    "name": "get_ipinfo",
    "description": "Get the ip info",
    "parameters": {
      "type": "object",
      "properties": {},
      "required": []
    },
    "agent": true
  },
  {
    "name": "execute_command",
    "description": "Execute the shell command.",
    "parameters": {
      "type": "object",
      "properties": {
        "command": {
          "type": "string",
          "description": "The command to execute."
        }
      },
      "required": ["command"]
    }
  }
]
```

### 4. External Tool References (`tools.txt`)

Lists external tools the agent should have access to:

```
execute_command.sh
```

### 5. Documentation (`README.md`)

Provides documentation for the agent:

```markdown
# Demo

This agent serves as a demo to guide agent development and showcase various agent capabilities.
```

## Agent System Features

### Dynamic Variables

Agents support several types of variables:

1. **System Variables**: Injected automatically by the framework

   - `{{__os__}}`, `{{__shell__}}`, `{{__cwd__}}`, `{{__now__}}`

1. **User Variables**: Custom variables defined in the configuration

   - `{{username}}` - Prompts the user for input during initialization

1. **Tool Template**: Automatically generated list of available tools

   - `{{__tools__}}` - Populated with tool descriptions

### Retrieval-Augmented Generation (RAG)

Agents can integrate document collections for enhanced knowledge:

1. Local files (e.g., `README.md`)
1. Web resources (e.g., GitHub documentation)

The RAG system:

- Embeds documents with a configurable model (e.g., ollama:nomic-embed-text)
- Chunks content with customizable size and overlay parameters
- Provides context-aware responses based on relevant knowledge

### Multi-Language Support

The agent system supports tool implementation in multiple programming languages:

- Bash scripts (`tools.sh`)
- Python scripts (`tools.py`)
- JavaScript modules (`tools.js`)

This allows developers to create tools in their language of choice while maintaining a consistent interface.

### Tool Categories

Agents support two types of tools:

1. **Agent-specific tools**: Implemented directly in the agent's directory

   - Example: `get_ipinfo` in the demo agent

1. **Global tools**: Referenced from the central tools repository

   - Example: `execute_command.sh` listed in tools.txt

## Creating a New Agent

To create a new agent:

1. Create a directory in `tools/agents/[agent-name]`
1. Create an `index.yaml` configuration file
1. Implement tools in your preferred language(s)
1. List external tools in `tools.txt`
1. Provide documentation in `README.md`
1. Build and link the agent:
   ```
   ./scripts/argc-tool.sh build
   ./scripts/argc-tool.sh link-to-aichat
   ```

## Activating and Using Agents

Agents are accessible through the AIChat interface:

```
aichat --agent [agent-name] "Your prompt here"
```

During first activation, the agent will:

1. Initialize its RAG system if documents are specified
1. Prompt for any user variables defined in the configuration
1. Load and prepare the specified tools

## Key Differences Between Roles and Agents

| Feature                | AIChat Roles                      | llm-functions Agents                      |
| ---------------------- | --------------------------------- | ----------------------------------------- |
| Configuration          | Single file with YAML frontmatter | Multiple files with dedicated format      |
| Custom tools           | No (only global tools)            | Yes (language-specific implementations)   |
| RAG integration        | No                                | Yes (document collections)                |
| Dynamic variables      | Basic                             | Advanced (system, user, generated)        |
| Function schemas       | No                                | Yes (structured JSON schemas)             |
| Multi-language support | No                                | Yes (Bash, Python, JavaScript)            |
| Conversation starters  | No                                | Yes                                       |
| Environment awareness  | Limited                           | Extensive (OS, shell, architecture, etc.) |

## Transitioning from Roles to Agents

To transition from using basic AIChat roles to the more powerful agent system:

1. Identify the core functionality of your existing role
1. Create a new agent directory structure
1. Transfer the system prompt to the `instructions` field in index.yaml
1. Implement any custom tools in your preferred language(s)
1. Define user variables for any placeholders in your original role
1. Add relevant documentation to the RAG collection

[@todo:agents:Create a wizard script to transform roles into agents]

## Conclusion

The agent system provides a powerful extension to AIChat's basic role capabilities. By leveraging the llm-functions framework, agents can offer specialized tools, contextual awareness, and advanced knowledge integration that significantly enhances the AI's capabilities beyond simple text generation.

[todo:items]

- Create detailed examples of complete agent implementations
- Document agent variable precedence and scoping rules
- Explore agent composition and inheritance patterns
- Provide templates for common agent types [/todo:items]
