---
title: skogcli
type: note
permalink: skogai/todo/memory/skogcli
---

# SkogCLI

SkogCLI is a command-line interface for the SkogAI ecosystem, providing tools for agent management, configuration, memory/knowledge management, and script handling.

## Installation and Setup

SkogCLI is a Python package managed with UV. To set up and run:

```bash
# Navigate to the project directory
cd project/skogcli

# Sync dependencies with the project's requirements
uv sync

# Run the CLI
uv run skogcli
```

## Core Components

### 1. Agent Management

Agents are configurable AI entities that can receive messages and execute scripts.

```bash
# List configured agents
uv run skogcli agent list

# Creating a new agent
uv run skogcli agent create

# Send a message to an agent
uv run skogcli agent send <agent-name> "Your message here"
```

Agent capabilities include:

- Individual configuration settings
- Custom behavior scripts
- Message handling and response generation

### 2. Configuration System

SkogCLI uses a hierarchical configuration system with schema definitions.

```bash
# View current configuration
uv run skogcli config show

# List all configuration keys
uv run skogcli config list

# Get specific configuration value
uv run skogcli config get <key>

# Set configuration value
uv run skogcli config set <key> <value>
```

Configuration features:

- Schema system using `$` references for type definitions
- Backup and restore capabilities
- Default configurations that can be customized

### 3. Memory/Knowledge Management

SkogCLI integrates with "Basic Memory" (v0.12.3) to provide a graph-based knowledge system for agents.

```bash
# Check memory system status
uv run skogcli memory status

# List recent activity
uv run skogcli memory list

# Create a new memory entry
uv run skogcli memory create
```

The memory system tracks:

- Entities
- Relations
- Observations
- Project-specific knowledge bases

### 4. Script Management

Scripts define the behavior of agents and can be edited directly.

```bash
# Edit an agent's script
uv run skogcli agent edit-script <agent-name>

# Migrate scripts for all agents
uv run skogcli agent migrate-scripts
```

## Data Model

SkogCLI uses a structured data model with schema definitions:

- **Message**: Communication unit with ID, sender, recipient, content, etc.
- **Entity**: Identifiable object with ID and name
- **SkogChat**: Collection of messages

Schema references use `$` notation (e.g., `$.message.id` refers to `$int`).

## Projects and Storage

- Default project: "skogai"
- Memory storage: "/mnt/extra/skogai/docs/memory"
- Message storage: "/home/skogix/skogdata/skogchat"

## UI Configuration

- Default theme with optional verbose mode
- Chat history management with configurable limits

## Future Integration

The schema system appears designed to work with a parser ("skogparse") that would expand references to their full definitions.
