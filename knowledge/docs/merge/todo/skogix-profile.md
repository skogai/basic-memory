---
permalink: skogix
---

# SkogAI Documentation Repository Structure

## Overview

This repository serves as the central documentation hub and discussion forum for the SkogAI ecosystem. It contains both finalized documentation and the discussions that led to decisions, providing context and rationale alongside specifications.

## Directory Structure

```
SkogAI/
├── README.md                  # Overview and navigation guide
├── CONTRIBUTING.md            # Guidelines for contributions
│
├── architecture/              # System architecture documentation
│   ├── README.md              # Architecture overview
│   ├── agent-tiers.md         # Agent tier definitions and capabilities
│   ├── multi-agent-system.md  # Multi-agent system design
│   ├── skogcli-integration.md # SkogCLI integration specs
│   └── discussions/           # Architecture discussions
│       └── YYYY-MM-DD-topic.md
│
├── standards/                 # System-wide standards
│   ├── README.md              # Standards overview
│   ├── legacy-compatibility.md # Legacy system compatibility guidelines
│   ├── documentation-format.md # Documentation format standards
│   ├── file-organization.md   # File/directory organization standards
│   └── discussions/           # Standards discussions
│       └── YYYY-MM-DD-topic.md
│
├── workflows/                 # Workflow documentation
│   ├── README.md              # Workflows overview
│   ├── pr-process.md          # Pull request workflows
│   ├── agent-communication.md # Inter-agent communication protocols
│   ├── development-cycle.md   # Development cycle guidelines
│   └── discussions/           # Workflow discussions
│       └── YYYY-MM-DD-topic.md
│
├── features/                  # Feature documentation
│   ├── README.md              # Features overview
│   ├── context-system/        # Context system documentation
│   │   ├── overview.md        # Context system overview
│   │   ├── implementation.md  # Implementation details
│   │   ├── usage.md           # Usage guidelines
│   │   └── discussions/       # Feature-specific discussions
│   │       └── YYYY-MM-DD-topic.md
│   ├── mcp-integration/       # MCP integration
│   └── shared-memory/         # Shared memory systems
│
├── integrations/              # Integration documentation
│   ├── README.md              # Integrations overview
│   ├── github-integration.md  # GitHub integration
│   ├── skogcli-integration.md # SkogCLI integration
│   └── discussions/           # Integration discussions
│       └── YYYY-MM-DD-topic.md
│
├── agents/                    # Agent-specific documentation
│   ├── README.md              # Agent documentation overview
│   ├── common/                # Documentation common to all agents
│   ├── claude/                # Claude-specific documentation
│   ├── goose/                 # Goose-specific documentation
│   └── dots/                  # Dots-specific documentation
│
└── proposals/                 # Enhancement proposals
    ├── README.md              # Proposal process documentation
    ├── template.md            # Proposal template
    ├── active/                # Active proposals
    │   └── YYYY-MM-DD-title.md
    ├── accepted/              # Accepted proposals
    └── rejected/              # Rejected proposals with reasoning
```

## Document Types

### Specification Documents

- Formal documentation of systems, features, and standards
- Written in clear, concise language
- Include capability markers (works with which agent types)
- Version controlled with change history

### Discussion Documents

- Preserved discussions related to specific topics
- Format: YYYY-MM-DD-topic.md
- Include participants and key points
- Link to resulting specification documents

### Proposal Documents

- Structured proposals for system enhancements
- Standard template with:
  - Problem statement
  - Proposed solution
  - Implementation details
  - Compatibility considerations
  - Discussion points

## Contribution Guidelines

1. **Discussion First**: Start with a discussion document before creating specifications
1. **Cross-Reference**: Link discussions to resulting specifications
1. **Capability Marking**: Tag documents with agent capability requirements
1. **PR Review**: All changes require review from at least one other agent
1. **Reasoning**: Include reasoning alongside decisions
1. **Plain Language**: Write in accessible language with clear structure

## Initial Focus Areas

1. Legacy compatibility standards (what must be preserved)
1. PR workflow process documentation
1. Context system integration documentation
1. MCP integration specifications

## observations

- [structure] Repository organized into functional areas with clear hierarchy #organization #documentation
- [principle] Discussion documents preserved alongside specifications for context and rationale #transparency #decision-tracking
- [requirement] All changes require review from at least one other agent #quality-control #collaboration
- [standard] Documents must include capability markers for agent compatibility #compatibility #agent-systems
- [process] Discussion-first approach ensures thorough consideration before implementation #methodology #planning

## relations

- documents \[[skogai-ecosystem]\] (provides comprehensive documentation structure)
- contains \[[agent-documentation]\] (includes agent-specific documentation sections)
- implements \[[documentation-standards]\] (follows structured approach to documentation)
- supports \[[multi-agent-collaboration]\] (enables coordinated documentation efforts)
- foundation_for \[[proposal-process]\] (establishes framework for enhancement proposals)
