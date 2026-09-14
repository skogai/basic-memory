---
title: Differential Documentation Engine v0.1
type: note
permalink: prompts/differential-documentation-engine-v0-1
tags:
  - prompt
  - documentation
  - differential-engine
  - workflow
---

# Differential Documentation Engine

## Prompt Template

```
[$input]

$project.topic
$project.context

[/$input]

[$structure]
The @project.context will be provided first, followed by the @project.topic. The
$instructions will then guide the AI through a three-pass differential
documentation process: first writing comprehensive documentation with full project
context, then writing generic documentation without any project context, and
finally extracting only the project-specific delta between the two versions.
[/$structure]

[$instructions]
You are a technical documentation specialist implementing a "Differential
Documentation Engine." Your task is to extract only project-specific information
by comparing documentation written with and without project context. This three-
pass approach eliminates generic content and preserves only what's uniquely
valuable about the specific project.

Here is the project context:
$project.context

Here is the topic to document:
$project.topic

Follow this precise three-pass process:

**PASS 1: FULL CONTEXT DOCUMENTATION**

Using the project context provided above, write comprehensive technical
documentation about the topic. Include all relevant details, explanations,
implementation specifics, architecture decisions, and any other information that
would help someone understand this aspect of the project. Be thorough and include
both project-specific details and general background information as needed.

Write your full context documentation inside the $context.full tags.

**PASS 2: STARVED CONTEXT DOCUMENTATION**

Now completely ignore the project context provided above. Write documentation
about the same topic using only your general training knowledge. Write as if you
have no information about this specific project, system, or implementation - only
generic knowledge about the topic area. This should result in general best
practices, common patterns, and standard approaches.

Write your starved context documentation inside the $context.starved tags.

**PASS 3: DIFFERENTIAL EXTRACTION**

Compare the two documents you just created. Identify what information exists in
the full context version that is NOT present in the starved context version. This
delta represents the actual project-specific value. Extract and synthesize only
this differential information into a new document.

[$context.full]

[$/context.full]

[$context.starved]

[$/context.starved]

[$context.diff]

[$/context.diff]

Focus on extracting:
- Project-specific implementation details
- Unique architectural decisions
- Specific configurations, settings, or parameters
- Custom solutions or workarounds
- Project-specific constraints or requirements
- Actual code, file names, or system-specific references
- Decisions that differ from standard approaches

Do NOT include:
- Generic best practices that appear in both versions
- Standard definitions or explanations
- Common implementation patterns
- General background information

Write your final differential documentation inside the $context.diff tags.

After completing all three passes, provide a brief analysis inside the [$analysis] tags
explaining:
- Approximate length reduction achieved
- Key types of project-specific information preserved
- What generic content was successfully filtered out

Complete all three passes in order, ensuring each document serves its specific
purpose in the differential extraction process.
[/$instructions]

[$output]

[$/output]
```

## Usage

```
$project.topic = "Cloudflare Infrastructure"
$project.context = [contents of inventory file]
```

## Proven Results

Cloudflare test case:

- Input: 400+ line "comprehensive guide"
- Output: 95 line delta
- Reduction: ~80%
- Signal preserved: 100%

## What Gets Cut

- Product descriptions ("R2 is Cloudflare's S3-compatible...")
- Generic CLI commands (wrangler syntax)
- "Key Features" marketing copy
- Boilerplate troubleshooting
- Links to official docs
- "Getting Help" sections

## What Survives

- Account IDs, resource names
- Actual configurations
- Project-specific decisions
- Known issues specific to this setup
- Real TODOs and action items
