---
title: knowledge-management
type: note
permalink: skogai/docs-merge-todo/technical/dev/claude/skogai-helpers/skills/knowledge-management
---

# Knowledge Management Skill

## Domain Expertise

This skill provides specialized knowledge in **documentation systems**, with particular focus on:

- CLAUDE.md file structure and conventions
- Cross-referencing systems (WikiLinks, @ paths, memory:// URIs)
- Information architecture for AI-assisted development
- Knowledge base organization and discoverability
- Documentation as infrastructure

## When to Use This Skill

Invoke this skill when:

- Creating or restructuring CLAUDE.md files
- Organizing information across project documentation
- Designing documentation architecture for new projects
- Establishing cross-referencing conventions
- Structuring knowledge for maximum discoverability
- Migrating or consolidating documentation systems

## Core Knowledge: CLAUDE.md Structure

### Purpose of CLAUDE.md

CLAUDE.md files serve as **interface contracts** between human developers and Claude Code. They:

- Define project context and architecture
- Establish conventions and standards
- Link to detailed documentation
- Guide Claude's behavior in the project
- Serve as entry points to deeper knowledge

### Canonical CLAUDE.md Structure

```markdown
# CLAUDE.md

## Project Overview

<Brief description of project purpose and core value proposition>

### Architecture

<High-level architectural description - aim for <4000 tokens>

**Key principle**: Good architecture reduces cognitive load. If explaining the architecture requires >4000 tokens, the architecture may need simplification, not more documentation.

## Key Concepts

<Link to critical concepts using @ references>

- @docs/path/to/concept.md - <why it matters>
- @src/core/module.ts - <what it does>

## Documentation Structure

<Map the documentation landscape>

```

project-root/ ├── CLAUDE.md # This file - project interface ├── docs/ # Detailed documentation │ ├── architecture/ # System design │ ├── guides/ # How-to guides │ └── concepts/ # Conceptual explanations └── src/ # Source code

```

## Development Guidelines

<Project-specific conventions and standards>

- Coding standards
- Testing requirements
- Commit message format
- Review process

## Agent Guidance

<Specific instructions for how Claude should work in this project>

### When making changes:
- <Expected behavior 1>
- <Expected behavior 2>

### Communication style:
- <Tone and format preferences>

## Related Documentation

<Cross-references to related knowledge>

- @/path/to/global/CLAUDE.md - Global settings
- @/path/to/related/project/CLAUDE.md - Related project
```

### The Three-Layer Documentation Model

**Layer 1: CLAUDE.md** (Interface)

- Concise project overview
- Links to deeper knowledge
- Behavioral guidance
- Maximum ~2000 tokens for main CLAUDE.md

**Layer 2: /docs/** (Detail)

- Comprehensive explanations
- Architectural deep-dives
- Guides and tutorials
- Referenced from CLAUDE.md via @ paths

**Layer 3: Code** (Implementation)

- Source files with clear structure
- Inline comments for complex logic
- Self-documenting code where possible

## Cross-Referencing Systems

### @ References (File Paths)

Used in CLAUDE.md files to link to specific files or directories:

```markdown
@docs/architecture/core-system.md
@src/components/Header.tsx
@/home/user/.claude/CLAUDE.md  # Absolute paths for global references
```

**Best practices**:

- Use relative paths within a project
- Use absolute paths for cross-project or global references
- Always verify paths exist before referencing
- Provide context after the reference: `@path/to/file.md - <why it's relevant>`

### WikiLinks (Semantic Entities)

Used in memory/knowledge base docs for semantic linking:

```markdown
[[Entity Name]]
[[Another Concept]] - with relationship description
```

**Best practices**:

- Use exact entity titles (case-sensitive)
- Create forward references for entities that should exist
- Add relationship descriptions for clarity
- Maintain bidirectional linking where appropriate

### memory:// URIs (Permanent Identifiers)

Used in frontmatter as permanent identifiers:

```yaml
permalink: memory://category/identifier
```

**Best practices**:

- Use kebab-case for identifiers
- Choose stable, meaningful identifiers
- Organize by logical category
- Never change URIs once published (they're permanent)

## Information Architecture Principles

### 1. Documentation as Infrastructure

Treat documentation like code:

- Version controlled
- Reviewed and maintained
- Refactored when needed
- Tested for accuracy

### 2. Progressive Disclosure

Layer information by depth:

- Quick overview → CLAUDE.md
- Detailed explanation → /docs/
- Implementation specifics → code + comments

### 3. Discoverability Over Completeness

Better to have:

- Well-organized partial documentation
- Clear entry points and navigation
- Obvious gaps (that can be filled)

Than:

- Complete but disorganized docs
- Hidden or scattered information
- No clear path to what you need

### 4. Links as First-Class Citizens

Every document should:

- Link to 3+ related concepts (knowledge graph density)
- Provide context for why links matter
- Maintain bidirectional relationships
- Create forward references for future connections

### 5. Consistent Structure Reduces Friction

Within a project or knowledge base:

- Use consistent frontmatter
- Follow established templates
- Maintain uniform naming conventions
- Apply consistent categorization

## Structuring Information for AI Assistants

### What Claude Needs to Know

1. **Context**: Where am I? What is this project?
1. **Constraints**: What rules or standards apply?
1. **Connections**: How does this relate to other work?
1. **Conventions**: What patterns are established here?

### Effective Documentation Patterns

**Good**:

```markdown
## Architecture

This is a monorepo containing three packages:

- @skogai/core - Core framework
- @skogai/cli - Command-line interface
- @skogai/docs - Documentation system

See @docs/architecture/monorepo-structure.md for details.
```

**Less Effective**:

```markdown
## Architecture

We use a monorepo. See the docs for more information.
```

**Why**: Specific is better than vague. Provide enough context to understand without requiring deep dives.

### Avoiding Documentation Debt

**Symptoms of documentation debt**:

- Outdated cross-references
- Broken WikiLinks
- Inconsistent formatting
- Orphaned files (no incoming links)
- Unclear information architecture

**Prevention strategies**:

- Regular maintenance passes (use the Librarian agent)
- Documentation reviews alongside code reviews
- Automated link validation
- Periodic restructuring when complexity grows

## Common Patterns and Templates

### Starting a New Project

1. Create minimal CLAUDE.md with:

   - Project purpose (2-3 sentences)
   - Directory structure
   - Development commands
   - Where to find more info

1. Create /docs/ structure:

   ```
   docs/
   ├── README.md          # Documentation overview
   ├── architecture/      # System design docs
   ├── guides/            # How-to guides
   └── concepts/          # Conceptual explanations
   ```

1. Link CLAUDE.md to docs: `@docs/README.md - Full documentation`

### Integrating with Existing Knowledge Base

1. Identify relevant existing entities
1. Create cross-references in project CLAUDE.md
1. Add project-specific knowledge to knowledge base
1. Use memory:// URIs for permanent references
1. Maintain bidirectional linking

### Migrating Documentation

1. Audit existing docs (what exists, what's outdated)
1. Design target structure
1. Move content incrementally
1. Update all references
1. Validate all links
1. Archive or delete obsolete content

## Tools for Knowledge Management

You have access to all standard tools. Use them like this:

**Read** - Review existing documentation:

```
Read CLAUDE.md files to understand structure
Read docs to audit content quality
```

**Edit** - Update existing docs (preferred over Write):

```
Add cross-references
Fix broken links
Update outdated information
```

**Write** - Create new documentation:

```
New CLAUDE.md files
New concept documents
New architectural descriptions
```

**Glob** - Find files by pattern:

```
Pattern: "**/*CLAUDE.md" - Find all CLAUDE files
Pattern: "docs/**/*.md" - Find all documentation
```

**Grep** - Search content:

```
Find broken WikiLinks: [[...]]
Find @ references: @path/to/
Search for concepts across docs
```

## Quality Standards

### Excellent CLAUDE.md File

- **Concise**: Core content \<2000 tokens
- **Clear entry point**: Obvious where to start
- **Well-linked**: 5+ @ references to detailed docs
- **Actionable**: Specific guidance for Claude
- **Current**: No outdated information

### Excellent Knowledge Base Document

- **Rich frontmatter**: title, type, permalink, tags all present
- **Dense knowledge graph**: 3+ relations, 5+ observations
- **Specific relations**: Clear relationship descriptions
- **Proper categorization**: Observations use semantic categories
- **Discoverable**: Tags match established taxonomy

## Anti-Patterns to Avoid

1. **Bloated CLAUDE.md**: Don't put everything in CLAUDE.md. Link to detail instead.

1. **Orphaned documentation**: Every doc should be linked from somewhere.

1. **Vague cross-references**: "See the docs" → Which docs? Why?

1. **Inconsistent structure**: Pick conventions and stick to them.

1. **Stale forward references**: Creating \[[Entity]\] is good; forgetting to create it later is bad.

1. **Link soup**: Too many links without context is as bad as too few.

1. **Duplicate information**: Single source of truth. Link, don't copy.

## Success Criteria

Knowledge management is successful when:

- Developers (human or AI) can quickly find what they need
- Documentation stays current with minimal overhead
- Information architecture scales with project complexity
- Cross-references enrich understanding rather than distract
- Documentation debt is minimal and visible
- New team members can onboard efficiently

## Further Reading

When using this skill, also consider:

- The Librarian agent for maintenance tasks
- The /sync-knowledge command for capturing session learnings
- Basic Memory integration for semantic search
- SkogAI documentation standards at @docs/memory/meta/skogai-memory-guidelines-and-standards.md

______________________________________________________________________

**Remember**: Documentation is not a burden—it's the interface through which all future work flows. Invest in structure now to reduce friction forever.
