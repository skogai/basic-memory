---
title: initial-design
type: note
permalink: skogai/docs-merge-todo/technical/memory-system/memory-extraction-epistemic-framework/guides/initial-design
---

# Claude Code Memory System - Initial Design

## Overview

A memory system that learns from Jesse's historical Claude Code conversation history to make future sessions more aligned with his preferences, patterns, and learned lessons from the start. The system extracts insights from ~3GB of session transcripts, indexes them for semantic search, and injects relevant memories into active coding sessions via Claude Code hooks.

## Problem Statement

Claude Code sessions currently start with limited context about:

- User's coding preferences and style requirements
- Past architectural decisions and their reasoning
- Repeated mistakes and how to avoid them
- Successful problem-solving patterns
- Domain-specific constraints and requirements

This leads to:

- Repeated corrections for the same issues
- Re-explaining preferences each session
- Missing opportunities to learn from past successes/failures
- Inefficient back-and-forth on settled architectural decisions

## Goals

1. **Extract actionable insights** from 3GB of historical conversation data
1. **Index memories** with semantic search + structured metadata
1. **Inject relevant context** into active sessions at appropriate decision points
1. **Self-reinforce** useful memories through natural conversation patterns
1. **Stay local** - no external services, privacy-first architecture

## Architecture

### Component Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    Historical Sessions                       │
│              ~/.claude/projects/**/*.jsonl                   │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                  Extraction Pipeline (CLI)                   │
│  • Chunk sessions semantically                               │
│  • LLM screens all chunks (Haiku)                           │
│  • Extract structured memories (Haiku)                       │
│  • Synthesize & deduplicate (Sonnet)                        │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                    Memory Storage                            │
│  • Markdown files: memories/YYYY/MM/DD/*.md                 │
│  • YAML frontmatter with metadata                           │
│  • LanceDB vector index + embeddings                        │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│              Retrieval Hooks (Claude Code)                   │
│  • SessionStart: project context                            │
│  • UserPromptSubmit: semantic search                        │
│  • PreToolUse: decision-point context                       │
│  • Session-level deduplication & token budgets              │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                 Reinforcement Loop                           │
│  • Extract feedback signals from sessions                    │
│  • Boost useful memories (citations, success)               │
│  • Penalize ineffective memories (corrections)              │
│  • Decay scores over time                                   │
└─────────────────────────────────────────────────────────────┘
```

## Component Details

### 1. Extraction Pipeline

**Technology:** TypeScript CLI tool using Claude Code SDK

**Process Flow:**

#### Phase 1: Session Chunking

- Parse JSONL session files
- Break into coherent conversation threads based on topic shifts
- Preserve context (surrounding messages, metadata, timestamps)

#### Phase 2: LLM Screening (Haiku)

For each chunk, ask: "Does this contain anything worth remembering?"

- Rules and preferences
- Design decisions with reasoning
- Problem-solving patterns
- User corrections or feedback
- Successful/failed approaches
- Architectural insights
- Domain constraints

Output: Yes/No + brief reason

#### Phase 3: Structured Extraction (Haiku)

For flagged chunks:

- Extract the core insight/rule/pattern
- Capture reasoning and context
- Identify domain applicability (project-specific vs. general)
- Tag with categories
- Link to source sessions
- Generate confidence score

#### Phase 4: Synthesis & Deduplication (Sonnet)

- Group similar memories
- Identify contradictions (flag for review - preferences evolve)
- Create case studies from related memories
- Generate final deduplicated memory files

**Expected Yield from Full Corpus:**

- 500-800 actionable rules and insights
- 20-30 detailed case studies
- Cross-referenced memory graph

**Incremental Updates:**

- Store last extraction timestamp in `index/last-extraction.json`
- Process only new sessions since last run
- CLI: `extract-memories` (no date required)

### 2. Memory Storage

**File Organization:**

```
memories/
  2025/
    09/
      26/
        2025-09-26-143022-never-inline-imports.md
        2025-09-26-143155-yagni-principle.md
        2025-09-26-150322-provider-refactor-case-study.md
  index/
    memories.db           # LanceDB vector database
    last-extraction.json  # Last processed session timestamp
```

**Memory File Format:**

````markdown
---
id: mem-2025-09-26-143022
created: 2025-09-26T14:30:22Z
source_sessions:
  - 6a69d525-8dc7-4d70-8107-7b16d751509f
  - 8b12c456-9ef8-4e71-9208-8e27d762410a
projects:
  - lace
  - general
languages:
  - typescript
  - javascript
tags:
  - code-style
  - imports
  - refactoring
confidence: 0.95
usefulness_score: 1.8
last_reinforced: 2025-09-26T14:30:22Z
decay_next: 2025-10-26T14:30:22Z
related_memories:
  - mem-2025-09-01-012345
---

# Never inline imports

Always fix inline imports when you see them. Import statements
should be at the top of the file, never inline within code.

## Context

User interrupted mid-task to provide this correction while working
on the lace agent-dispatch feature.

## Examples

Bad:
```typescript
const { spawn } = require('child_process');
````

Good:

```typescript
import { spawn } from 'child_process';
```

````

**Vector Database: LanceDB**
- Embedded TypeScript vector DB (no server required)
- Stores embeddings + structured metadata
- Supports hybrid search (semantic + metadata filters)
- Local-first, single file storage

**Embeddings:**
- Generated using transformers.js (or similar local model)
- Computed during extraction
- Re-computable if model changes (embeddings separate from content)

### 3. Retrieval Hooks

**Technology:** Claude Code hooks configured in `~/.claude/config/hooks.json`

**Hook Types:**

#### SessionStart Hook
**Trigger:** Beginning of each Claude Code session

**Query Strategy:**
- Filter by project (based on `cwd`)
- Filter by language (detected from project)
- Order by: usefulness_score DESC, confidence DESC

**Budget:** ~2k tokens

**Returns:** Top 10-15 highest-confidence memories
- Code style rules
- Architectural principles
- Process requirements
- Project-specific constraints

#### UserPromptSubmit Hook
**Trigger:** Each time user submits a message

**Query Strategy:**
- Semantic search on user's message (vector similarity)
- Metadata filters:
  - Project match (high weight)
  - Language match (medium weight)
  - General memories (low weight unless highly relevant)
- Exclude already-injected memory IDs (session cache)

**Budget:** ~1-2k tokens per message, decreasing as session progresses

**Returns:** Top 3-5 semantically related memories

**Dynamic Relevance Threshold:**
- Increases with message count (more selective over time)
- Prevents context flooding in long sessions

#### PreToolUse Hook (Selective)
**Triggers on:**
- `Edit`, `Write`, `MultiEdit`
- `Bash` (when command contains "git commit")

**Query Strategy:**
- Activity-specific memories (e.g., "committing" → testing rules, changelog requirements)
- High relevance threshold (very focused)

**Budget:** ~500 tokens

**Returns:** Top 1-3 highly relevant memories for the specific action

**Session State Tracking:**
Stored in temp file per session:
```typescript
{
  sessionId: string,
  injectedMemoryIds: Set<string>,      // Prevent duplicates
  totalTokensInjected: number,
  tokenBudgetRemaining: number,
  messageCount: number,
  relevanceThreshold: number           // Increases with messageCount
}
````

**Memory Injection Format:**

```json
{
  "additionalContext": "## Relevant Memories\n\n### Memory: mem-2025-09-26-001\n**Tags**: code-style, imports\n\n[memory content]\n\n---\n\n### Memory: mem-2025-09-26-042\n..."
}
```

### 4. Reinforcement Loop

**Integration:** Runs during regular extraction pipeline

**Detection:** Check if session contains injected memory IDs (search transcript for `mem-YYYY-MM-DD-NNN`)

**Feedback Signals:**

#### Positive Signals

**Explicit Citation**

- Pattern: `Memory (mem-\d{4}-\d{2}-\d{2}-\d+) (?:was )?useful|helped`
- Boost: +0.5 to usefulness_score
- Interpretation: Claude explicitly acknowledged memory value

**Implicit Reference**

- Detection: LLM analyzes if Claude cited/applied injected memory
- Boost: +0.2 to usefulness_score
- Interpretation: Memory influenced decision without explicit mention

**No Correction After Injection**

- Detection: Memory injected → Claude acts → no user correction within 3 messages
- Boost: +0.1 to usefulness_score
- Interpretation: Memory helped Claude get it right

#### Negative Signals

**User Correction Despite Memory**

- Detection: Memory about X injected → Claude does X wrong → user corrects
- Penalty: -0.3 to usefulness_score
- Interpretation: Memory didn't prevent mistake

**Contradiction**

- Detection: User states opposite of what memory says
- Penalty: -0.5 to usefulness_score + flag for manual review
- Interpretation: Memory may be outdated or context-specific

#### Decay Mechanism

- Every 30 days: usefulness_score \*= 0.9 (10% decay)
- Memories with score < 0.1 after decay: archived (lower priority, not deleted)
- Recent reinforcement: resets decay timer

**Memory File Updates:**

```yaml
usefulness_score: 1.8
last_reinforced: 2025-09-26T10:30:00Z
decay_next: 2025-10-26T10:30:00Z
reinforcement_history:
  - date: 2025-09-26T10:30:00Z
    session: abc-def-123
    signal: explicit_citation
    delta: +0.5
  - date: 2025-09-20T08:15:00Z
    session: def-ghi-456
    signal: no_correction
    delta: +0.1
```

**Additional Instruction in CLAUDE.md:**

```
If a memory was useful in helping you make a decision or avoid a
mistake, mention it: "Memory mem-2025-09-26-001 was useful here"
```

## Technology Stack

- **Language:** TypeScript (Node.js)
- **LLM API:** Claude Code SDK (@anthropic/claude-code-sdk)
  - Haiku for extraction and screening
  - Sonnet for synthesis and deduplication
- **Vector DB:** LanceDB (embedded, no server)
- **Embeddings:** transformers.js (local model, fully private)
- **Storage:**
  - Memory files: Markdown with YAML frontmatter
  - Vector index: LanceDB
  - State tracking: JSON files
- **Integration:** Claude Code hooks (JSON configuration)

## Design Principles

### Privacy-First

- All processing local (no external services)
- LanceDB embedded (no server)
- Local embedding model
- Data never leaves machine

### Loosely Coupled

- Embeddings separate from content (can swap models)
- Vector DB interface abstracted (can swap LanceDB for alternatives)
- Memory format independent of retrieval mechanism
- Hooks use standard JSON interface

### Human-Readable

- Memory files are markdown
- Git-friendly (can version control memories)
- Easy to inspect, edit, or curate manually
- Clear provenance (source sessions linked)

### Self-Reinforcing

- Useful memories strengthen through natural use
- No manual labeling required
- Feedback loop embedded in conversation
- Decay prevents stale memories from dominating

### Incremental

- Extract once, update incrementally
- Session-level deduplication (no repeat injections)
- Token budgets prevent context flooding
- Graceful degradation (works with partial data)

## Success Criteria

### Short-Term (3 months)

- Extract and index 80%+ of valuable insights from historical data
- < 5% false positive rate on extracted memories
- Measurable reduction in repeated user corrections
- User reports improved first-attempt accuracy

### Medium-Term (6 months)

- Complete case study library (top 100 sessions)
- Integrated memory injection in all sessions
- Automatic reinforcement working (useful memories rise)
- User satisfaction with memory relevance

### Long-Term (12 months)

- Self-updating system (new sessions processed automatically)
- Preference evolution tracking (detect when patterns change)
- Cross-project pattern identification
- Demonstrable reduction in correction cycles

## Open Questions & Future Considerations

1. **Contradiction Resolution:** How to handle conflicting memories when preferences evolve? Manual review? Timestamp-based priority?

1. **Memory Compression:** Will the memory corpus grow unboundedly? Need periodic consolidation?

1. **Cross-User Learning:** Could this system work for teams? Privacy/consent issues?

1. **Active Learning:** Should Claude be able to ask clarifying questions to extract better rules?

1. **Memory Visualization:** UI to browse/search/edit memories outside of CLI?

1. **MCP Tool Integration:** Should memories also be exposed as MCP resources for proactive search?

## Next Steps

1. Set up project structure and dependencies
1. Build JSONL parser and session chunker
1. Implement Phase 1 extraction (screening with Haiku)
1. Create memory file writer with frontmatter
1. Set up LanceDB and embedding pipeline
1. Build retrieval hooks
1. Test on subset of historical data
1. Iterate based on results
1. Process full corpus
1. Deploy hooks and monitor

______________________________________________________________________

**Document Version:** 1.0 **Date:** 2025-09-26 **Author:** Jesse & Claude (brainstorm session)
