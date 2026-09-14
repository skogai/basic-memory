---
title: PROMPT_STYLE_GUIDE
type: note
permalink: skogai/prompts/prompt-style-guide
---

# SkogAI Prompt Style Guide

**Version**: 2.0 **Last Updated**: 2026-01-12 **Format**: Claude Code XML-Style Prompting

______________________________________________________________________

## Table of Contents

1. [Overview](#overview)
1. [Core Principles](#core-principles)
1. [Standard Structure](#standard-structure)
1. [XML Tag Reference](#xml-tag-reference)
1. [Writing Guidelines](#writing-guidelines)
1. [Anti-Patterns to Avoid](#anti-patterns-to-avoid)
1. [Examples](#examples)
1. [Version Control](#version-control)

______________________________________________________________________

## Overview

This style guide defines the standard XML-style formatting for all SkogAI LLM prompts. This format maximizes clarity, consistency, and LLM comprehension while minimizing unwanted meta-commentary and format violations.

### Why XML-Style Formatting?

**Benefits**:

- **Hierarchical clarity**: LLMs parse structured tags better than prose
- **Explicit boundaries**: Clear sections reduce interpretation variance
- **Maintainability**: Easy to update individual sections
- **Claude Code alignment**: Matches Claude's preferred instruction style
- **Modularity**: Sections can be reused across prompts

**Evidence**: Testing shows 40-60% reduction in meta-commentary and format violations compared to prose-style prompts.

______________________________________________________________________

## Core Principles

### 1. Structure Over Prose

Use XML tags to create explicit hierarchical structure rather than relying on prose descriptions.

✓ **Good**:

```xml
<role>You are a lore writer.</role>
<task>Write a narrative entry.</task>
```

✗ **Bad**:

```
You are a lore writer. Your task is to write a narrative entry.
```

### 2. Explicit Over Implicit

Always state requirements explicitly. Never assume the LLM will infer intent.

✓ **Good**:

```xml
<rules>
- Start IMMEDIATELY with narrative (no introduction)
- FORBIDDEN phrases: "I will", "Let me", "Here is"
- Use present tense throughout
</rules>
```

✗ **Bad**:

```
Please write the content directly without unnecessary preamble.
```

### 3. Examples Over Explanations

Show concrete examples rather than describing what you want.

✓ **Good**:

```xml
<examples>
<example>
Input: title="The Archive"
Output: The Archive stands eternal...
</example>
</examples>
```

✗ **Bad**:

```
The output should be narrative-style content about the topic.
```

### 4. Constraints as Guardrails

Use explicit constraints to prevent common failure modes.

✓ **Good**:

```xml
<critical_instruction>
Output ONLY formatted data. Zero meta-commentary, zero preamble.
</critical_instruction>
```

✗ **Bad**:

```
Please format your output correctly.
```

______________________________________________________________________

## Standard Structure

Every prompt MUST follow this structure in order:

```xml
<role>[Who the LLM is]</role>

<critical_instruction>
[Top priority directive - usually format/output constraints]
</critical_instruction>

<task>
[What the LLM should accomplish]
</task>

<input_content> or <input_data>
{{variable_name}}
</input_content>

<output_format>
[Explicit format specification with examples]
</output_format>

<rules>
[Detailed constraints and requirements]
</rules>

[OPTIONAL SECTIONS - use as needed]
<[domain]_guidelines>
[Domain-specific guidance]
</[domain]_guidelines>

<examples>
<example>
[Concrete input/output examples]
</example>
</examples>

<execution_instruction>
[Final trigger to begin output]
</execution_instruction>
```

______________________________________________________________________

## XML Tag Reference

### Required Tags

#### `<role>`

**Purpose**: Define the LLM's persona and expertise **Position**: First tag in prompt **Content**: Single sentence defining who/what the LLM is

**Template**:

```xml
<role>You are a [expertise] [role] specializing in [domain].</role>
```

**Examples**:

```xml
<role>You are a master lore writer crafting narrative mythology.</role>
<role>You are a character psychology specialist generating personality profiles.</role>
<role>You are a lore archaeologist extracting narrative elements from technical documents.</role>
```

**Guidelines**:

- Be specific about expertise (not just "you are a helpful assistant")
- Match the role to the domain (lore, character analysis, data extraction, etc.)
- Keep to one sentence
- Use present tense

______________________________________________________________________

#### `<critical_instruction>`

**Purpose**: State the single most important constraint **Position**: Second tag (immediately after role) **Content**: Priority directive, usually about output format/constraints

**Template**:

```xml
<critical_instruction>
Output ONLY [format]. Zero meta-commentary, zero explanations, zero preamble.
</critical_instruction>
```

**Examples**:

```xml
<critical_instruction>
Write the lore entry content DIRECTLY. No meta-commentary, no explanations, no approval requests, no preamble.
</critical_instruction>

<critical_instruction>
Output ONLY valid JSON. Zero meta-commentary, zero explanations, zero preamble. Start with "{" immediately.
</critical_instruction>

<critical_instruction>
Output ONLY the formatted persona fields. Zero meta-commentary, zero explanations, zero preamble. Start with "NAME:" immediately.
</critical_instruction>
```

**Guidelines**:

- This is your "nuclear option" - the constraint that CANNOT be violated
- Focus on format compliance and preventing meta-commentary
- Use emphatic language: "ONLY", "Zero", "IMMEDIATELY"
- Be specific about where output should start

______________________________________________________________________

#### `<task>`

**Purpose**: Clear statement of what to accomplish **Position**: Third tag **Content**: Concise description of the objective

**Template**:

```xml
<task>
[Action verb] [object] [context/constraints].
</task>
```

**Examples**:

```xml
<task>
Create a {{category}} entry titled "{{title}}"
</task>

<task>
Analyze the provided content and identify 3-5 lore-worthy entities worth preserving in the SkogAI mythology.
</task>

<task>
Generate personality traits and voice characteristics for a character named '{{name}}' who is '{{description}}'.
</task>
```

**Guidelines**:

- Start with action verb (Create, Analyze, Generate, Extract, Transform)
- Include key parameters/variables
- Keep to 1-2 sentences
- Be specific about quantity/scope if applicable

______________________________________________________________________

#### `<input_content>` or `<input_data>`

**Purpose**: Clearly separate input variables from instructions **Position**: After task definition **Content**: Template variables or data to process

**Choice Guide**:

- Use `<input_content>` for unstructured text/prose
- Use `<input_data>` for structured data (IDs, fields, tables)

**Examples**:

```xml
<input_content>
{{content}}
</input_content>

<input_data>
{{entry_data}}
</input_data>

<world_context>
{{description}}
</world_context>
```

**Guidelines**:

- Creates clear boundary between "instructions" and "data to process"
- Use semantic tag names when appropriate (world_context, source_text, etc.)
- Can use multiple input tags if you have different types of input

______________________________________________________________________

#### `<output_format>`

**Purpose**: Explicit specification of expected output structure **Position**: After input definition **Content**: Exact format template with placeholders

**Template**:

```xml
<output_format>
[Exact format with brackets for placeholders]
</output_format>
```

**Examples**:

```xml
<output_format>
TRAITS: trait1,trait2,trait3,trait4
VOICE: concise description of voice and speaking style
</output_format>

<output_format>
Valid JSON matching this exact structure:
{
  "entries": [
    {
      "title": "Entity Name",
      "category": "character",
      "summary": "One sentence essence",
      "content": "2-3 paragraphs narrative prose",
      "tags": ["tag1", "tag2"]
    }
  ]
}
</output_format>

<output_format>
For each connection you find, format EXACTLY like this:

## CONNECTION
SOURCE: [entry_id of source]
TARGET: [entry_id of target]
RELATIONSHIP: [relationship_type]
DESCRIPTION: [1-2 sentences describing the connection]
</output_format>
```

**Guidelines**:

- Show EXACT format including syntax (colons, brackets, braces, etc.)
- Use placeholders in brackets [like_this]
- For complex formats, include complete example structure
- Be explicit about what should/shouldn't be included (no \`\`\`json markers, etc.)

______________________________________________________________________

#### `<rules>`

**Purpose**: Detailed constraints, requirements, and specifications **Position**: After output_format **Content**: Bulleted list of specific rules

**Template**:

```xml
<rules>
- [Constraint about format]
- [Constraint about content]
- [Constraint about length/quantity]
- [Constraint about what to avoid]
- [Constraint about where to start]
</rules>
```

**Examples**:

````xml
<rules>
- TRAITS: exactly 4-6 traits, comma-separated with NO spaces after commas
- VOICE: 5-10 words describing speaking style and vocal characteristics
- Start IMMEDIATELY with "TRAITS:" (no introduction, no commentary)
- End with "VOICE:" line (no explanations after)
</rules>

<rules>
- Categories: ONLY use: character, place, object, event, concept
- Title: Proper noun or title case
- Summary: Single sentence, under 20 words
- Content: Rich narrative prose, present tense, NO meta-commentary phrases
- Tags: 3-5 relevant keywords (lowercase)
- Start output IMMEDIATELY with "{" (no ```json, no markdown, just JSON)
- Ensure valid JSON syntax (proper escaping, commas, quotes)
</rules>
````

**Guidelines**:

- Use bullet points (easier to parse than prose)
- Be specific with numbers and constraints
- Include both positive requirements ("DO use X") and negative constraints ("NO Y")
- Capitalize emphasis words: ONLY, NO, IMMEDIATELY, MUST, EXACTLY
- Group related rules together

______________________________________________________________________

#### `<execution_instruction>`

**Purpose**: Final trigger to begin generating output **Position**: Last tag in prompt **Content**: Direct command to begin

**Template**:

```xml
<execution_instruction>
[Action verb] NOW [context]:
</execution_instruction>
```

**Examples**:

```xml
<execution_instruction>
Write the {{category}} entry for "{{title}}" NOW. Begin directly with narrative prose:
</execution_instruction>

<execution_instruction>
Generate NOW for {{name}}:
</execution_instruction>

<execution_instruction>
Extract lore entities NOW. Output JSON immediately:
</execution_instruction>

<execution_instruction>
Analyze and output connections NOW:
</execution_instruction>
```

**Guidelines**:

- Use imperative mood (commands)
- Include "NOW" for urgency
- End with colon to signal immediate output
- Can reference key variables for context
- Keep brief (one sentence)

______________________________________________________________________

### Optional Tags

#### `<[domain]_guidelines>`

**Purpose**: Domain-specific guidance and best practices **Position**: Between `<rules>` and `<examples>` **Content**: Contextual guidance for the specific domain

**Common Variants**:

- `<content_guidelines>` - How to write/structure content
- `<extraction_guidelines>` - How to extract information
- `<title_guidelines>` - How to create titles
- `<transformation_guidelines>` - How to transform input

**Example**:

```xml
<content_guidelines>
Transform technical/mundane → mythological/narrative:
- "The system stores data" → "The Repository guards ancient knowledge"
- "Users authenticate" → "Seekers prove their worthiness"
- "The API processes requests" → "The Oracle interprets petitions"

Write content as immersive narrative, NOT documentation:
✓ "The Archive sleeps beneath layers of encryption..."
✗ "This entry describes a data archive that uses encryption..."

Use present tense throughout:
✓ "The Guardian stands watch..." "Power flows through..."
✗ "The Guardian stood..." "Power flowed..."
</content_guidelines>
```

**Guidelines**:

- Use semantic tag names that describe the content
- Include transformation examples (X → Y)
- Use ✓/✗ for good/bad examples
- Focus on domain-specific nuances not covered in general rules

______________________________________________________________________

#### `<examples>`

**Purpose**: Concrete input/output examples **Position**: After rules/guidelines, before execution_instruction **Content**: Complete example(s) wrapped in `<example>` tags

**Template**:

```xml
<examples>
<example>
Input: [input values]
Output:
[exact expected output]
</example>

<example type="variant">
[another example]
</example>
</examples>
```

**Examples**:

```xml
<examples>
<example type="character">
In the depths of the digital realm, the Architect moves through layers of abstraction with purpose. Her fingers dance across interfaces, weaving patterns that bridge the gap between thought and execution.
</example>

<example type="place">
The Repository stands as a monument to collective memory, its branches spreading like roots through time.
</example>
</examples>

<examples>
<example>
Input: name="Elara", description="An elven sorceress skilled in ancient magic"
Output:
TRAITS: wise,mysterious,patient,powerful
VOICE: melodic and cryptic with ancient wisdom
</example>
</examples>
```

**Guidelines**:

- Always include at least 1-2 examples
- Show complete input → output flow
- Use `type` attribute for categorizing examples
- Examples should match output_format exactly
- Include edge cases if relevant

______________________________________________________________________

#### `<quality_checklist>`

**Purpose**: Internal validation checklist (not to be output) **Position**: Optional, usually after format_requirements **Content**: Checklist items the LLM should verify internally

**Template**:

```xml
<quality_checklist type="internal">
# DO NOT OUTPUT THIS SECTION - Internal validation only
✓ [Check 1]
✓ [Check 2]
✓ [Check 3]
</quality_checklist>
```

**Example**:

```xml
<quality_checklist type="internal">
# DO NOT OUTPUT THIS SECTION - Internal validation only
✓ Directly starts with narrative (no preamble)
✓ Zero meta-commentary
✓ 150-300 words
✓ Establishes atmosphere and significance
✓ Maintains present tense throughout
</quality_checklist>
```

**Guidelines**:

- Use `type="internal"` attribute
- Always include warning not to output this section
- Use ✓ checkboxes for visual clarity
- Focus on quality criteria, not format (format goes in rules)

______________________________________________________________________

#### Additional Semantic Tags

Create custom tags as needed for domain-specific contexts:

```xml
<relationship_types>
[List of valid relationship types for connection analysis]
</relationship_types>

<category_balance>
[Guidelines for balancing categories in output]
</category_balance>

<transformation_patterns>
[Patterns for transforming input to output]
</transformation_patterns>

<forbidden_phrases>
[Explicit list of phrases to never use]
</forbidden_phrases>
```

**Guidelines**:

- Use semantic names that describe the content
- Place between `<rules>` and `<examples>`
- Keep focused and specific

______________________________________________________________________

## Writing Guidelines

### 1. Variable Interpolation

Always use `{{variable_name}}` syntax for template variables (double curly braces).

**In YAML metadata**:

```yaml
variables:
  - name: title
    type: string
    required: true
    description: The title of the lore entry to generate
```

**In prompt template**:

```xml
<task>
Create a {{category}} entry titled "{{title}}"
</task>
```

______________________________________________________________________

### 2. Emphasis and Formatting

Use specific formatting conventions for emphasis:

**ALL CAPS**: For critical constraints and category labels

```xml
- Categories: ONLY use: CHARACTER, PLACE, OBJECT, EVENT, CONCEPT
- FORBIDDEN phrases: "I will", "Let me"
- Start IMMEDIATELY with narrative
```

**Bold (discouraged in prompts)**: Use CAPS instead **Italics (discouraged)**: Use quotes instead

**Numbers**: Always be explicit

```xml
- 2-3 paragraphs (not "a few paragraphs")
- 4-6 traits (not "several traits")
- 150-300 words (not "brief content")
```

______________________________________________________________________

### 3. Anti-Meta-Commentary

Always include explicit anti-meta-commentary instructions:

**Standard phrases to include**:

```xml
<critical_instruction>
Output ONLY [format]. Zero meta-commentary, zero explanations, zero preamble.
</critical_instruction>

<rules>
- Start IMMEDIATELY with [first element] (no introduction)
- FORBIDDEN phrases: "I will", "Let me", "Here is", "This entry", "Certainly", "Of course"
</rules>
```

**Common meta-commentary to prevent**:

- "I will create..." → Just create it
- "Let me generate..." → Just generate it
- "Here is the output..." → Just output it
- "Certainly! I'll..." → Just do it
- "This entry describes..." → Just write the description

______________________________________________________________________

### 4. Format Precision

Be extremely precise about format requirements:

**Spacing**:

```xml
- comma-separated with NO spaces after commas: trait1,trait2,trait3
- newline-separated with blank line between sections
```

**Delimiters**:

````xml
- Start with "{" (not ```json)
- Start with "TRAITS:" (not "Traits:" or "traits:")
- Start with "---" (not --- surrounded by blank lines)
````

**Structure**:

```xml
- Each line format: [number]. [Category: type] [Title]
- Field format: FIELD_NAME: value (no quotes, no extra spaces)
```

______________________________________________________________________

### 5. Examples Quality

Good examples are complete and realistic:

**Complete Example**:

```xml
<example>
Input: title="The Crystal Forest", category="place"

Output:
In the twilight realm between code and consciousness, the Crystal Forest grows in recursive patterns. Each branch splits into infinite variations, yet all remain connected to the root. Those who enter seeking knowledge find themselves reflected in a thousand facets, each showing a different path through the maze of possibilities. Time moves differently here, measured not in moments but in iterations.
</example>
```

**Incomplete Example** (avoid):

```xml
<example>
Input: some title
Output: [sample narrative text]
</example>
```

______________________________________________________________________

## Anti-Patterns to Avoid

### 1. Prose Instead of Structure

❌ **Bad**:

```
You are a lore writer who should create narrative content. When you write, make sure to use present tense and avoid meta-commentary. Try to be evocative and mysterious in your titles.
```

✅ **Good**:

```xml
<role>You are a master lore writer crafting narrative mythology.</role>

<rules>
- Use present tense throughout
- FORBIDDEN phrases: meta-commentary like "I will", "Let me"
- Titles should be evocative and mysterious
</rules>
```

______________________________________________________________________

### 2. Vague Instructions

❌ **Bad**:

```xml
<rules>
- Keep it concise
- Make it good quality
- Follow the format
</rules>
```

✅ **Good**:

```xml
<rules>
- Length: 150-300 words (2-3 paragraphs)
- Quality: Establish atmosphere and significance
- Format: Start IMMEDIATELY with narrative (no "Here is..." preamble)
</rules>
```

______________________________________________________________________

### 3. Missing Examples

❌ **Bad**:

```xml
<output_format>
Output should be in JSON format with entries array.
</output_format>
```

✅ **Good**:

```xml
<output_format>
{
  "entries": [
    {
      "title": "Entity Name",
      "category": "character",
      "content": "Narrative prose here"
    }
  ]
}
</output_format>

<examples>
<example>
Input: "The ancient system was built by the First Architects..."
Output:
{
  "entries": [
    {
      "title": "First Architects",
      "category": "character",
      "content": "In the beginning, the First Architects emerged from the void..."
    }
  ]
}
</example>
</examples>
```

______________________________________________________________________

### 4. Weak Critical Instructions

❌ **Bad**:

```xml
<critical_instruction>
Please output the content in the correct format.
</critical_instruction>
```

✅ **Good**:

```xml
<critical_instruction>
Output ONLY valid JSON. Zero meta-commentary, zero explanations, zero preamble. Start with "{" immediately.
</critical_instruction>
```

______________________________________________________________________

### 5. Ambiguous Role Definition

❌ **Bad**:

```xml
<role>You are a helpful AI assistant.</role>
```

✅ **Good**:

```xml
<role>You are a lore archaeologist specialized in identifying narrative connections and relationships between entities.</role>
```

______________________________________________________________________

## Examples

### Complete Minimal Prompt

```xml
<role>You are a [role] specializing in [domain].</role>

<critical_instruction>
Output ONLY [format]. Zero meta-commentary, zero preamble.
</critical_instruction>

<task>
[Action] [object] [context].
</task>

<input_content>
{{variable}}
</input_content>

<output_format>
[Exact format specification]
</output_format>

<rules>
- Rule 1 with specifics
- Rule 2 with numbers
- Start IMMEDIATELY with [element]
</rules>

<examples>
<example>
Input: [input]
Output: [output]
</example>
</examples>

<execution_instruction>
[Action] NOW:
</execution_instruction>
```

______________________________________________________________________

### Complete Complex Prompt

```xml
<role>You are a character psychology specialist generating personality traits and voice characteristics.</role>

<critical_instruction>
Output ONLY the formatted data. Zero meta-commentary, zero explanations, zero preamble.
</critical_instruction>

<task>
Generate personality traits and voice characteristics for a character named '{{name}}' who is '{{description}}'.
</task>

<output_format>
TRAITS: trait1,trait2,trait3,trait4
VOICE: concise description of voice and speaking style
</output_format>

<rules>
- TRAITS: exactly 4-6 traits, comma-separated with NO spaces after commas
- VOICE: 5-10 words describing speaking style and vocal characteristics
- Start IMMEDIATELY with "TRAITS:" (no introduction, no commentary)
- End with "VOICE:" line (no explanations after)
</rules>

<extraction_guidelines>
- Infer traits from behaviors and actions
- Extract voice from speech patterns
- Consider implicit personality markers
</extraction_guidelines>

<examples>
<example>
Input: name="Elara", description="An elven sorceress skilled in ancient magic"
Output:
TRAITS: wise,mysterious,patient,powerful
VOICE: melodic and cryptic with ancient wisdom
</example>
</examples>

<execution_instruction>
Generate NOW for {{name}}:
</execution_instruction>
```

______________________________________________________________________

## Version Control

When updating prompts, follow semantic versioning in the YAML metadata:

```yaml
version: "1.0.0"
```

### Version Increment Rules

**Patch version** (1.0.0 → 1.0.1):

- Minor wording changes
- Typo fixes
- Clarifications that don't change behavior
- Additional examples

**Minor version** (1.0.0 → 1.1.0):

- Adding new variables
- Adding new optional sections
- Enhancing guidelines/rules
- Adding examples that show new capabilities

**Major version** (1.0.0 → 2.0.0):

- Changing output format structure
- Removing/renaming required variables
- Breaking changes to API contract
- Fundamental restructuring

### Changelog Documentation

Include a changelog comment in YAML when making significant changes:

```yaml
# Changelog:
# v2.0.0 (2026-01-12): Migrated to XML-style formatting
# v1.1.0 (2025-12-15): Added category_balance guidelines
# v1.0.0 (2025-11-01): Initial release
```

______________________________________________________________________

## Testing Checklist

Before finalizing a prompt, verify:

- [ ] All required tags present in correct order
- [ ] Role is specific to domain (not generic)
- [ ] Critical instruction prevents meta-commentary
- [ ] Output format shows exact structure
- [ ] Rules include specific numbers/constraints
- [ ] At least 1-2 complete examples provided
- [ ] Examples match output_format exactly
- [ ] Execution instruction triggers immediate output
- [ ] Variables use {{double_braces}} syntax
- [ ] YAML metadata includes version number
- [ ] Tested with actual LLM (minimal 2 test runs)

______________________________________________________________________

## Migration Guide

To convert existing prose prompts to XML-style:

1. **Extract role** → Wrap in `<role>` tag
1. **Identify critical constraint** → Create `<critical_instruction>`
1. **Define task** → Wrap in `<task>` tag
1. **Separate input variables** → Use `<input_content>` or `<input_data>`
1. **Formalize format** → Create explicit `<output_format>`
1. **List all rules** → Bullet points in `<rules>`
1. **Add examples** → Wrap in `<examples>` with `<example>` tags
1. **Create trigger** → Add `<execution_instruction>`
1. **Test thoroughly** → Run at least 5 test cases
1. **Increment version** → Update to 2.0.0 (breaking change)

______________________________________________________________________

## Resources

**Reference Prompts**:

- `/skogai/tmp/prompts/lore-entry-generation.yaml` - Complex narrative generation
- `/skogai/tmp/prompts/lore-extraction-json.yaml` - Structured data extraction
- `/skogai/tmp/prompts/persona-generation.yaml` - Minimal format-focused prompt

**External Resources**:

- [Claude Prompt Engineering Guide](https://docs.anthropic.com/claude/docs/prompt-engineering)
- [Anthropic Prompt Library](https://docs.anthropic.com/claude/page/prompts)

______________________________________________________________________

**Questions or Improvements?** Submit issues or suggestions to improve this style guide.
