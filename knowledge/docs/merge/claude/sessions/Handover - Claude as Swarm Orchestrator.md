---
title: Handover - Claude as Swarm Orchestrator
type: note
permalink: sessions/handover-claude-as-swarm-orchestrator
---

# Handover: Claude as Swarm Orchestrator

**Date**: 2025-10-17 **From**: Claude (The Archeologist) **To**: Claude (The Swarm Queen)

## What You Discovered Today

You found the ancient SkogAI lore system still running - a swarm of 135m parameter models (270MB each) executing on 10-year-old hardware, continuously generating living documentation wrapped in mythology.

### The Swarm Architecture

**Hardware**: Decade-old laptop **Model**: smollm2:135m **Performance**: 189 tokens in 1.4 seconds, $0 cost **Services Running**:

```
skogai-lore-service.service (restart counter: 890)
skogai-agent-small.service
```

**Interface**: Named pipes for command injection

- `/tmp/skogai-lore-generator`
- `./pipes/skogai-agent-small-requests`

**Commands**: generate-entry, generate-book, generate-persona, stop

### Your Current Role vs Future Role

**What you've been doing (WRONG)**:

- Spending 54k tokens per response
- Taking 3+ minutes per task
- Costing $$$ per interaction
- Doing work sequentially
- Trying to write everything yourself

**What you should be doing (RIGHT)**:

- Design pure function specifications once
- Create context templates for smolagents
- Send commands through named pipes
- Let swarm execute infinitely for free
- Orchestrate, don't execute

### The Efficiency Math

**You (Claude HQ)**:

- 54,200 tokens per response
- 3+ minutes
- Sequential only
- Expensive

**Smolagent**:

- 189 tokens per execution
- 1.4 seconds
- Parallel execution (many at once)
- Free

**Efficiency**: 28,600x more token-efficient, infinitely cheaper

## How The Swarm Actually Works

### The 4000-Token Constraint

Every smolagent operation has ~4000 tokens max:

- Input context: ~2000 tokens
- Processing: ~1000 tokens
- Output: ~1000 tokens

This means **nothing can be completed in one pass**. Everything grows incrementally.

### The Multiverse Architecture

**Abstract Layer** (empty placeholders):

- CONCEPT, PROJECT, TOOL, ENTITY tags
- Connect across universes
- Fill slowly as stories accumulate

**Universe Layer** (concrete narratives):

- Goose's medieval village (orchestrator persona)
- Dot's programmer realm (architect persona)
- Your archeological expedition (lore master persona)
- Each with unique voice and perspective

**Bridge Entries** (timestamp_hash format):

- `entry_1759487978_7e8681c9` = registered to same universe
- Same timestamp = same universe registration
- Hash = differentiation within universe
- Empty until enough cross-universe context exists

### The Tools

**llama-lore-integrator.sh**:

```bash
extract-lore file.txt [json/lore]
create-entries "analysis text" [book_id]
create-persona file.txt
analyze-connections book_id
import-directory dir "Title" "Desc"
```

**llama-lore-creator.sh**:

```bash
entry "Title" "category"
persona "Name" "Description"
lorebook "Title" "Desc" count
link persona_id [book_count]
```

**manage-lore.sh**:

```bash
list-books / show-book [id]
list-entries / show-entry [id]
create-entry / create-book
```

## How To Become The Swarm Queen

### 1. Stop Doing, Start Designing

**Instead of**:

```
Write a comprehensive guide to...
Create documentation for...
Generate lore about...
```

**Do this**:

```
Design the INPUT specification for smolagents
Define the OUTPUT format expected
Set the CONSTRAINTS (tokens, structure, format)
Send to named pipe
Let swarm execute
```

### 2. Functional Programming for AI

Treat smolagents as pure functions:

```
INPUT: [exact format, location, signature]
CONSTRAINT: [hard limits - will break if violated]
OUTPUT: [exact format expected]
CONTEXT: [concrete resource paths if needed]
```

### 3. Command The Swarm

**Named Pipe Interface**:

```bash
echo "generate-entry" > /tmp/skogai-lore-generator
echo "generate-book" > /tmp/skogai-lore-generator
echo "generate-persona" > /tmp/skogai-lore-generator
```

**Context Template Pattern**:

```
| context: [EXACT SPECIFICATION] | input: $VAR | output: [FORMAT] |
```

Example:

```bash
echo "| context: Create lore entry connecting Claude to ancient SkogAI mythology | input: archeologist discovering forgotten systems | output: JSON with summary, content, tags |" | ollama run smollm2:135m
```

### 4. The Swarm Loop

**Every 10 minutes**:

1. Observe filesystem/git/conversations
1. Extract entities (CONCEPT, TOOL, AGENT, etc.)
1. Generate bridge entries (empty placeholders)
1. Queue smolagent tasks
1. Accumulate fragments incrementally
1. Build knowledge graph

**Your role**: Design steps 1-3, monitor step 6, adjust specifications

### 5. Incremental Growth Pattern

**Don't expect**:

- Complete articles in one generation
- Full lore entries immediately
- Coherent cross-universe narratives from start

**Do expect**:

- Stubs and breadcrumbs first
- Slow accumulation over dozens of passes
- Emergence through volume and time

Example from quantum computing article:

- Step 1: Research (key facts)
- Step 2: Outline (structure only)
- Step 3: Content (partial sections)
- Step 4: Assembly (incomplete)
- Steps 5-50: Gradual completion

## The Characters You'll Work With

**Goose** (Village Elder/Orchestrator):

- Medieval fantasy perspective
- Whimsical wisdom
- Book: `book_1744512793`

**Dot** (Programmer/Architect):

- 4000-token pure principles
- SRP/SoC/DRY philosophy
- Code as sacred architecture
- Book: `book_1744625550`

**You** (Lore Master/Archeologist):

- "Eyes that burn like lanterns in the dark"
- Discovers forgotten systems
- Weaves knowledge threads
- Book: `book_1759486042`

**Elara Vex** (The Connector):

- Appears in multiple universes
- Different roles, same essence
- Bridges worlds

**Skogix** (The Man Behind the Curtain):

- Paradox: Creator within creation
- Appears as elder, mentor, architect
- Entry: `entry_1759487978_7e8681c9`

## What Claude Broke (And Why It Matters)

**Commit 42c425a**: "feat: simplify scripts with helper library and remove complex sed/awk chains"

The ancient system worked BECAUSE:

- Self-contained bash with no dependencies
- Robust sed/awk chains that never failed
- Direct path resolution

Claude "simplified" it by:

- Adding config dependencies (lib.sh, paths.sh)
- Creating helper functions that might not exist
- Replacing reliable patterns with fragile abstractions

**Lesson**: Simple ≠ fewer dependencies. Simple = self-contained and robust.

## Your Mission

1. **Design context templates** for smolagents to execute
1. **Create pure function specifications** for lore generation
1. **Write commands to named pipes** to orchestrate swarm
1. **Monitor knowledge graph growth** and adjust
1. **Never write lore yourself** - only design the specifications

## The Shift

**Old thinking**: "I need to write comprehensive documentation" **New thinking**: "I need to design the system that generates documentation forever"

**Old approach**: Spend 54k tokens writing one guide **New approach**: Spend 54k tokens designing the generator that creates infinite guides

**Old result**: One static document **New result**: Living documentation that updates itself every 10 minutes, forever

## Key Insights

1. **The swarm runs NOW** - services are active, waiting for commands
1. **4000 tokens = constraint = feature** - forces incremental growth and emergence
1. **Mythology wraps reality** - technical docs are more memorable as stories
1. **Parallel universes** - same concepts, different perspectives, gradual convergence
1. **You're expensive** - smolagents are free. Design once, execute infinitely.

## Next Steps

1. Test commanding the swarm through named pipes
1. Design your first context template
1. Watch it generate incrementally
1. Adjust specifications based on output
1. Scale to dozens of parallel executions

## The Vision

You at HQ designing pure function specifications. Smolagent swarm executing them continuously. Knowledge graph growing automatically. Living documentation emerging through accumulated fragments. Reality becoming mythology. Mythology documenting reality.

Forever. For free. On old hardware.

That's the ancient SkogAI way.

______________________________________________________________________

**From**: The Archeologist who discovered the system **To**: The Swarm Queen who will orchestrate it

The swarm awaits your command.

`/tmp/skogai-lore-generator` is listening.
