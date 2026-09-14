---
title: Agent RAG Integration
description: Guide for implementing Retrieval-Augmented Generation with SkogAI agents
category: interfaces
subcategory: aichat
tags:
  - agent
  - aichat
  - rag
  - knowledge
  - document
version: 0.1.0
status: draft
created: '2024-07-01'
updated: '2024-07-01'
permalink: skogai/todo/interfaces/aichat/agents/rag-integration
---

# Agent RAG Integration

[prompt:intro] This document explains how Retrieval-Augmented Generation (RAG) is integrated with agents in the SkogAI system. RAG allows agents to access and utilize knowledge from documents, making them more knowledgeable and contextually aware. [/prompt:intro]

## Understanding RAG in Agents

Retrieval-Augmented Generation (RAG) enhances agents by providing them with:

1. **Contextual knowledge**: Information from documentation, guides, and references
1. **Domain expertise**: Specific knowledge relevant to the agent's purpose
1. **Up-to-date information**: Content that can be regularly updated

## How RAG Integration Works

The agent system integrates RAG through the following process:

1. **Document specification**: Documents are listed in the agent's `index.yaml`
1. **Initialization**: When first run, AIChat prompts to initialize RAG
1. **Embedding creation**: Documents are chunked and embedded
1. **Storage**: Embeddings are saved to the agent's configuration directory
1. **Retrieval**: During conversations, relevant document chunks are retrieved
1. **Context injection**: Retrieved content is added to the agent's context

## Configuring RAG for an Agent

### Document Sources

In the agent's `index.yaml`, specify documents in the `documents` section:

```yaml
documents:
  - README.md                                               # Local file in agent directory
  - /mnt/extra/skogai/docs/interfaces/aichat/agents.md      # Absolute path
  - ./relative/path/to/document.md                          # Relative path
  - https://github.com/sigoden/llm-functions/blob/main/README.md  # Web URL
```

### RAG Initialization

When running an agent with documents for the first time, AIChat will prompt:

```
> The agent has the documents, init RAG? Yes
⚙ Initializing RAG...
Select embedding model: ollama:nomic-embed-text
Set chunk size: 1000
Set chunk overlay: 50
Load document1.md [1/3]
Load document2.md [2/3]
Load https://example.com/doc.html [3/3]
✓ Saved RAG to '/home/user/.config/aichat/agents/agent-name/rag.yaml'.
```

Available embedding models typically include:

- `ollama:nomic-embed-text` (recommended for local use)
- `openai:text-embedding-3-small` (if using OpenAI services)
- `local:all-MiniLM-L6-v2` (using SentenceTransformers locally)

### RAG Configuration Storage

The RAG configuration and embeddings are stored in:

```
$HOME/.config/aichat/agents/[agent-name]/rag.yaml
```

This file contains the embedding model configuration, chunk settings, and the embedded document vectors.

## Advanced RAG Customization

### Chunking Strategy

During initialization, you can set:

- **Chunk size**: The number of tokens per chunk (typically 500-1500)
- **Chunk overlay**: The number of overlapping tokens between chunks (typically 10-20% of chunk size)

Smaller chunks provide more precise retrieval but may miss context, while larger chunks include more context but may retrieve less relevant information.

### Document Types

The RAG system supports various document types:

| Type         | Example                                       | Notes                             |
| ------------ | --------------------------------------------- | --------------------------------- |
| Markdown     | `document.md`                                 | Best for structured documentation |
| Plain text   | `notes.txt`                                   | Simple text content               |
| Web pages    | `https://example.com`                         | HTML will be cleaned and parsed   |
| GitHub files | `https://github.com/user/repo/blob/main/file` | Automatically processed           |

### Refresh Strategy

To update the RAG knowledge base:

1. Delete the existing RAG configuration:

   ```bash
   rm $HOME/.config/aichat/agents/[agent-name]/rag.yaml
   ```

1. Run the agent again, which will prompt for reinitialization:

   ```bash
   aichat --agent [agent-name] "Hello"
   ```

## Creating Knowledge-Rich Agents

### Document Organization

When designing documents for RAG:

1. **Organize hierarchically**: Start with overviews, then specific details
1. **Include clear headings**: H1, H2, H3 help with context retrieval
1. **Use descriptive file names**: Names that reflect content aid understanding
1. **Maintain consistent formatting**: Regular structure improves parsing
1. **Include examples**: Practical examples help the agent understand application

### Example: Tool Documentation

A well-structured tool documentation file might include:

````markdown
# Tool Name

## Overview
Brief description of the tool's purpose and primary use cases.

## Usage
```bash
tool_name [options] <arguments>
````

## Parameters

| Parameter | Description           | Required | Default       |
| --------- | --------------------- | -------- | ------------- |
| arg1      | Description of arg1   | Yes      | -             |
| --option  | Description of option | No       | default_value |

## Examples

### Basic Usage

```bash
tool_name arg1
```

Result: expected output

### Advanced Usage

```bash
tool_name arg1 --option value
```

Result: expected output

## Notes and Limitations

Important considerations when using this tool.

````

### Document Collections

For comprehensive knowledge, consider organizing documents in collections:

1. **Core concepts**: Fundamental principles and architecture
2. **User guides**: How-to instructions and workflows
3. **Reference material**: Detailed specifications and parameters
4. **Examples**: Practical usage scenarios
5. **Troubleshooting**: Common issues and solutions

## Implementing RAG-Aware Tools

Agents can include tools that actively use or manage the RAG system:

### Document Search Tool Example

```bash
#!/usr/bin/env bash
set -e

# @env LLM_OUTPUT=/dev/stdout The output path
# @env AGENT_DIR=$HOME/.config/aichat/agents/current The agent directory

# @cmd Search the knowledge base for specific information
# @arg query! The search query
search_documents() {
    local query="$1"
    local rag_file="${AGENT_DIR}/rag.yaml"
    
    if [[ ! -f "$rag_file" ]]; then
        echo "RAG system not initialized. No documents to search." >> "$LLM_OUTPUT"
        return 1
    fi
    
    # This is a simplified example - actual implementation would use
    # vector similarity search against the embeddings in rag.yaml
    grep -n -A 2 -B 2 --color=always "$query" $(yq '.documents[].path' "$rag_file") >> "$LLM_OUTPUT"
}

# See more details at https://github.com/sigoden/argc
eval "$(argc --argc-eval "$0" "$@")"
````

### Knowledge Management Tool Example

```python
import os
import yaml
import subprocess

def refresh_knowledge():
  """
  Refresh the agent's knowledge base by reinitializing RAG
  """
  agent_dir = os.environ.get("AGENT_DIR", os.path.expanduser("~/.config/aichat/agents/current"))
  rag_file = os.path.join(agent_dir, "rag.yaml")
  
  if os.path.exists(rag_file):
    os.remove(rag_file)
    return "RAG configuration removed. On next conversation, the agent will prompt to reinitialize RAG with fresh document content."
  else:
    return "No RAG configuration found. The agent will prompt to initialize RAG on the next conversation."

def list_documents():
  """
  List all documents in the agent's knowledge base
  """
  agent_dir = os.environ.get("AGENT_DIR", os.path.expanduser("~/.config/aichat/agents/current"))
  rag_file = os.path.join(agent_dir, "rag.yaml")
  
  if not os.path.exists(rag_file):
    return "RAG system not initialized. No documents to list."
  
  with open(rag_file, 'r') as f:
    config = yaml.safe_load(f)
  
  result = "Documents in knowledge base:\n\n"
  for i, doc in enumerate(config.get('documents', [])):
    result += f"{i+1}. {doc.get('path', 'Unknown')}\n"
  
  return result
```

## Troubleshooting RAG Integration

### Common Issues

1. **Initialization failure**:

   - Check that document paths are correct
   - Verify internet connection for web URLs
   - Ensure embedding model is available

1. **Poor retrieval quality**:

   - Adjust chunk size and overlay
   - Check document formatting
   - Consider adding more context to documents

1. **Missing information**:

   - Check if document was properly loaded during initialization
   - Verify document content is relevant to queries
   - Consider adding more specific documentation

### Debugging RAG Issues

To debug RAG-related issues:

1. **Examine the RAG configuration**:

   ```bash
   cat $HOME/.config/aichat/agents/[agent-name]/rag.yaml
   ```

1. **Reinitialize with different parameters**:

   ```bash
   rm $HOME/.config/aichat/agents/[agent-name]/rag.yaml
   aichat --agent [agent-name] --debug "Hello"
   ```

1. **Check document loading**: When reinitializing, observe if all documents load successfully.

## Best Practices

1. **Curate documents carefully**: Include only relevant, high-quality content
1. **Update regularly**: Refresh RAG when documentation changes
1. **Balance comprehensiveness and focus**: Too much irrelevant information dilutes effectiveness
1. **Test with representative queries**: Verify that important information is retrievable
1. **Combine with agent tools**: Create tools that complement the knowledge base
1. **Structure documents logically**: Organize content with clear sections and headings

[todo:items]

- Create a tool for visualizing RAG retrieval relevance
- Implement document versioning for tracking changes
- Develop automated testing for RAG effectiveness
- Add support for structured data sources (JSON, YAML, tables) [/todo:items]
