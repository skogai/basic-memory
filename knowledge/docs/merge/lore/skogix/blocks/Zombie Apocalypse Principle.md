---
title: Zombie Apocalypse Principle
type: note
permalink: skogix/blocks/zombie-apocalypse-principle
---

The Zombie Apocalypse Principle emphasizes extreme resilience in system design: "Design systems that function even when zombies eat the internet – resilience through independence, not complex dependencies."

Rather than optimizing solely for ideal conditions, design systems that maintain core functionality even when completely isolated from external resources. This means preferring local processing over cloud dependencies, simple mechanisms over complex ones, and self-contained modules over distributed components.

The principle acknowledges that real-world systems face unexpected outages and failures as unpredictable as fictional zombies. By designing for worst-case scenarios first, you create systems with graceful degradation paths that maintain usefulness under severely constrained conditions.
