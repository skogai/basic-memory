---
title: kingbri-chara-guide
type: note
permalink: skogai/todo/persona/guides/kingbri-chara-guide
---

# Summary: MinimALIstic (Ali:Chat Lite) Character Creation Guide

## Overview

This guide by kingbri presents a token-optimized approach to AI character creation called "Ali:Chat Lite" that combines the Ali:Chat dialogue format with efficient Python Lists (PLists). The methodology focuses on maximizing context within token constraints to create more effective characters while maintaining performance.

## Key Components

### 1. Efficient PList Structure

- **Consolidated Format**: Unlike previous methods that used multiple separate PLists, this approach combines all traits into one or two comprehensive PLists using semicolons as separators
- **Format**: `[Character's persona: traits; Character's clothes: traits; Character's body: traits; Genre: genre; Tags: tags; Scenario: scenario]`
- **Author's Note Implementation**: PLists are placed in the Character's Author's Note rather than in the main character description to save token space
- **Prioritization**: Traits placed toward the end of a list are considered more important than those at the beginning

### 2. Ali:Chat Examples

- **Focused Content**: The main character description contains only Ali:Chat dialogue examples
- **Optimization Recommendations**:
  - Create 2 long examples (7-8 lines each) or 3 short examples (5-6 lines each)
  - Use simple prompts like "Tell me your life story," "Appearance?" or "Personality?"
  - Keep total examples between 300-600 tokens
  - Focus on demonstrating important character traits rather than excessive description

### 3. World Info/Lorebooks

- **Structured Information**: Use World Info for environments, lore, and alternate outfits
- **Key/Value Pairs**: Information is organized with keys (triggers) that inject specific values into context
- **Types**:
  - Environment entries (simple PList descriptions)
  - Lore entries (combination of PList + Ali:Chat examples)
- **Advanced Features**: Uses selective logic (AND conditions), recursive scanning, and placement options for optimized context management

### 4. Greeting Messages

- **Token Efficiency**: Treats greeting message tokens as temporary rather than permanent
- **Flipped Scenario Technique**: Write from the character's perspective without impersonating the user
- **Impersonation Avoidance**: Never write what the user is doing in the greeting
- **Question Removal**: Remove leading questions from greetings to prevent response loops

### 5. Advanced Features

- **Token Micro-optimization**:
  - Use associations: `mint-green blouse` becomes `blouse(mint-green)`
  - Compress multiple descriptors: `light blue hair, short hair, messy hair` becomes `hair(light blue, short, messy)`
  - Compress actions: `showing a disgusted face` becomes `looking disgusted`
- **Character Thoughts**: Implementation of internal monologue through consistent formatting patterns

## Implementation Process

1. Create PLists with consolidated traits separated by semicolons
1. Write 2-3 Ali:Chat examples focusing on important character traits
1. Create a greeting message using the flipped scenario technique
1. Place PLists in the Character's Author's Note
1. Keep only Ali:Chat examples in the main character description

## Benefits

- **Token Efficiency**: Reduces character card size while preserving detail
- **Context Maximization**: Allows more chat history by reducing permanent token usage
- **Coherent Characterization**: Maintains character consistency through focused examples
- **Scalability**: Works with additional features like World Info and character thoughts
