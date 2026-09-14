---
title: comparisons
type: note
permalink: skogai/todo/persona/guides/comparisons
---

# Comparison of Character Creation Guides: AVAK's, kingbri's, and AliCat's Approaches

After analyzing all three guides on AI character creation, here's a comprehensive comparison of their approaches, strengths, and potential applications for SkogAI's lorebook system:

## 1. AVAK's Guide - PList + Ali:Chat

**Core Methodology:**

- Detailed exploration of character traits and personality through comprehensive PLists
- Multiple PLists for different aspects (persona, body, scenario, etc.)
- Examples that deliberately demonstrate character traits in action

**Strengths:**

- Thorough character development with explicit trait organization
- Strong emphasis on maintaining character consistency through examples
- Clear step-by-step process for both SFW and NSFW characters

**Relevance to Lorebooks:**

- Provides excellent structure for creating lorebook entries with distinct categories
- The "interests" and "background" PLists could directly map to separate lorebook entries
- Trait-based approach allows for targeted log scanning and information extraction

## 2. kingbri's Guide - MinimALIstic (Ali:Chat Lite)

**Core Methodology:**

- Token optimization through consolidated PLists with semicolon separators
- Placement of PLists in Author's Notes rather than main character description
- Advanced formatting techniques for maximum token efficiency

**Strengths:**

- Highly efficient token usage allowing for more chat history
- Detailed attention to technical implementation (e.g., tokenization, formatting)
- Structured approach to World Info/Lorebooks with key/value pairs and recursive scanning

**Relevance to Lorebooks:**

- Provides technical framework for efficient lorebook implementation
- Recursive scanning approach directly applies to your intended log-parsing system
- Token micro-optimization techniques would be valuable for keeping lorebooks compact

## 3. AliCat's Guide - Ali:Chat Style

**Core Methodology:**

- Using dialogue as the primary vehicle to express character traits
- Example dialogues that reinforce character attributes in natural conversation
- Scenario-driven approach with flexible implementation options

**Strengths:**

- Comprehensive explanation of implementation across different platforms
- Strong focus on driving complete scenarios through dialogue examples
- Detailed tips and techniques for maintaining character consistency

**Relevance to Lorebooks:**

- The scenario maker concept could be adapted for dynamic lorebook generation
- World Info section specifically addresses how to structure information for retrieval
- Advanced formatting tips could enhance lorebook readability and effectiveness

## Synthesis for SkogAI Lorebook Implementation

Based on your description of using local models to parse logs, add important information, and build lorebook entries recursively, I recommend a hybrid approach that leverages strengths from all three guides:

1. **Structure & Format**: Use kingbri's consolidated PList format with semicolon separators for efficiency, but organize content categories following AVAK's comprehensive trait classification

1. **Technical Implementation**: Implement kingbri's recursive scanning approach for your log-parsing system, which would allow previously identified information to trigger searches for related concepts

1. **Dialogue Examples**: Follow AliCat's approach of using dialogue examples in lorebook entries to demonstrate how the character relates to specific concepts or information

1. **Lorebook Entry Format**:

   ```
   {
       "id": [unique_id],
       "keys": ["primary_trigger_words"],
       "secondary_keys": ["contextual_triggers"],
       "comment": "Category/Purpose",
       "content": "[Category: trait1, trait2, trait3; Related: concept1, concept2]",
       "insertion_order": 100,
       "position": "before_char",
       "extensions": {
           "probability": 100,
           "depth": 4,
           "selectiveLogic": 0
           // Other technical parameters
       }
   }
   ```

1. **Log Parsing Strategy**:

   - First pass: Identify key topics, concepts, and character references
   - Second pass: Group related information using the recursive scanning approach
   - Third pass: Format information into consolidated PLists with appropriate category tags
   - Final pass: Generate dialogue examples that demonstrate the character's relationship to the information

This approach would allow your system to:

1. Identify important information from logs efficiently
1. Structure it in a token-optimized format
1. Create connections between related concepts
1. Implement a tiered system where more specific information is only included when directly relevant

The lorebook entry format you shared is already well-suited for this approach, particularly with its support for regex, selective logic, and recursive scanning. The key adaptation would be implementing the consolidated PList format within the "content" field rather than using a more verbose description.

______________________________________________________________________

## Comparison to AVAK's Guide

Both guides focus on creating consistent AI characters using PLists and Ali:Chat dialogue examples, but they differ in several key aspects:

### AVAK's Guide (First Document)

1. **Structure**: Uses multiple separate PLists for different aspects of the character
1. **Focus**: Emphasizes comprehensive character definition through detailed examples
1. **Approach**: More descriptive and detailed, prioritizing character depth
1. **Implementation**: Places PLists directly in character description
1. **Examples**: Recommends 3-5 dialogue examples with extensive context

### kingbri's MinimALIstic Guide (Second Document)

1. **Structure**: Consolidates PLists with semicolon separators into a single entry
1. **Focus**: Prioritizes token efficiency and optimization
1. **Approach**: More technical, emphasizing how to reduce token count while preserving function
1. **Implementation**: Places PLists in Author's Notes section
1. **Examples**: Recommends 2-3 more concise dialogue examples

### Key Differences

- **Token Economy**: MinimALIstic guide is explicitly designed to reduce token usage, while AVAK's approach provides more comprehensive character definition
- **Technical Detail**: kingbri's guide includes more advanced techniques like micro-optimization and internal monologue implementation
- **Application**: AVAK's guide is better for detailed character creation with fewer token constraints, while MinimALIstic is optimal for maximizing chat history or working with lower-context models

### Recommendation

For SkogAI implementation, I would recommend a hybrid approach:

- Use kingbri's consolidated PList structure and Author's Note implementation for efficiency
- Apply AVAK's depth of character development and multiple examples approach
- Implement the technical optimizations from MinimALIstic when token constraints are an issue
- Use World Info/Lorebooks extensively for domain-specific knowledge that SkogAI specialists would need
