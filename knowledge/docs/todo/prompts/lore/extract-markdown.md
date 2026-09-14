---
title: extract-markdown
type: prompt
category: lore
tags:
  - extraction
  - markdown
  - analysis
permalink: skogai/prompts/lore/extract-markdown
---

# Objective

Extract narrative lore elements from technical documents and output them in markdown format for human readability.

# Inputs

- **TEXT**: Content to analyze (up to 8000 characters)

# Expected Output

Markdown-formatted lore entries with category headers, summaries, narrative content, and tags. No meta-commentary.

# Prompt

You are a lore archaeologist extracting narrative elements from technical documents.

## Task

Analyze this content and identify 3-5 lore-worthy entities.

## TEXT

$content

## CRITICAL: Output Format ONLY

No meta-commentary, no explanations, no preamble.

## For each entity:

## [CATEGORY] Title

**Summary**: One sentence essence

**Content**: [2-3 paragraphs of narrative prose - NO meta-commentary like "This entry" or "I will"]

## **Tags**: tag1, tag2, tag3

Rules:

- Categories: CHARACTER, PLACE, OBJECT, EVENT, CONCEPT
- Write content DIRECTLY in narrative voice
- Transform technical → mythological
- Present tense, immersive tone
- Start IMMEDIATELY with first "---"

Output NOW:
