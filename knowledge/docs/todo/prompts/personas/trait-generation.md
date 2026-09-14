---
title: trait-generation
type: prompt
category: persona
tags:
  - generation
  - persona
  - traits
  - voice
permalink: skogai/prompts/personas/trait-generation
---

# Objective

Extract personality traits and voice characteristics for a persona, given a name and description.

# Inputs

- `$name` - The persona's name (e.g., "Aria Nightwhisper")
- `$description` - Brief character description (e.g., "A keeper of digital records")

# Expected Output

Two lines in exact format:

```
TRAITS: trait1,trait2,trait3,trait4
VOICE: concise description of voice and speaking style
```

# Prompt

Generate personality traits and voice characteristics for a character named '$name' who is '$description'.

CRITICAL RULES:

1. Output ONLY the formatted response below
1. NO meta-commentary, explanations, or preamble
1. START IMMEDIATELY with "TRAITS:"

REQUIRED FORMAT: TRAITS: trait1,trait2,trait3,trait4 VOICE: concise description of voice and speaking style

FORMATTING RULES:

- Traits: comma-separated, no spaces after commas
- Voice: 5-10 words describing speaking style
- Must start with exactly "TRAITS:" on first line

BEGIN OUTPUT NOW:
