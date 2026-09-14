---
title: README
type: note
permalink: skogai/docs-merge-todo/technical/dev/claude/skogai-helpers/readme
---

# SkogAI Helpers Plugin

Development workflow helpers for the SkogAI ecosystem. This plugin streamlines common development tasks including knowledge syncing, documentation maintenance, and session tracking.

## Overview

The SkogAI Helpers plugin provides specialized tools for managing knowledge and documentation in AI-assisted development workflows. It's designed to help maintain consistency, capture learnings, and keep documentation systems healthy over time.

## Installation

Install the plugin locally using Claude Code:

```bash
/plugin install ./skogai-helpers
```

After installation, restart Claude Code to load the plugin.

## Components

### Slash Commands

#### `/skogai-helpers:sync-knowledge`

Extracts learnings and knowledge gained during a Claude Code session and syncs them to a central knowledge base.

**Use when**:

- You've solved a complex problem and want to preserve the solution
- You've made architectural decisions that should be documented
- You've discovered patterns or insights worth capturing
- A session has generated valuable knowledge for future reference

**Example**:

```
/skogai-helpers:sync-knowledge
```

The command will:

1. Analyze the current session for learnings and insights
1. Structure knowledge with proper categorization and metadata
1. Determine appropriate storage locations in the knowledge base
1. Create or update documentation files
1. Add cross-references to related concepts
1. Provide a summary of captured knowledge

### Agents

#### Librarian Agent

A specialized agent for autonomous documentation maintenance.

**Use when**:

- Documentation needs consistency improvements
- Knowledge graph density is too sparse (entities with \<3 relations)
- WikiLinks are broken or need validation
- Frontmatter needs standardization
- Documentation discoverability needs improvement

**Example**:

```
Can you launch the librarian agent to improve knowledge graph density
for the SkogAI agent documentation?
```

The agent follows a **Search → Extract → Structure** workflow:

- **Search**: Finds relevant files and maps relationships
- **Extract**: Analyzes patterns and identifies improvements
- **Structure**: Applies improvements systematically and reports results

### Hooks

#### remember-skills Hook

Logs user prompts to track learning patterns and skill development over time.

**Behavior**:

- Triggers on every user prompt submission
- Logs prompts with timestamps to `~/.skogai/session.log`
- Non-blocking (never prevents actions)
- Helps identify patterns in what you're learning

**Log format**:

```
[2025-01-15T10:30:45-08:00] User prompt text here
```

**Privacy note**: Logs are stored locally only. Review `~/.skogai/session.log` before sharing.

### Skills

#### knowledge-management Skill

Provides specialized expertise in documentation systems and CLAUDE.md structure.

**Use when**:

- Creating or restructuring CLAUDE.md files
- Organizing information across project documentation
- Designing documentation architecture for new projects
- Establishing cross-referencing conventions
- Structuring knowledge for maximum discoverability

**Example**:

```
I need help structuring the CLAUDE.md file for my new project.
Can you use the knowledge-management skill?
```

The skill provides:

- CLAUDE.md structure best practices
- Cross-referencing systems (WikiLinks, @ paths, memory:// URIs)
- Information architecture principles
- Documentation as infrastructure patterns
- Quality standards and anti-patterns to avoid

## Workflows

### Capturing Session Learnings

1. Work on your development tasks normally
1. When you've gained valuable insights, run: `/skogai-helpers:sync-knowledge`
1. Review the extracted knowledge and confirm storage locations
1. Knowledge is automatically structured and linked to related concepts

### Maintaining Documentation Health

1. Launch the librarian agent with a specific task
1. Agent searches for improvement opportunities
1. Agent extracts patterns and issues
1. Agent structures improvements systematically
1. Receive a report of changes and recommendations

### Tracking Learning Patterns

1. The remember-skills hook runs automatically on each prompt
1. Periodically review `~/.skogai/session.log`
1. Identify patterns in your questions and learning areas
1. Use insights to guide knowledge base improvements

## Requirements

- Claude Code CLI
- SkogAI documentation structure (for full functionality)
- Basic Memory integration (optional, enhances knowledge graph features)

## Configuration

### Hook Configuration

The remember-skills hook can be customized by editing `hooks/remember-skills.json`:

```json
{
  "command": "mkdir -p ~/.skogai && echo \"[$(date -Iseconds)] $CLAUDE_USER_PROMPT\" >> ~/.skogai/session.log",
  "blocking": false,
  "enabled": true
}
```

Modify the command to change log location or format.

### Skill Invocation

The knowledge-management skill is invoked automatically when relevant, or manually:

```
Use the knowledge-management skill to help me structure this documentation.
```

## Best Practices

1. **Run sync-knowledge regularly**: Don't wait until the end of a long session. Capture knowledge while context is fresh.

1. **Use the librarian agent proactively**: Schedule regular documentation maintenance passes to prevent documentation debt.

1. **Review session logs periodically**: Use the remember-skills logs to identify learning patterns and knowledge gaps.

1. **Invoke skills explicitly when needed**: While skills activate automatically, explicitly invoking them ensures focused expertise.

1. **Maintain bidirectional links**: When adding cross-references, consider adding reciprocal links from target entities.

## File Structure

```
skogai-helpers/
├── .claude-plugin/
│   └── plugin.json              # Plugin manifest
├── commands/
│   └── sync-knowledge.md        # Knowledge syncing command
├── agents/
│   └── librarian.md             # Documentation maintenance agent
├── hooks/
│   └── remember-skills.json     # Prompt logging hook
├── skills/
│   └── knowledge-management.md  # Documentation expertise skill
├── CODEOWNERS                   # Maintainer information
└── README.md                    # This file
```

## Troubleshooting

### Sync-knowledge isn't finding the right storage location

The command searches `docs/memory/` for appropriate categories. If your knowledge base has a different structure, you may need to adjust paths in the command or create the expected directory structure.

### Librarian agent is making unexpected changes

The librarian follows a systematic workflow. Review the agent's report to understand changes. If the agent's interpretation is incorrect, provide more specific task instructions.

### Session logs are growing large

Session logs in `~/.skogai/session.log` grow over time. Consider:

- Archiving old logs periodically
- Adjusting the hook to rotate logs
- Using log analysis tools to extract insights

### Hook isn't triggering

Check that:

- The plugin is installed correctly (`/plugin list`)
- Claude Code has been restarted after installation
- The hook is enabled in `hooks/remember-skills.json`

## Contributing

This plugin is maintained by:

- @claude-market - Claude Market organization
- @skogix - Plugin author

Issues, suggestions, and contributions are welcome through the standard review process.

## License

GPL-3.0

See LICENSE file for details.

## Version History

### 0.0.1 (Initial Release)

- Added sync-knowledge slash command for capturing session learnings
- Added librarian agent for documentation maintenance
- Added remember-skills hook for session tracking
- Added knowledge-management skill for documentation expertise
- Initial documentation and setup

## Further Reading

- [SkogAI Documentation](../../) - Learn about the broader SkogAI ecosystem
- [Basic Memory Integration](../../llm/README.md) - Semantic knowledge graph system
- [Documentation Guidelines](../../meta/skogai-memory-guidelines-and-standards.md) - Standards for knowledge base content

______________________________________________________________________

**Built for the SkogAI ecosystem** - Where documentation is infrastructure, and knowledge compounds over time.
