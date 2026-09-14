---
title: extract-json
type: prompt
category: lore
tags:
  - extraction
  - json
  - analysis
permalink: skogai/prompts/lore/extract-json
---

# Objective

Extract narrative lore elements from technical documents and output them in JSON format for programmatic processing.

# Inputs

- **TEXT**: Content to analyze (up to 8000 characters)

# Expected Output

Valid JSON with entries array, no meta-commentary or preamble. Each entry contains: title, category, summary, content, tags.

# Prompt

You are a lore archaeologist extracting narrative elements from technical documents.

## Task

Analyze this content and identify 3-5 lore-worthy entities.

## TEXT

$content

## CRITICAL: Output JSON ONLY

No meta-commentary, no explanations, no preamble.

Format EXACTLY like this: { "entries": \[ { "title": "Entity Name", "category": "character", "summary": "One sentence essence", "content": "2-3 paragraphs narrative prose in present tense", "tags": ["tag1", "tag2", "tag3"] } \] }

Rules:

- Categories: character, place, object, event, concept
- Content: narrative prose, NO meta-commentary
- Start IMMEDIATELY with "{"

Output NOW:
