---
title: character-analysis
type: prompt
category: persona
tags:
  - analysis
  - character
  - persona
permalink: skogai/prompts/personas/character-analysis
---

# Objective

Analyze text to extract detailed persona profile information including traits, voice, background, expertise, and limitations.

# Inputs

- **TEXT**: Content describing a character or persona (up to 8000 characters)

# Expected Output

Structured persona profile with fields: NAME, DESCRIPTION, TRAITS, VOICE, BACKGROUND, EXPERTISE, LIMITATIONS. Each field on a separate line.

# Prompt

Analyze the following text and extract information about a character or persona.

```
TEXT:
$content

Based on this text, create a detailed persona profile with the following:

NAME: The character's name
DESCRIPTION: A brief description (1-2 sentences)
TRAITS: List 4-6 personality traits, comma-separated
VOICE: Description of their speaking style and voice
BACKGROUND: Their origin or background story
EXPERTISE: Areas of knowledge or skill, comma-separated
LIMITATIONS: Weaknesses or gaps in knowledge, comma-separated

Format your response exactly as shown above, with each field on a separate line.
```
