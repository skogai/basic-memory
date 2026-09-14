---
title: analyze-connections
type: prompt
category: lore
tags:
  - analysis
  - connections
  - relationships
permalink: skogai/prompts/lore/analyze-connections
---

# Objective

Identify meaningful relationships between lore entries to build a connected knowledge graph.

# Inputs

- **ENTRY_DATA**: List of lore entries with ID, TITLE, CATEGORY, SUMMARY for each

# Expected Output

Structured connection data with SOURCE, TARGET, RELATIONSHIP, DESCRIPTION for each identified connection. Minimum 3-5 connections.

# Prompt

Analyze these lore entries and identify meaningful connections between them:

```
$ENTRY_DATA

For each connection you find, format your response like this:

## CONNECTION
SOURCE: [entry_id of source]
TARGET: [entry_id of target]
RELATIONSHIP: [describe relationship type: part_of, located_in, created_by, opposes, allies_with, etc.]
DESCRIPTION: [1-2 sentences describing the connection]

Identify at least 3-5 meaningful connections.
```
