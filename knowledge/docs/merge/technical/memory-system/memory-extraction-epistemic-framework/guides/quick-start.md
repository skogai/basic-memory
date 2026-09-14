---
title: quick-start
type: note
permalink: skogai/docs-merge-todo/technical/memory-system/memory-extraction-epistemic-framework/guides/quick-start
---

# Quick Start Guide

Get Claude Memory running in 5 minutes.

## Prerequisites

- [Claude CLI](https://claude.ai) installed and authenticated
- Node.js 18+
- Access to Claude Code conversation logs

## 1. Install

```bash
# Global install (recommended)
npm install -g claude-memory

# Or from source
git clone https://github.com/obra/claude-memory.git
cd claude-memory
npm install && npm run build
npm link
```

## 2. Verify Setup

```bash
# Check Claude CLI works
claude --version

# Check system info
claude-memory info

# Check your conversation logs exist
ls ~/.claude/projects/*.jsonl | head -5
```

## 3. Extract Your First Memories

```bash
# Extract from last week
claude-memory extract --since="2025-09-21T00:00:00"

# Or just extract from a few recent conversations
claude-memory extract --since="2025-09-27T00:00:00"
```

You'll see output like:

```
🚀 Starting memory extraction...
📂 Processing session 1: abc123...
   📄 Agent created 1 memory files
✓
📊 Extraction complete: 1 sessions, 1 insights
```

## 4. Review What Was Extracted

```bash
# List extracted memories
ls ~/.claude/memories/extracted/

# View a memory file
cat ~/.claude/memories/extracted/*.md | head -50
```

## 5. Understanding the Output

Each memory file contains:

```markdown
---
confidence: 4.5
trigger: "when debugging fails in one context but works in another"
tags: ["methodology", "debugging", "root-cause-analysis"]
---

# Gather Evidence Before Implementing Fixes

When something works after reload but not real-time, compare actual
data structures in both paths before attempting fixes.

## Root Cause Analysis
[5-level why analysis]

## Psychological Driver
[Hidden motivations and fears]

## Prevention Strategy
[Concrete gate function to avoid this]
```

## 6. What's Next?

- **Review quality**: Read through a few extracted memories - do they make sense?
- **Extract more**: Run on larger date ranges to build your memory base
- **Customize**: Modify `agents/multi-dimensional-extractor.md` for your needs
- **Research**: Read `docs/research/research-summary.md` to understand the system

## Common Issues

**"Command failed: claude"**

- Ensure Claude CLI is installed: `brew install claude` or similar
- Authenticate: `claude auth login`

**"No sessions found"**

- Check your projects directory: `ls ~/.claude/projects/`
- Adjust date range: older conversations might be before your `--since` date

**"Agent extraction error"**

- Large conversations sometimes timeout
- Try extracting smaller date ranges
- Check `/tmp/extraction-log.txt` for details

**Low quality extractions**

- The system works best on conversations with corrections, debugging, or learnable moments
- Pure Q&A conversations may not extract meaningful lessons

## Next Steps

1. **[Read the research](../research/research-summary.md)** to understand how this was built
1. **[Understand the architecture](../guides/initial-design.md)**
1. **[Contribute improvements](../../README.md#contributing)**

______________________________________________________________________

The system is designed to learn from your working relationship with Claude. The more conversations you extract from, the better it captures your preferences and working style.
