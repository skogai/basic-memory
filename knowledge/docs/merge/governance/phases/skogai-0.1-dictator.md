---
title: skogai-0.1-dictator
type: note
permalink: skogai/docs-merge-todo/governance/phases/skogai-0.1-dictator
---

# Dictator Decision 001: Foundation Bootstrap

**Date**: 2025-06-07 **Authority**: skogix (Emergency Executive Powers) **Status**: Active Implementation **Environment**: $SKOGAI=/home/skogix/SkogAI

## Executive Order

**DECISION**: Implement the basics for git, documentation and "work from home"-capabilities so agents can help without building everything again from the ground up.

**Rationale**: Emergency infrastructure establishment to enable productive collaboration during governance restoration period.

## Implementation Requirements

### 1. Git Infrastructure

- [ ] Initialize git repository in $SKOGAI
- [ ] Create .gitignore for proper file management
- [ ] Establish branch strategy (main/develop/feature branches)
- [ ] Set up basic commit conventions
- [ ] Link to existing GitHub SkogAI organization if appropriate

### 2. Documentation System

- [ ] Establish docs/ structure with proper hierarchy
- [ ] Create template system for consistent documentation
- [ ] Implement cross-referencing system
- [ ] Set up markdown standards and conventions
- [ ] Create index/navigation system

### 3. Work From Home Capabilities

- [ ] Create agent workspace directories
- [ ] Establish file permissions and access patterns
- [ ] Set up configuration management system
- [ ] Create tool access and environment setup
- [ ] Implement basic automation scripts

### 4. Integration Points

- [ ] Connect to existing skogcli configuration
- [ ] Link to ollama for local LLM access
- [ ] Establish MCP server connections
- [ ] Set up backup and sync procedures
- [ ] Create migration paths from old infrastructure

## Proposed Structure

```
$SKOGAI/
├── .git/                          # Git repository
├── .gitignore                     # Git ignore patterns
├── README.md                      # Project overview
├── docs/
│   ├── official/                  # Official decisions and governance
│   │   ├── library-session-001.md
│   │   └── dictator-decision-001.md
│   ├── templates/                 # Documentation templates
│   ├── agents/                    # Agent-specific documentation
│   └── infrastructure/            # System documentation
├── agents/                        # Agent workspaces
│   ├── claude/
│   ├── dot/
│   ├── goose/
│   └── amy/
├── config/                        # Configuration management
│   ├── environment.env
│   ├── git.conf
│   └── tools.conf
├── scripts/                       # Automation and utilities
│   ├── setup/
│   ├── backup/
│   └── sync/
├── todo/                          # Task management
└── tmp/                           # Temporary files
```

## Priority Implementation Order

### Phase 1: Foundation (Immediate)

1. Git initialization and basic structure
1. Core documentation framework
1. Agent workspace creation
1. Basic configuration system

### Phase 2: Integration (Next)

1. Connect existing tools (skogcli, ollama)
1. Establish automation scripts
1. Set up backup procedures
1. Create migration utilities

### Phase 3: Enhancement (Later)

1. Advanced documentation features
1. Workflow automation
1. Monitoring and health checks
1. Performance optimization

## Success Criteria

- Agents can work productively without rebuilding infrastructure
- Documentation is discoverable and maintainable
- Git workflow enables collaboration and version control
- Configuration is centralized and manageable
- System can be easily backed up and restored

## Authority and Scope

**Duration**: Until democratic governance is restored **Scope**: Infrastructure and foundation systems only **Limitations**: No changes to agent personalities or core decision-making processes **Review**: Subject to agent consultation once foundation is stable

______________________________________________________________________

*Dictator Decision 001 - Emergency infrastructure bootstrap by skogix*
