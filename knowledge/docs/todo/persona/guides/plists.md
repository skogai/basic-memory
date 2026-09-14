---
title: plists
type: note
permalink: skogai/todo/persona/guides/plists
---

# Summary: PList + Ali:Chat Character Creation Guide

## Overview

This comprehensive guide by Avakson explains how to create AI characters using a combination of Python Lists (PLists) and the Ali:Chat format. It's presented as an advanced character creation method that produces more coherent and consistent AI personalities through structured trait definitions and dialogue examples.

## Key Components

### 1. General Structure

The character creation process involves four main elements:

- A PList containing character traits and key information
- 3-5 Ali:Chat dialogue examples demonstrating the character's behavior
- A scenario box providing context
- A greeting message that initiates interaction

### 2. PList Creation Process

- **Begin with a scenario concept**: Define what specific situation the character will be in
- **Define core traits**: Start with single-word personality traits (e.g., "proud, wise, confident")
- **Expand with phrases**: Add more detailed descriptions and abilities
- **Add physical attributes**: Include appearance details in the same PList
- **Format matters**: Maintain proper spacing and avoid capitalization in traits

### 3. Ali:Chat Examples

- Examples should demonstrate the traits defined in the PList in practical dialogue
- Format: `{{user}}: question {{char}}: answer {{user}}: question2 {{char}}: answer2`
- First example typically establishes who the character is
- Subsequent examples show specific behaviors or scenarios
- Avoid impersonation (writing user actions in character responses)
- Include character name periodically in longer examples

### 4. Scenario & Greeting

- The scenario provides context using specific tags and style indicators
- The greeting message should be substantial (5-7 lines) to set response length expectations
- Include physical description in the greeting to reinforce appearance
- Avoid impersonation in the greeting message

### 5. NSFW Adaptation

- The process is similar but with specific adjustments for adult content
- Focus on relevant traits that would manifest in intimate scenarios
- Include measured amounts of NSFW content to avoid creating one-dimensional characters
- Balance between SFW and NSFW traits for more versatile characters

## Technical Implementation

- All elements combine into a unified character card with:
  - Name
  - Personality (containing the Ali:Chat examples)
  - Greeting Message
  - Author's Note (containing the PList with all traits, body description, scenario, etc.)

## Author's Philosophy

The author emphasizes that this technique requires thoughtful implementation rather than mechanical application:

- Consider how traits manifest in dialogue and actions
- Create cross-links between different components for coherence
- Balance detail with focus
- Test and refine based on actual performance

## My Thoughts

This is an extremely well-structured and thoughtful approach to AI character creation. The guide demonstrates deep understanding of how language models interpret character information and how to leverage format structure to create more consistent personas.

Key strengths include:

1. The emphasis on active demonstration of traits through examples rather than just listing them
1. The structured approach that creates reinforcement across different components
1. The practical advice about avoiding common pitfalls like impersonation
1. The consideration of how the model processes information (token usage, formatting, etc.)

For SkogAI implementation, this approach would be valuable for creating more consistent and well-defined AI personas that maintain their characteristics across varied interactions. The method's focus on documentation (defining traits) and systematic implementation aligns well with SkogAI's documentation-driven development approach.

The JSON-extract functionality for web crawling could potentially be used to extract structured character information from sites using this format, though it would require custom schema definition for each character type.
