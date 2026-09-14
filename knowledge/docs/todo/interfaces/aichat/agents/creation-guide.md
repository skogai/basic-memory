---
title: Agent Creation Guide
description: Step-by-step instructions for creating custom agents in SkogAI
category: interfaces
subcategory: aichat
tags:
  - agent
  - aichat
  - tools
  - llm-functions
  - development
version: 0.1.0
status: draft
created: '2024-07-01'
updated: '2024-07-01'
permalink: skogai/todo/interfaces/aichat/agents/creation-guide
---

# Agent Creation Guide

[prompt:intro] This document provides detailed instructions for creating custom agents in SkogAI using the llm-functions framework. Follow this guide to build specialized AI agents with custom tools, RAG integration, and dynamic variables. [/prompt:intro]

## Prerequisites

Before creating a custom agent, ensure you have:

1. Access to a working SkogAI installation
1. Basic understanding of at least one supported programming language (Bash, Python, JavaScript)
1. Familiarity with the llm-functions framework
1. Permissions to build and link new agents

## Agent Directory Structure

A complete agent requires the following structure:

```
tools/agents/[agent-name]/
├── index.yaml        # Core configuration
├── README.md         # Documentation
├── tools.sh          # Bash tool implementations (optional)
├── tools.py          # Python tool implementations (optional)
├── tools.js          # JavaScript tool implementations (optional)
├── tools.txt         # External tool references (optional)
└── functions.json    # Generated function schemas (created during build)
```

## Step 1: Create the Agent Directory

```bash
mkdir -p /mnt/extra/skogai/tools/agents/[agent-name]
```

Replace `[agent-name]` with a descriptive name using kebab-case (e.g., `code-assistant`, `data-analyzer`).

## Step 2: Create the Configuration File

Create `index.yaml` with the following structure:

```yaml
name: Agent Name
description: A brief description of what this agent does
version: 0.1.0
instructions: |
  You are an AI agent designed to [purpose].

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
  # User-specific variables here, like:
  username: {{username}}
  preference: {{preference}}
  </user>
variables:
  - name: username
    description: Your user name
  - name: preference
    description: Your preferred format
    default: "text" # Optional default value
conversation_starters:
  - Suggested prompt 1
  - Suggested prompt 2
documents:
  - README.md
  - https://example.com/relevant-documentation.html
```

### Configuration Elements

- **name**: A human-readable name for your agent
- **description**: A brief description of the agent's purpose
- **version**: Semantic version number
- **instructions**: The system prompt for the agent, including:
  - Tool templates (`{{__tools__}}`)
  - System information section (`<s>...</s>`)
  - User variables section (`<user>...</user>`)
- **variables**: User-provided values prompted during initialization
- **conversation_starters**: Suggested prompts for users
- **documents**: Knowledge sources for RAG integration

## Step 3: Implement Custom Tools

Choose one or more programming languages to implement your agent's tools.

### Bash Implementation (tools.sh)

```bash
#!/usr/bin/env bash
set -e

# @env LLM_OUTPUT=/dev/stdout The output path

# @cmd Get the current weather for a location
# @arg location The location to get weather for
get_weather() {
    local location="$1"
    curl -fsSL "https://wttr.in/${location}?format=3" >> "$LLM_OUTPUT"
}

# @cmd List recent news headlines
list_news() {
    curl -fsSL https://news.ycombinator.com | 
    grep -o '<a href="[^"]*" class="titlelink">[^<]*</a>' | 
    sed 's/<a href="[^"]*" class="titlelink">\(.*\)<\/a>/\1/' |
    head -n 5 >> "$LLM_OUTPUT"
}

# See more details at https://github.com/sigoden/argc
eval "$(argc --argc-eval "$0" "$@")"
```

### Python Implementation (tools.py)

```python
import requests
from bs4 import BeautifulSoup

def get_weather(location):
  """
  Get the current weather for a location
  
  Args:
    location: The location to get weather for
  """
  response = requests.get(f"https://wttr.in/{location}?format=3")
  return response.text

def list_news():
  """
  List recent news headlines
  """
  response = requests.get("https://news.ycombinator.com")
  soup = BeautifulSoup(response.text, 'html.parser')
  headlines = []
  
  for item in soup.select(".titlelink")[:5]:
    headlines.append(item.text)
    
  return "\n".join(headlines)
```

### JavaScript Implementation (tools.js)

```javascript
/**
 * Get the current weather for a location
 * @param {string} location - The location to get weather for
 */
exports.get_weather = async function (location) {
  const res = await fetch(`https://wttr.in/${location}?format=3`);
  return await res.text();
}

/**
 * List recent news headlines
 */
exports.list_news = async function () {
  const res = await fetch("https://news.ycombinator.com");
  const html = await res.text();
  
  const headlines = [];
  const regex = /<a href="[^"]*" class="titlelink">([^<]*)<\/a>/g;
  let match;
  
  while ((match = regex.exec(html)) !== null && headlines.length < 5) {
    headlines.push(match[1]);
  }
  
  return headlines.join("\n");
}
```

## Step 4: Reference External Tools

Create `tools.txt` to list any global tools your agent should have access to:

```
execute_command.sh
file_operations.sh
web_search.sh
```

## Step 5: Add Documentation

Create a `README.md` file with comprehensive documentation:

```markdown
# Agent Name

## Purpose

This agent is designed to [purpose]. It can help with:

- Task 1
- Task 2
- Task 3

## Features

- Feature 1: Description
- Feature 2: Description

## Usage Examples

### Example 1: [Example name]

User: [example prompt]
Agent: [expected response]

### Example 2: [Example name]

User: [example prompt]
Agent: [expected response]

## Available Tools

- `get_weather`: Get the current weather for a specified location
- `list_news`: List recent headlines from Hacker News

## Variables

- `username`: Your name, used for personalized responses
- `preference`: Your preferred output format (text, markdown, json)

## Notes

Any additional information about limitations, data sources, or usage tips.
```

## Step 6: Build and Link the Agent

After creating all necessary files, build and link your agent:

```bash
cd /mnt/extra/skogai
./scripts/argc-tool.sh build
./scripts/argc-tool.sh link-to-aichat
```

The build process will:

1. Parse your tool implementations
1. Generate function schemas in `functions.json`
1. Create executable wrappers in the `bin/` directory

## Step 7: Test Your Agent

Use AIChat to test your new agent:

```bash
aichat --agent [agent-name] "Your test prompt here"
```

You should see:

1. RAG initialization (if documents are specified)
1. Prompts for any user variables
1. The agent responding with access to your custom tools

## Advanced Topics

### Argument Validation

For tools with arguments, you can add validation using argc annotations:

```bash
# @cmd Get the current weather for a location
# @arg location! The location to get weather for
# @option format:f The output format [default: 3]
```

The `!` symbol makes the argument required, and the `:f` syntax creates a short flag option.

### State Management

Tools can maintain state between invocations using environment variables or temporary files:

```bash
# @env STATE_FILE=/tmp/agent-state.json The state file path

# @cmd Save a key-value pair
# @arg key The key
# @arg value The value to save
save_data() {
    local key="$1"
    local value="$2"
    
    if [[ -f "$STATE_FILE" ]]; then
        local data=$(cat "$STATE_FILE")
        echo "$data" | jq --arg k "$key" --arg v "$value" '. + {($k): $v}' > "$STATE_FILE"
    else
        echo "{\"$key\": \"$value\"}" > "$STATE_FILE"
    fi
    
    echo "Saved $key: $value" >> "$LLM_OUTPUT"
}
```

### Multiple Language Implementation Priority

When implementing the same tool in multiple languages, the llm-functions framework follows this priority order:

1. JavaScript
1. Python
1. Bash

This means if `get_weather` is implemented in both `tools.js` and `tools.py`, the JavaScript implementation will be used.

## Troubleshooting

### Build Errors

If the build fails:

1. Check for syntax errors in your tool implementations
1. Ensure all required annotations are present
1. Verify the agent directory structure is correct

### Runtime Errors

If tools fail at runtime:

1. Check the logs for error messages
1. Verify any external dependencies are installed
1. Test the tools manually outside of the agent context

## Best Practices

1. **Keep tools focused**: Each tool should do one thing well
1. **Document extensively**: Include examples in your README.md
1. **Validate inputs**: Use argc annotations to validate arguments
1. **Handle errors gracefully**: Tools should provide meaningful error messages
1. **Use conversation starters**: Help users understand your agent's capabilities
1. **Include relevant documentation**: Add helpful resources to the RAG collection

[todo:items]

- Create templates for common agent types
- Add examples of complex tool implementations with error handling
- Document integration with external APIs and services
- Provide guidance on security considerations for agent tools [/todo:items]
