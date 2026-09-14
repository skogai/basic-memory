---
title: sync-knowledge
type: note
permalink: skogai/docs-merge-todo/technical/dev/claude/skogai-helpers/commands/sync-knowledge
---

# Sync Knowledge Command

This command extracts learnings and knowledge gained during a Claude Code session and syncs them to a central knowledge base.

## Purpose

Capture insights, decisions, solutions, and patterns discovered during development work and structure them into the SkogAI knowledge base for future reference and cross-project learning.

## Workflow

### Step 1: Analyze Current Session Context

First, understand what knowledge was gained in this session:

1. Review the conversation history to identify:

   - Problems solved and solutions implemented
   - Architectural decisions made
   - Patterns discovered or applied
   - Bugs fixed and their root causes
   - New techniques or tools learned
   - Insights about the codebase structure

1. Look for knowledge markers:

   - User statements like "I learned that...", "We discovered...", "The issue was..."
   - Successful problem resolutions
   - Design decisions with rationale
   - Performance improvements and their causes
   - Integration patterns that worked well

### Step 2: Extract Structured Knowledge

For each learning or insight identified:

1. **Categorize the knowledge**:

   - `[architecture]` - System design and structure decisions
   - `[pattern]` - Reusable code or design patterns
   - `[solution]` - Specific problem solutions
   - `[integration]` - How components/systems work together
   - `[performance]` - Optimization techniques and outcomes
   - `[debugging]` - Bug causes and resolution approaches
   - `[tooling]` - Development tool usage and configuration
   - `[workflow]` - Development process improvements

1. **Extract key components**:

   - **Context**: What was the situation or problem?
   - **Insight**: What was learned or discovered?
   - **Implementation**: How was it implemented (if applicable)?
   - **Outcome**: What was the result or benefit?
   - **Related concepts**: What other knowledge does this connect to?

### Step 3: Determine Storage Location

Decide where in the knowledge base this belongs:

- `docs/memory/architecture/` - System design and architectural patterns
- `docs/memory/patterns/` - Reusable implementation patterns
- `docs/memory/planning/improvements/` - Lessons learned and improvements
- `docs/memory/projects/<project-name>/` - Project-specific learnings
- `docs/memory/llm/` - AI Assistant usage patterns and techniques

Use the Glob tool to check existing structure:

```
pattern: "docs/memory/**/*.md"
```

### Step 4: Check for Existing Related Knowledge

Before creating new files, search for existing content:

1. Use Grep to search for related keywords:

   ```
   pattern: "<key_concept_or_term>"
   path: "docs/memory/"
   output_mode: "files_with_matches"
   ```

1. Read potentially related files to avoid duplication

1. Decide whether to:

   - Add to existing document (if closely related)
   - Create new document (if sufficiently distinct)
   - Add cross-references between related documents

### Step 5: Structure the Knowledge Entry

Format the knowledge using SkogAI documentation standards:

```markdown
---
title: <Descriptive Title>
type: <knowledge-type>
permalink: memory://<category>/<identifier>
tags: [tag1, tag2, tag3]
---

# <Title>

## Context

<What situation or problem prompted this knowledge?>

## Description

<The main learning, pattern, or insight>

## Implementation

<How this was implemented or applied, with code examples if relevant>

## Outcomes

<Results, benefits, or observations from applying this knowledge>

## Related Concepts

- [[Related Entity 1]] - <relationship description>
- [[Related Entity 2]] - <relationship description>

## Observations

[category] <Key observation or insight> #tag1 #tag2
[category] <Another observation>

## Tags

#relevant #tags #here
```

### Step 6: Write or Update Knowledge Files

1. If creating a new file:

   - Use Write tool with the structured content
   - Place in the appropriate directory
   - Use kebab-case filenames

1. If updating an existing file:

   - Use Read tool to get current content
   - Use Edit tool to add new section or observations
   - Preserve existing structure and metadata

### Step 7: Update Cross-References

1. Identify related documents that should link to this knowledge

1. Use Edit tool to add WikiLinks like:

   ```markdown
   See also: [[New Knowledge Entity]] for <relationship>
   ```

1. Update project CLAUDE.md if relevant:

   - Add reference in the appropriate section
   - Use @ prefix for linking: `@docs/memory/path/to/file.md`

### Step 8: Create Summary

Provide the user with:

- List of knowledge entities created or updated
- Paths to the modified files
- Key insights captured
- Suggested next steps (if any)

## Tools to Use

- **Read**: Review conversation context, existing files
- **Write**: Create new knowledge documents
- **Edit**: Update existing documents with new insights
- **Grep**: Search for related knowledge and avoid duplication
- **Glob**: Explore knowledge base structure
- **Memory tools (mcp\_\_skogai-memory\_\_\*)**: Query semantic knowledge graph (if available)

## Best Practices

1. **Be specific**: Vague knowledge is not useful. Include concrete details, code examples, and context.

1. **Create connections**: Always link to related concepts. Knowledge gains value through relationships.

1. **Use proper categorization**: Correct observations categories and tags improve discoverability.

1. **Avoid duplication**: Check existing knowledge before creating new files.

1. **Maintain quality**: Better to have fewer high-quality entries than many superficial ones.

1. **Include rationale**: Explain *why* decisions were made, not just *what* was done.

1. **Think cross-project**: Consider how this knowledge applies beyond the current project.

## Example Session Analysis

**Scenario**: Fixed a bug where memory tool searches weren't finding recent documents.

**Extracted Knowledge**:

- **Category**: `[debugging]`, `[tooling]`
- **Context**: Memory searches failing for newly added documents
- **Insight**: Memory index needs manual refresh after bulk document additions
- **Solution**: Added workflow to rebuild index after documentation updates
- **Storage**: `docs/memory/llm/basic-memory-troubleshooting.md`
- **Related**: `[[Basic Memory Integration]]`, `[[Knowledge Base Maintenance]]`

## Edge Cases

- **No significant knowledge**: If the session was routine work without insights, inform the user that there's no substantial knowledge to sync.

- **Sensitive information**: Never include credentials, API keys, or private user data in knowledge base.

- **Incomplete understanding**: If you're unsure about the significance of knowledge, ask the user before writing.

- **Knowledge base structure missing**: If the expected directories don't exist, ask the user before creating new structure.

## Success Criteria

- Knowledge is accurately captured with sufficient detail
- Proper categorization and tagging for discoverability
- Cross-references maintain knowledge graph connectivity
- Files follow SkogAI documentation standards
- User can easily find and apply this knowledge in future sessions
