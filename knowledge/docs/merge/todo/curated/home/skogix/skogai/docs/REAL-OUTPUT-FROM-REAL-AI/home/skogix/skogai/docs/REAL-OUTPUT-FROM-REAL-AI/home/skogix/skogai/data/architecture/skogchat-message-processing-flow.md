---
title: skogchat-message-processing-flow
type: note
permalink: architecture/skogchat-message-processing-flow-2
---

# skogchat-message-processing-flow

## Summary

This document outlines the end-to-end flow of messages in the SkogChat system, from initial user input to agent responses. Understanding this flow is essential for debugging, extending, or modifying the messaging capabilities.

## Message Processing Sequence

### 1. User Message Input

- User enters message via `skogchat message send "test message"`
- Command handled by `send_message()` in `src/skogchat/commands/message.py`
- Message saved to configuration and file system

### 2. Session Management

- Session ID retrieved via `skogcli config get skogchat.session.id`
- Message ID incremented and stored
- Raw message directory structure created if needed: `./sessions/{session}/messages/raw/`
- Message saved to `{msg_dir}/{new_msg_id}.txt`

### 3. Background Processing

- `process-message.sh` launched as background process with session and message ID
- Creates necessary directories for session storage
- Loads raw message from file system
- Parses message with `skogparse` tool (if available)
- Stores parsed result in `parsed` directory

### 4. Agent Distribution

- Iterates through available agents (amy, goose, dot, skogai, claude)
- For each available agent:
  - Gets message command from config via `skogcli config get agent.$agent.message-command`
  - Executes command to get agent response
  - Saves response using `create-message-session.sh`

### 5. Response Storage

- Each agent response stored as JSON in `./sessions/{session}/logs/{message_id}.json`
- JSON includes: agent name, content, message ID, timestamp, session
- Combined history created as `history.json` in session's tmp directory

## Key Files

1. `src/skogchat/commands/message.py`

   - Handles initial message input
   - Creates directory structure
   - Launches background processing

1. `scripts/process-message.sh`

   - Processes message asynchronously
   - Distributes to agents
   - Handles message parsing

1. `scripts/create-message-session.sh`

   - Creates standardized message entries
   - Manages message IDs
   - Builds history files

## Configuration Keys

- `skogchat.session.id` - Current active session
- `skogchat.user-message.id` - Current message counter
- `skogchat.user-message.text` - Latest message text
- `agent.{name}.message-command` - Command to send message to specific agent

## File Structure

```
./sessions/{session}/
├── messages/
│   ├── raw/         # Original unprocessed messages
│   │   └── {id}.txt
│   └── parsed/      # Messages after skogparse processing
│       └── {id}.txt
├── logs/            # Message records in JSON format
│   └── {id}.json
└── tmp/             # Temporary processing files
    ├── history.json
    ├── message-id.txt
    └── user-message.json
```

## observations

- [fact] Message processing happens asynchronously via background script execution #processing #async
- [decision] Session management relies on skogcli configuration for state tracking #configuration #state
- [technique] Agent responses are retrieved via configurable message commands #flexibility #extensibility
- [requirement] Directory structures must exist before message processing begins #structure #prerequisites
- [fact] All messages are stored in JSON format with consistent fields #format #consistency

## relations

- part_of \[[skogchat-system-architecture]\] (core messaging component)
- implements \[[agent-communication-protocol]\] (defines how agents receive and respond to messages)
- relates_to \[[skogcli-configuration]\] (uses configuration for state management)
