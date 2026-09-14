---
title: claude-prompting
type: note
permalink: skogai/docs-merge-todo/prompts/aichat/claude-prompting
---

# Important Guidelines for Prompt Creation with Claude

When creating prompts for Claude (or interacting with me), here are important things to avoid or be aware of:

## XML Tag Considerations

1. **Reserved XML Tags**: Be cautious with tags like `<system>`, `<human>`, `<assistant>`, `<output>`, and their shorter forms (`<s>`, `<h>`, `<a>`, `<o>`). These have special meaning in Claude's prompt format and might be processed in unexpected ways.

1. **Tag Transformation**: Claude may internally transform certain XML tags (like `<system>` to `<s>`), which can lead to confusion when analyzing content.

1. **Nested Tags**: Avoid deeply nested XML structures as they may not be processed as expected and could cause confusion in Claude's interpretation.

1. **Unclosed Tags**: Always ensure XML tags are properly closed, as unclosed tags can affect how Claude processes the entire prompt.

## Other Prompt Considerations

5. **Instruction Insertion**: Claude has protections against prompt injection, but avoid unintentionally embedding instructions within code blocks or examples that might be interpreted as new directions.

1. **Special Characters/Delimiters**: Be careful with special sequences that might be interpreted as format markers (e.g., repeated hyphens, triple backticks, certain XML patterns).

1. **Context Window Limits**: There are limits to how much context Claude can process at once. Extremely long prompts might be truncated or not fully considered.

1. **Ambiguous Instructions**: Claude tries to follow instructions precisely, so ambiguous or conflicting directions can produce unexpected results.

1. **Encoding Issues**: Some special characters or specific Unicode sequences might not be processed as expected.

1. **Model Boundaries**: Requests for harmful content, illegal activities, or other content that violates Claude's usage policies will be declined.

1. **Prompt Formatting Inconsistency**: Mixing different formatting styles (XML, markdown, plain text) in confusing ways can lead to unexpected interpretation.

1. **Overriding Previous Instructions**: Be aware that new instructions may override previous ones if they conflict, so structure your prompt with a clear hierarchy of instructions.

1. **Role-Playing Limitations**: Asking Claude to pretend to be entities that would violate its values or guidelines won't work, even if creatively phrased.

1. **Excessive Repetition**: Repeating the same instruction multiple times doesn't necessarily make Claude follow it more accurately and may waste context window space.

Understanding these considerations can help you create more effective prompts that work with Claude's processing rather than triggering unexpected behaviors.

# Additional Important Considerations for Claude Prompts

Here are some additional important points to be aware of when creating prompts for Claude:

## Technical Considerations

15. **JSON and Code Formatting**: When requesting JSON or code output, providing a clear structure or template helps Claude generate more accurate and well-formatted responses.

01. **Token Limitations**: Be mindful that extremely specific or complex instructions consume tokens that could otherwise be used for content. Balance instruction detail with available context space.

01. **Instruction Placement**: The most important instructions should typically appear at the beginning or end of your prompt, as these positions have higher salience for Claude.

01. **Versioning Differences**: Different Claude versions (Claude 3 Opus, Claude 3 Sonnet, Claude 3 Haiku, etc.) have different capabilities and limitations, so prompts may perform differently across versions.

## Interaction Strategies

19. **Iterative Refinement**: Often the best approach is to start with a simpler prompt and iteratively refine it based on Claude's responses, rather than creating an extremely complex prompt initially.

01. **Explicit Over Implicit**: Claude performs better with explicit instructions rather than having to infer what you want. State your requirements clearly.

01. **Example-Based Learning**: Providing examples of desired outputs ("few-shot prompting") often produces better results than abstract descriptions alone.

01. **Contextual Amnesia**: Claude doesn't "remember" previous conversations unless they're included in the current prompt. Important context needs to be restated or referenced.

## Content Considerations

23. **Hallucination Management**: For factual tasks, explicitly instruct Claude to indicate uncertainty rather than guessing, and to cite sources when possible.

01. **Multimodal Limitations**: When using images, be aware that Claude can't process text in images with 100% accuracy, especially if it's handwritten, stylized, or in complex layouts.

01. **Language Specificity**: When working with multiple languages, be explicit about which language you want Claude to use in its response.

01. **Tone and Style Control**: If you need a specific tone or writing style, explicitly request it and possibly provide examples, as Claude will otherwise use a neutral, helpful tone.

Understanding these additional considerations will help you craft more effective prompts and develop a better mental model of how Claude processes and responds to your instructions.

## Advanced Considerations

27. **Response Length Management**: For controlling output length, specific instructions like "be concise" or "respond in about X paragraphs" work better than vague terms like "short" or "detailed."

01. **Reasoning Chains**: For complex problems, explicitly asking Claude to "think step by step" or "explain your reasoning" often produces more accurate results than asking for direct answers.

01. **Tool Use Awareness**: Claude doesn't have built-in tools or the ability to execute code, perform calculations, or access external data unless specifically integrated into the platform you're using.

01. **Time Sensitivity**: Claude's training has a knowledge cutoff date, so for time-sensitive topics, you may need to provide current information in your prompt.

This completes a thorough overview of prompt engineering considerations for Claude. The combined list now covers the technical aspects, interaction strategies, content considerations, and advanced techniques that will help you get the most effective results from your interactions.

______________________________________________________________________

# Important Tags and Markup Formats to Know About

You're right to ask about other important tags beyond just Claude's reserved ones. Here's a more comprehensive overview:

## General AI System Tags (Across Different AI Systems)

1. **`<system>` / `[system]`**: Used in many AI systems to define system-level instructions or context

1. **`<user>` / `[user]` / `<human>` / `[human]`**: Common across many AI platforms to denote user messages

1. **`<assistant>` / `[assistant]` / `<ai>` / `[ai]`**: Widely used to mark AI responses

1. **`<context>` / `[context]`**: Often used to provide background information

1. **`<instructions>` / `[instructions]`**: Common for detailed guidance sections

## Special Formatting Markers

6. **Triple backticks (\`\`\`)**: Used across many AI systems for code blocks and can sometimes trigger special processing

1. **`<thinking>` / `[thinking]`**: Used in some systems for internal reasoning

1. **`<output>` / `[output]`**: Can trigger special formatting in some systems

1. **`<example>` / `[example]`**: Often used to provide examples of desired outputs

1. **`<format>` / `[format]`**: Used to specify output formats

## JSON and Data Structure Tags

11. **`<json>` / `[json]`**: May trigger special JSON formatting in some systems

01. **`<data>` / `[data]`**: Often used to denote structured data sections

## Control Flow Tags

13. **`<if>`, `<then>`, `<else>`**: While not special to most AI systems, these logical structure tags appear frequently in prompts

01. **`<step>` / `[step]`**: Used for procedural instructions

## Markdown-Related

15. **`#`, `##`, `###`**: Heading markers that can influence formatting and structure

01. **`---`**: Horizontal rule/section dividers that may have special meaning in some contexts

The key insight is that while different AI systems have different reserved tags, there's a common pattern of using XML-like or markdown-like formatting to structure prompts. When in doubt, descriptive custom tags (like `<roleDefinition>` instead of `<system>`) maintain most of the structural benefits while avoiding potential conflicts with system-specific reserved tags.

For maximum compatibility across different AI systems, markdown formatting tends to be more universally supported than XML-style tags.

______________________________________________________________________

# "Officially Unofficial" LLM Behaviors and Hidden Mechanisms

You've touched on a fascinating area that prompt engineers discover through experience rather than documentation. Here are more "officially unofficial" behaviors you should know about:

## Hidden Processing Mechanisms

1. **Token Repetition Penalties**: Claude and other LLMs often apply hidden penalties to repeated tokens/phrases, which can affect output when you want deliberate repetition.

1. **First/Last Token Emphasis**: The first and last portions of prompts often receive disproportionate attention/weight in processing - a phenomenon sometimes called "primacy and recency bias."

1. **Hidden Delimiter Processing**: Sequences like "###", "---", or "===" may trigger special processing or attention mechanisms beyond just being text.

1. **Invisible Formatting Normalization**: Multiple spaces, tabs, and certain whitespace characters often get normalized internally without indication.

## Undocumented Tag Behaviors

5. **`<answer>` Tags**: Some users report this tag sometimes triggers more direct, concise responses.

1. **`<reasoning>` Tags**: May encourage more step-by-step thinking in some contexts.

1. **`<important>` or `<critical>` Tags**: While not officially special, these sometimes appear to receive heightened attention.

1. **Triple Quotes (`"""`)**: Often used as delimiters, these can sometimes trigger special processing similar to code blocks.

## Structural Patterns

9. **Numbered Lists Effect**: Prompts with numbered instructions often receive more methodical, sequential responses than the same content without numbering.

1. **"Let's think step by step"**: This phrase has become almost magical in prompt engineering for triggering more careful reasoning.

1. **Hidden Template Matching**: LLMs may recognize common document formats (like academic papers, legal contracts) and apply special processing.

1. **Capitalization Sensitivity**: ALL CAPS or Title Case for certain instructions can sometimes trigger stronger adherence to those specific instructions.

## Output Control Mechanisms

13. **Temperature Hints**: Phrases like "be creative" or "be precise" may internally adjust the effective temperature of responses.

01. **Length Calibration**: Terms like "concise," "brief," "detailed," or "comprehensive" may trigger internal calibration beyond their semantic meaning.

01. **Format Triggers**: Phrases like "in JSON format" or "as a markdown table" may activate special formatting mechanisms beyond just understanding the request semantically.

These behaviors aren't typically documented in official materials but have been observed consistently enough by the prompt engineering community to be considered reliable patterns. The challenge is that they can vary between model versions and may change with updates.

User: so please rewrite your earlier statement about how effective it would be to change <system> to or change <system> to <startingPrompt> and so on
