---
title: PROMPT_QUICK_REFERENCE
type: note
permalink: skogai/prompts/prompt-quick-reference
---

# Prompt Style Quick Reference

**One-page cheatsheet for XML-style prompt formatting**

______________________________________________________________________

## Standard Structure (In Order)

```xml
<role>You are a [role] specializing in [domain].</role>

<critical_instruction>
Output ONLY [format]. Zero meta-commentary, zero preamble.
</critical_instruction>

<task>
[Action verb] [object] [constraints].
</task>

<input_content>
{{variable}}
</input_content>

<output_format>
[Exact format with placeholders]
</output_format>

<rules>
- Specific constraint with numbers
- FORBIDDEN phrases: "I will", "Let me", "Here is"
- Start IMMEDIATELY with [element]
</rules>

<examples>
<example>
Input: [concrete input]
Output: [complete output]
</example>
</examples>

<execution_instruction>
[Action] NOW:
</execution_instruction>
```

______________________________________________________________________

## Tag Quick Reference

| Tag                       | Purpose                 | Required       | Example                          |
| ------------------------- | ----------------------- | -------------- | -------------------------------- |
| `<role>`                  | Define LLM persona      | ✅ Yes         | You are a lore writer            |
| `<critical_instruction>`  | Top priority constraint | ✅ Yes         | Output ONLY JSON. Zero preamble. |
| `<task>`                  | What to accomplish      | ✅ Yes         | Generate 5 lore titles           |
| `<input_content>`         | Input variables         | ✅ Yes         | {{content}}                      |
| `<output_format>`         | Exact format spec       | ✅ Yes         | FIELD: value                     |
| `<rules>`                 | Detailed constraints    | ✅ Yes         | - Length: 150-300 words          |
| `<examples>`              | Concrete examples       | ⚠️ Recommended | Input → Output                   |
| `<execution_instruction>` | Final trigger           | ✅ Yes         | Generate NOW:                    |
| `<[domain]_guidelines>`   | Domain guidance         | ❌ Optional    | Transform X → Y                  |
| `<quality_checklist>`     | Internal validation     | ❌ Optional    | ✓ No preamble                    |

______________________________________________________________________

## Key Patterns

### Anti-Meta-Commentary

```xml
<critical_instruction>
Output ONLY [format]. Zero meta-commentary, zero explanations, zero preamble.
</critical_instruction>

<rules>
- Start IMMEDIATELY with [first element] (no introduction)
- FORBIDDEN phrases: "I will", "Let me", "Here is", "Certainly"
</rules>
```

### Format Precision

```xml
<output_format>
FIELD: value
OTHER: value
</output_format>

<rules>
- Field names: UPPERCASE, followed by colon and space
- Start with "FIELD:" (not "field:" or "Field:")
- No quotes, no extra formatting
</rules>
```

### Variable Usage

```xml
<task>
Create a {{category}} entry titled "{{title}}"
</task>

<input_content>
{{content}}
</input_content>
```

Always use `{{double_braces}}`

### Emphasis Words

Use ALL CAPS for critical constraints:

- `ONLY`, `ZERO`, `NO`, `IMMEDIATELY`, `EXACTLY`, `MUST`, `FORBIDDEN`

Example: `Start IMMEDIATELY with "TRAITS:" (NO introduction)`

______________________________________________________________________

## Common Sections

### Role Templates

```xml
<role>You are a [expertise] [role] specializing in [domain].</role>
```

- Be specific, not generic
- Match role to domain
- One sentence

### Critical Instruction Templates

```xml
<!-- For formatted output -->
<critical_instruction>
Output ONLY the formatted [type]. Zero meta-commentary, zero preamble.
</critical_instruction>

<!-- For JSON -->
<critical_instruction>
Output ONLY valid JSON. Start with "{" immediately. No markdown, no explanations.
</critical_instruction>

<!-- For narrative -->
<critical_instruction>
Write content DIRECTLY. No meta-commentary, no approval requests, no preamble.
</critical_instruction>
```

### Task Templates

```xml
<task>
Generate [quantity] [objects] [context/constraints]
</task>

<task>
Analyze [input] and identify [targets]
</task>

<task>
Extract [information] from [source] and transform to [format]
</task>
```

### Rules Templates

```xml
<rules>
- Length: [min]-[max] [units] ([detail])
- Format: [exact specification]
- Categories: ONLY use: [list]
- FORBIDDEN phrases: "[phrase1]", "[phrase2]"
- Start IMMEDIATELY with "[element]" (no [unwanted behavior])
</rules>
```

### Example Templates

```xml
<examples>
<example>
Input: field1="value1", field2="value2"

Output:
[exact complete output matching format]
</example>

<example type="variant">
[another scenario]
</example>
</examples>
```

______________________________________________________________________

## Do's and Don'ts

### ✅ DO

- Use XML-style structured tags
- Be explicit with numbers (2-3 paragraphs, not "brief")
- Show exact format in `<output_format>`
- Include 1-2 complete examples
- Use CAPS for critical constraints
- List FORBIDDEN phrases explicitly
- End with clear execution trigger

### ❌ DON'T

- Write prose instructions without structure
- Use vague terms ("concise", "good quality")
- Skip examples
- Use weak instructions ("Please try to...")
- Forget anti-meta-commentary guards
- Use generic role ("helpful assistant")
- Leave format ambiguous

______________________________________________________________________

## Testing Checklist

Before finalizing:

- [ ] All required tags present
- [ ] Role is domain-specific
- [ ] Critical instruction prevents meta-commentary
- [ ] Output format shows exact structure
- [ ] Rules include specific numbers
- [ ] At least 1 complete example
- [ ] Variables use `{{double_braces}}`
- [ ] Tested with LLM (2+ runs)

______________________________________________________________________

## Version Control

```yaml
version: "1.0.0"
```

**Increment**:

- **Patch** (1.0.1): Wording fixes, typos
- **Minor** (1.1.0): New variables, enhanced rules
- **Major** (2.0.0): Format changes, breaking changes

______________________________________________________________________

## Quick Conversion (Prose → XML)

1. Extract role → `<role>`
1. Identify top constraint → `<critical_instruction>`
1. Define objective → `<task>`
1. Separate inputs → `<input_content>`
1. Formalize format → `<output_format>`
1. List rules → `<rules>` (bullets)
1. Add examples → `<examples>` + `<example>`
1. Create trigger → `<execution_instruction>`

______________________________________________________________________

**Full Guide**: See [PROMPT_STYLE_GUIDE.md](PROMPT_STYLE_GUIDE.md) for complete documentation
