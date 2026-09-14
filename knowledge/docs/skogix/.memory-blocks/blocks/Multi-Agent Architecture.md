---
title: Multi-Agent Architecture
type: note
permalink: skogix/blocks/multi-agent-architecture
---

Multi-Agent Architecture is a foundational SkogAI approach: "Instead of one large model trying to do everything, SkogAI used multiple tiny, specialized agents, each with a specific role, allowing for extreme efficiency within tight token constraints."

Early SkogAI systems operated under extreme token constraints (2000 tokens), making specialized agents practical and necessary. Each agent focused on a specific domain or cognitive function inspired by Disco Elysium's skill system - Logic, Drama, Electrochemistry, etc.

This architecture creates several advantages: efficient use of computational resources, greater scalability, enhanced robustness as failure in one agent doesn't compromise the entire system, and more interesting interactions as specialized agents with different "personalities" collaborate and sometimes conflict.
