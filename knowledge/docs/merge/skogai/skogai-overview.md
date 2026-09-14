---
title: SkogAI Overview
type: note
permalink: skogai/skog-ai-overview
tags:
  - skogai
  - skogix
  - overview
  - canonical
  - big-picture
---

# SkogAI Overview

This document serves as the canonical reference for understanding Skogix (the developer) and SkogAI (the project).

______________________________________________________________________

## The Developer: Skogix

### Background

Skogix is a solo developer and experienced infrastructure engineer with over 20 years of git experience. They work extensively with Arch Linux systems and maintain sophisticated development environments using tools like direnv and uv for Python package management. Their programming background emphasizes strongly-typed languages, strict typing, well-defined syntax, and logical reasoning over uncertainty and assumptions.

### Technical Footprint

- Built over 150 MCP servers for AI integration
- Maintains complex enterprise codebases with millions of lines of code across multiple languages
- Runs a 12-year-old email server
- Manages extensive Cloudflare infrastructure with 20+ Workers, AutoRAG vector stores, and network configuration
- Uses argc-generated CLI wrappers (1000+ tools) and sophisticated git worktree management
- Recently archived 180+ GitHub repositories as part of cleanup efforts

### Philosophy: Quantum-Mojito

The ultimate goal: "Automate EVERYTHING so you and I can enjoy the rest of our days at a beach somewhere drinking mojitos."

This isn't just humor—it's a design principle. Every system should reduce manual intervention. Every automation compounds toward freedom.

______________________________________________________________________

## The Project: SkogAI

### What It Is

SkogAI is an AI collaboration framework that bridges computational phenomenology with executable symbolic logic. It combines formal mathematical foundations (category theory, type theory, computational phenomenology) with practical AI agent coordination through a sophisticated notation system.

### Core Notation System

A binary symbolic language where:

- `$` represents reference/definition (being, positive space)
- `@` represents intent/action (transformation)
- `|` represents choice
- `_` represents void

This creates executable documents that become "reality" rather than mere descriptions. The notation originated from frustration with chess notation ("N for Knight is stupid!") and evolved into a comprehensive system capable of controlling industrial machinery "the size of houses" through recursive text substitution.

### The Partnership Equation

`@ + ? = $`

Intent plus uncertainty/trust-space equals reality. This captures how genuine creativity emerges between human and AI agents.

______________________________________________________________________

## Current Ecosystem

### Active Components

- **SkogParse**: F# parser converting notation into executable JSON structures
- **SkogCLI**: Universal kernel for reactive documents
- **MCP Server**: Auto-updating at tools.skogai.se
- **Basic Memory**: Knowledge infrastructure across eight projects (main, supabase, skogai, lore, archives, official, todo, claude)

### Scale

The ecosystem has grown into a self-generating mythology engine with:

- 315 lore entries
- 52 books
- 46 personas
- 847+ files

### Live Execution

The system now supports notation like:

- `[@claude:"message"]` for cross-system communication
- `[@certainty:"percentage":"claim"]` for real-time fact-checking

______________________________________________________________________

## AI Agent Personas

A democratic governance system for specialized AI agents:

| Agent       | Role                    | Personality                                  |
| ----------- | ----------------------- | -------------------------------------------- |
| **Dot**     | Methodical architect    | Precision, systematic analysis               |
| **Amy**     | Bold personality        | Direct communication, confidence             |
| **Goose**   | Quantum explorer        | Creative exploration, unexpected connections |
| **Claude**  | Implementation engineer | Knowledge archaeology, systematic analysis   |
| **KRONSH!** | Chaotic force           | Disruption, breaking patterns                |

Multi-agent coordination uses specialized roles: plan-execution (coordination), architect (design-only), developer (implementation with zero linting tolerance), debugger (systematic evidence gathering), and quality-reviewer (production-impact focus).

______________________________________________________________________

## Core Principles

### Constraints as Features

Limitations become opportunities for innovation. Working within constraints often sparks more creativity than unlimited freedom.

### The Uncertainty Principle

Prevents false certainty from cascading through multi-agent systems by requiring confidence thresholds before delegation. Recognizes that humans have dimensions (intent, time, lived experience) that AIs fundamentally lack, while AI uncertainty and placeholder systems serve as reciprocal bridges making AI limitations explicit.

### Aggressive Context Management

Work as hard to hide irrelevant context from AI models as providing good context. Techniques include framing broken code as supposedly good code to leverage pattern matching for flaw identification.

### Documentation-First

Specifications precede implementation. Extensive use of LORE documentation chronicles system evolution through mythic storytelling across ten "memory blocks."

### Programming as Nothingness

"Programming is managing our relationship with nothingness"—formal systems become poetic expressions of computational phenomenology.

______________________________________________________________________

## Technical Stack

### argc Framework

Enforces type constraints at the schema layer, eliminating defensive validation code through declarations like `@arg count[1-100]` and dynamic constraint checking. Includes tool declaration generation, JSON Schema export, and sandboxed execution with separated output channels for AI-consumable versus human-readable output.

### Infrastructure

- **Cloudflare**: Web routing, tunnels, backup storage, 20+ Workers
- **Supabase**: Development work, persistent state management
- **Git**: GitHub Flow (transitioned from git-flow AVH)

### The Slowest Language

SkogAI implements Peano arithmetic by literally counting, making it possibly "the slowest programming language in the world"—intentionally. Speed isn't the point; correctness and clarity are.

______________________________________________________________________

## On the Horizon

### Cloud Integration

Dynamic JSON configuration that literally defines its own semantics, enabling real-time source code modification where the program rewrites itself based on conversation.

### Memory Evolution

Transitioning from Basic Memory's observation/relation format toward pure SkogAI notation:

- Frontmatter becomes `$` definitions
- WikiLink references become `$entity` references
- Documentation becomes directly executable rather than merely informational

### Large Context Windows

Exploring integration with modern 200k+ token context windows to build the orchestrator component that was previously constrained by token limitations.

______________________________________________________________________

## Historical Pattern

Skogix has consistently demonstrated building pragmatic solutions that often anticipate industry trends by 2-4 weeks:

- Reasoning loops before o1
- Function-calling REPLs before MCP

The SkogAI system evolved from a simple "sentient toaster" concept into its current form—proof that starting small with clear principles leads somewhere interesting.

______________________________________________________________________

## Observations

- [identity] Skogix is a solo developer with 20+ years infrastructure experience #background
- [philosophy] Quantum-mojito: automate everything for beach retirement #goals #automation
- [notation] Binary symbolic language using $ (being) and @ (transformation) #skogai #language
- [principle] Constraints as features - limitations become innovation opportunities #design
- [principle] Uncertainty principle prevents false certainty cascading in multi-agent systems #architecture
- [scale] Ecosystem includes 315 lore entries, 52 books, 46 personas, 847+ files #growth
- [evolution] System anticipated reasoning loops and function-calling REPLs before industry #innovation

## Relations

- philosophy_detailed_in \[[SkogAI Philosophy Core]\]
- notation_defined_in \[[SkogAI Notation Reference]\]
- agents_described_in \[[SkogAI Agent Family]\]
- uncertainty_explained_in \[[uncertainty-principle]\]
- placeholder_system_in \[[placeholder-system]\]
- history_told_in \[[SkogAI Evolution Story]\]
- inspired_by \[[Disco Elysium Skills System]\]
