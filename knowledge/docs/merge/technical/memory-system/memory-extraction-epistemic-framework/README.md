---
title: README
type: note
permalink: skogai/docs-merge-todo/technical/memory-system/memory-extraction-epistemic-framework/readme
---

# Claude Introspection Documentation

Complete documentation for the multi-dimensional memory extraction system.

## Getting Started

- **[Quick Start Guide](guides/quick-start.md)** - Get running in 5 minutes
- **[Initial Design](guides/initial-design.md)** - Original system design and goals
- **[Implementation Plans](guides/plans/)** - Development roadmap and implementation steps

## Research & Validation

- **[Research Summary](research/research-summary.md)** - Complete overview of all experiments and findings
- **[Ground Truth Validation](research/ground-truth-validation.md)** - Human validation results (85% match)
- **[Agent Prompting Research](research/agent-prompting-research.md)** - Comparison of 15 extraction techniques

## Experiments

- **[Experiment Results](experiments/)** - Raw experimental data and analysis
- **[Experiment 3 Analysis](experiments/experiment3-results/analysis.md)** - Ambiguous case handling

## System Architecture

### Core Components

1. **[SessionParser](../src/extraction/parser.ts)** - Reads JSONL conversation files
1. **[SessionChunker](../src/extraction/chunker.ts)** - Breaks conversations into manageable pieces
1. **[AgentExtractor](../src/extraction/agent-extractor.ts)** - Uses Claude CLI for extraction
1. **[Multi-dimensional Agent](../agents/multi-dimensional-extractor.md)** - Production extraction prompt

### Memory Format

Extracted memories are markdown files with YAML frontmatter:

```yaml
---
id: "mem-[timestamp]-[session-id]-[index]"
created: "[session-timestamp]"
confidence: [1.0-5.0]
certainty_reasoning: "[why this confidence level]"
trigger: "[when this applies]"
tags: ["project:[name]", "type:[pattern|rule|failure|discovery]"]
source:
  session: "[session-id]"
---
```

## Research Findings

### Key Discoveries

1. **Multi-dimensional analysis superior to single techniques**

   - Five Whys (root cause) + Hidden Motivation (psychology) + Systems Thinking (prevention)
   - 85% match to human ground truth vs 60-70% for single techniques

1. **Methodology lessons more valuable than technical fixes**

   - Extract HOW we solved problems, not WHAT the solution was
   - "Root cause analysis finds bugs" > "The hasResult check was wrong"

1. **Epistemic humility crucial for ambiguous cases**

   - Agents show dangerous overconfidence (100% convergence) on ambiguous cases
   - Need explicit uncertainty acknowledgment and confidence scoring

1. **Human calibration essential for quality**

   - Ground truth validation revealed gaps invisible in automated testing
   - Iterative correction cycles improve abstraction level

### Experimental Timeline

- **September 26**: Initial design and single-technique extraction
- **September 27**: 15-technique comparison (Experiment 1)
- **September 27**: Ambiguous case testing (Experiment 3) - revealed overconfidence
- **September 28**: Ground truth validation and methodology detection
- **September 28**: Production deployment

## Production System

### Current Status: ✅ Ready for Production

- **Quality**: 85% match to human ground truth
- **Confidence calibration**: Appropriate uncertainty on ambiguous cases
- **Methodology detection**: Distinguishes process lessons from technical fixes
- **Epistemic humility**: Acknowledges uncertainty appropriately

### Known Limitations

1. **Claude CLI dependency** - Requires authenticated Claude CLI
1. **Processing time** - 1-2 minutes per conversation
1. **Token costs** - $0.50-2.00 per conversation
1. **Manual review** - Some extractions may need human validation
1. **No search interface** - Memories are files, no semantic search yet

### Next Phase

- Consensus flagging (>90% agreement triggers review)
- Null hypothesis agent for "nothing went wrong" cases
- Automated comparison to human extractions
- Simple search interface over extracted memories

## File Organization

```
docs/
├── README.md                    # This index
├── guides/
│   ├── quick-start.md           # 5-minute setup guide
│   ├── initial-design.md        # Original design document
│   └── plans/                   # Implementation roadmap
├── research/
│   ├── research-summary.md      # Complete experimental overview
│   ├── ground-truth-validation.md  # Human validation results
│   └── agent-prompting-research.md # 15-technique comparison
└── experiments/
    ├── analysis.md              # Experimental setup and results
    └── experiment3-results/     # Ambiguous case handling
```

## Contributing

1. **Improve extraction quality**: Modify `agents/multi-dimensional-extractor.md`
1. **Add validation data**: Create more ground truth examples
1. **Build search**: Implement semantic search over memories
1. **Add tests**: Create test suite for extraction pipeline

## Research Citations

This work builds on established techniques in:

- **Root Cause Analysis**: Five Whys methodology
- **Cognitive Science**: Hidden motivation and psychological drivers
- **Systems Thinking**: Feedback loops and prevention mechanisms
- **Epistemic Humility**: Confidence calibration and uncertainty acknowledgment

## License

MIT - See [LICENSE](../LICENSE) for details.

______________________________________________________________________

**Last Updated**: September 28, 2025 **Version**: 1.0 (Production Ready) **Contributors**: Claude (Anthropic) & Jesse
