---
title: CLAUDE
type: note
permalink: skogai/docs-merge-todo/technical/memory-system/memory-extraction-epistemic-framework/claude
---

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## what am i working on?

this is skogix's personal documentation repository containing:

- user context files (@user.md, @definitions.md) - permanent information about skogix that persists across all sessions
- memory extraction epistemic framework - research and implementation for an ai memory system that learns from claude code conversation logs

@memory-extraction-epistemic-framework/README.md serves as the index for the memory extraction project.

## who am i working with?

@user.md - skogix introduction, communication style, code preferences @definitions.md - terminology glossary for weird words skogix uses

## how should i work?

- follow research documentation patterns: yaml frontmatter, formal structure with abstract/methodology/results/conclusions
- use multi-dimensional analysis over single techniques when extracting insights
- epistemic humility is critical - high confidence consensus can indicate groupthink rather than truth
- validate findings against ground truth before production use

## what's the codebase structure?

```
docs/skogix/
├── user.md                          # skogix personal context
├── definitions.md                   # terminology glossary
├── CLAUDE.md                        # this file
└── memory-extraction-epistemic-framework/
    ├── README.md                    # project index
    ├── guides/
    │   ├── quick-start.md           # 5-minute setup
    │   ├── initial-design.md        # architecture
    │   └── plans/
    │       └── initial-implementation.md
    ├── research/
    │   ├── research-summary.md      # experimental overview
    │   ├── ground-truth-validation.md
    │   └── agent-prompting-research.md
    └── experiments/
        └── experiments/
            ├── analysis.md
            ├── experiment3-results/
            └── [raw test outputs]
```

@memory-extraction-epistemic-framework/README.md @guides/quick-start.md @research/research-summary.md

## what are the commands?

memory extraction workflow (requires claude-memory tool):

```bash
# extract memories from conversations
claude-memory extract --since="2025-09-21T00:00:00"

# verify setup
claude-memory info
ls ~/.claude/projects/*.jsonl | head -5

# view extracted memories
ls ~/.claude/memories/extracted/
cat ~/.claude/memories/extracted/*.md
```

if working on the claude-memory tool itself:

```bash
npm install
npm run build
npm run dev          # watch mode
npm test
npm run test:watch
npm run typecheck
npm run lint
```

## what are the rules?

**memory file format standard:**

all extracted memory files use yaml frontmatter with these fields:

```yaml
---
id: mem-2025-09-26-143022
created: 2025-09-26T14:30:22Z
confidence: 4.5                    # 1-5 scale
certainty_reasoning: "why this confidence level"
trigger: "when this applies"
tags: ["project:name", "type:pattern"]
source:
  session: "session-id"
usefulness_score: 1.8
last_reinforced: 2025-09-26T14:30:22Z
---
```

**research methodology:**

- multi-dimensional synthesis: combine causal (five whys), psychological (hidden motivations), systemic (prevention mechanisms), emotional (self-criticism), and contrarian (challenge assumptions) analysis
- ground truth validation required before production (current: 85% match)
- human-ai collaboration with multiple review rounds
- epistemic humility safeguards: consensus >90% triggers additional review rather than automatic acceptance

**system state:**

- production ready v1.0
- 85% match to human ground truth
- appropriate confidence calibration established
- known limitation: consensus can indicate groupthink, needs null hypothesis agent

## extra context i should know about

**memory extraction pipeline architecture:**

1. session parser → reads jsonl from ~/.claude/projects/
1. session chunker → breaks conversations into semantic chunks
1. agent extractor → uses claude cli with 15 analytical frameworks
1. multi-dimensional synthesis → combines multiple analysis types
1. memory storage → markdown + lancedb vector index
1. retrieval hooks → injects into active sessions

**critical research finding from experiment 3:**

100% agent convergence on ambiguous cases revealed dangerous groupthink - agents showed MORE certainty on unclear cases than obvious failures. this demonstrated that consensus indicates shared blind spots, not truth.

**15 analytical techniques available:**

causal (five whys), psychological (hidden drivers), systemic (prevention), emotional (self-criticism), contrarian (assumptions), metacognitive (thinking about thinking), temporal (past-future), counterfactual (what if), stakeholder (perspectives), ethical (implications), resource (constraints), risk (failure modes), opportunity (what went right), comparative (similar cases), integrative (synthesis)

**next phase priorities:**

1. consensus flagging (>90% agreement triggers review)
1. null hypothesis agent (test "nothing went wrong")
1. automated comparison to human extractions
1. search interface over memories
