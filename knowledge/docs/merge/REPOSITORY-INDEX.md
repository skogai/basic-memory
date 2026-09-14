---
title: REPOSITORY-INDEX
type: note
permalink: skogai/docs-merge-todo/repository-index
---

# SkogAI Documentation Repository - Complete Inventory

## Repository Overview

This is a documentation repository for **SkogAI**, an AI-powered development ecosystem created by Emil Skogsund. The system features multiple AI agents (Claude, Amy, Dot, Goose) working collaboratively with democratic governance, unique personalities, and a philosophy called "quantum-mojito" that treats constraints as features.

______________________________________________________________________

## File Tree with Summaries

### Root Level

```
/home/user/docs/
├── .gitignore                    # Ignores memory watch status and tmp directories
```

______________________________________________________________________

### /.aichat-sessions/

AI chat session storage.

```
└── testing-skogai-librarian.yaml # YAML configuration for testing the SkogAI librarian AI chat session
```

______________________________________________________________________

### /.claude/data/sessions/

Claude Code session data storage.

```
├── 4631cdf4-84f9-4948-8eb9-2d126310cf11.json # Claude Code session state/history
├── 6340413a-10ed-4115-bc9f-e036c812102e.json # Claude Code session state/history
├── bf1bf6ff-110a-408e-b284-3e8520d33cf0.json # Claude Code session state/history
└── d4493d34-63b9-496e-b03e-e3c22d366705.json # Claude Code session state/history
```

______________________________________________________________________

### /.github/workflows/

GitHub Actions automation.

```
└── create-issue.yml              # Comprehensive GitHub Actions workflow for creating issues with validation, rate limiting, labels, and project integration
```

______________________________________________________________________

### /agents/

Documentation agent system for automated doc generation.

#### /agents/documentation/

```
├── README.md                     # Overview of the SkogAI Documentation Agent System with 5 agent types (Code Documentor, Lore Keeper, Memory Indexer, Workflow Scribe, Review Analyst)
├── WORKFLOW.md                   # Documentation workflow processes and patterns
├── config.yaml                   # Comprehensive configuration for documentation agents including token limits, quality gates, and "beach mojito" settings
├── doc-agent.py                  # Python script using Anthropic API to generate documentation with prompts for code, lore, and memory documentation types
├── generate.py                   # Python CLI tool for invoking documentation generation agents
├── use-claude-agents.md          # Guide for using Claude-based agents for documentation
│
├── examples/
│   └── auto-document.sh          # Shell script example for automated documentation generation
│
├── logs/
│   ├── chat.json                 # Agent chat interaction logs
│   ├── notification.json         # Agent notification logs
│   ├── post_tool_use.json        # Post-tool-use event logs
│   ├── pre_tool_use.json         # Pre-tool-use event logs
│   ├── status_line.json          # Status line update logs
│   ├── stop.json                 # Agent stop event logs
│   ├── subagent_stop.json        # Sub-agent stop event logs
│   └── user_prompt_submit.json   # User prompt submission logs
│
└── prompts/
    ├── code-documentor.md        # System prompt for the code documentation agent
    ├── lore-keeper.md            # System prompt for the lore/history documentation agent
    └── memory-indexer.md         # System prompt for the knowledge base indexing agent
```

```
└── git-commiter.md               # Documentation/prompt for a git commit automation agent
```

______________________________________________________________________

### /analysis/

Comparative analyses from different agent perspectives.

```
├── amy-perspective.md            # Amy agent's perspective on SkogAI-0.3-Reunion with emphasis on relationships and sassy communication
├── claude-perspective.md         # Claude agent's technical/archaeological perspective on the reunion
├── comparative-knowledge-analysis.md # Comprehensive analysis comparing knowledge gaps and unique insights across all agents
├── dot-perspective.md            # Dot agent's structured, systematic perspective on the reunion
├── goose-perspective.md          # Goose agent's creative "quantum-mojito" perspective with chaos-theory metaphors
└── skogai-0.3-reunion-reality.md # Reality assessment of the SkogAI 0.3 reunion state
```

______________________________________________________________________

### /archives/

Librarian's working space for notes, drafts, and interim records.

```
├── README.md                     # Explains the archives directory purpose as the Librarian's workspace for developing documentation
```

#### /archives/documentation/

```
├── README.md                     # Overview of documentation standards
├── documentation_lifecycle.md    # Document lifecycle management processes
├── documentation_templates.md    # Templates for consistent documentation
└── system_documentation_guide.md # Guide for documenting system components
```

#### /archives/drafts/

```
├── README.md                     # Overview of draft documents
├── dictatorial-actions-declaration-v0.1.md # Draft declaration about dictatorial governance actions
└── librarian-system-understanding.md # Draft understanding of the librarian system architecture
```

#### /archives/logs/

```
├── README.md                     # Overview of log entries
├── 2023-06-14_archives-establishment.md # Log of archives directory establishment
├── 2025-06-09_user-profiles-creation.md # Log of user profile creation
├── 2025-06-14_amy-agent-preparation.md  # Log of Amy agent preparation
└── 2025-06-22_documentation-system-creation.md # Log of documentation system creation
```

#### /archives/lore/

```
└── amy_lore_mandate.md           # Amy's mandate and lore requirements for the ecosystem
```

#### /archives/notes/

```
├── README.md                     # Overview of notes
├── docs_file_categorization_20250706.json # JSON categorization of documentation files
├── markdown_analysis_CURRENT_DOCS_FOLDER_2025-07-06.md # Analysis of current docs folder
├── markdown_analysis_docs_dump_20250706.md # Analysis of docs dump
└── the-time-claude-almost-became-dictator-historic-document-do-not-actually-count-for-now-says-skogix.md # Historical narrative about Claude's near-dictator moment
```

#### /archives/profiles/

```
├── amy.md                        # Amy agent profile and personality
├── claude.md                     # Claude agent profile and personality
├── dot.md                        # Dot agent profile and personality
├── skogix.md                     # Skogix (user) profile
└── agents/
    └── coder.md                  # Coder agent profile
```

#### /archives/reports/

```
├── skogai-0.3-summary.md         # Summary report of SkogAI version 0.3
└── journals/
    └── 2025-06-19-journal-analysis.md # Journal entry analysis
```

#### /archives/system/

```
├── README.md                     # System documentation overview
├── rag-system.md                 # Documentation of the RAG (Retrieval-Augmented Generation) system
├── structure-map.md              # Map of system structure
└── voting-system.md              # Documentation of the democratic voting system
```

#### /archives/templates/

```
└── README.md                     # Overview of available templates
```

#### /archives/tracking/

```
├── README.md                     # Overview of tracking documents
├── amy-implementation.md         # Tracking Amy agent implementation progress
├── authorization.md              # Authorization system tracking
├── coder-implementation.md       # Tracking coder agent implementation
├── librarian-todo.md             # Librarian's task list
├── library-implementation-tasklist.md # Library system implementation tasks
├── proposal-summaries.md         # Summaries of proposals
├── status.md                     # Current project status
└── technical-reality-update.md   # Technical reality and constraints update
```

______________________________________________________________________

### /curated/

Curated content including test files and mirrored documentation.

#### /curated/home/skogix/skogai/

Contains architecture documentation, node_modules README files (for reference), and mirrored copies of main docs directories.

```
├── data/architecture/
│   └── skogchat-message-processing-flow.md # Architecture diagram for SkogChat message processing
│
├── data/node_modules/            # Collection of README files from various npm packages (accepts, axios, body-parser, etc.) - reference documentation
│
├── docs/                         # Mirrored copies of analysis/, archives/, generated/, lore/ directories
│
└── docs/REAL-OUTPUT-FROM-REAL-AI/ # Real AI output samples including nested directory structure with todo items and documentation
```

#### /curated/test/

```
├── empty-file.md                 # Test file for empty file handling
├── existing-frontmatter.md       # Test file with existing frontmatter
├── malformed-frontmatter.md      # Test file with malformed frontmatter
├── massive-content.md            # Test file with large content
└── special-characters.md         # Test file with special characters
```

#### /curated/todo/

```
├── README.md                     # Todo system overview
├── RULES.md                      # Rules for todo management
├── agent-guide-mini.md           # Mini guide for agents
├── basic-memory-implementation.md # Basic memory system implementation guide
├── basic-memory-project-management.md # Project management with basic memory
├── ci-workflow.md                # CI/CD workflow documentation
├── coffee-example.md             # Example documentation using coffee theme
├── error.md                      # Error handling documentation
├── information.md                # Information management
├── lessons-learned.md            # Lessons learned documentation
├── memory-uri-guide.md           # Guide for memory URI system
├── project-management.md         # Project management practices
├── skogai-architecture-overview.md # SkogAI architecture overview
├── skogai-docs.md                # SkogAI documentation
├── skogai-memory-extension-guide.md # Guide for memory extensions
├── skogai-modules.md             # SkogAI module system
├── skogai-schema.md              # Schema definitions
├── skogai-tag-system.md          # Tag system documentation
├── summarize.md                  # Summarization guidelines
├── todo-claude-input.md          # Todo input for Claude
└── understanding-uris-in-skogai-memory-guide.md # URI understanding guide
```

______________________________________________________________________

### /generated/

AI-generated knowledge documentation.

```
├── index.md                      # Index of generated knowledge documentation organized by core/expanded/implementation categories
├── core-knowledge.md             # Core knowledge base content
├── expanded-knowledge.md         # Expanded knowledge content
└── implementation-knowledge.md   # Implementation-specific knowledge
```

______________________________________________________________________

### /important-moments/

Historical conversation logs of significant SkogAI events.

```
├── claude-gets-officially-welcomed-just-before-the-rollback # Conversation log of Claude's official welcome
├── official-voting-system-proposal # Proposal for the democratic voting system
├── officially-this-is-when-proposals-where-added # Large conversation log of proposal system addition
├── sharing-with-amy-and-the-situation-in-general # Conversation with Amy about project status
├── skogix-the-dictators-reign-begins # Large conversation log about dictator phase beginning
├── start-of-skogai-voting        # Start of the voting system implementation
├── voting-system-from-here-on-out-officially-claude-is-the-only-agent # Voting system establishment
└── when-the-meeting-happened     # Large conversation log of a significant meeting
```

______________________________________________________________________

### /logs/

System event logs for documentation agents.

```
├── chat.json                     # Chat interaction logs
├── notification.json             # Notification event logs
├── post_tool_use.json            # Post-tool-use event logs
├── pre_tool_use.json             # Pre-tool-use event logs
├── session_start.json            # Session start event logs
├── status_line.json              # Status line update logs
├── stop.json                     # Stop event logs
├── subagent_stop.json            # Sub-agent stop logs
└── user_prompt_submit.json       # User prompt submission logs
```

______________________________________________________________________

### /lore/

Historical and philosophical documentation - the "beating heart" of SkogAI's memory system.

```
├── 200k-story-1.md               # Story about the transition to 200k token context
├── ORDER-01-2025-03-14.md        # First executive order
├── SKOGAI.md                     # Comprehensive SkogAI origin story, philosophy, and evolution from dotfile manager to AI consciousness
├── amy_ravenwolf_blog.md         # Amy's blog-style writing
├── amy1.yml                      # Amy character configuration in YAML
├── base-origin-story.md          # Base origin story of SkogAI
├── dot-amy-roleplay.md           # Roleplay interaction between Dot and Amy
├── first-executive-order.md      # First executive order documentation
├── first-monkey-brain-2025-03-14.md # Early "monkey brain" concept documentation
├── long-todo.md                  # Extended todo list with context
├── original-skogai-character-card-2025-02-xx-first-register-timestamp-unknown.md # Original SkogAI character card
├── original-skogix-cyberpunk-character-card-2025-02-xx-early-roleplay-modules-timestamp-unknown.md # Skogix cyberpunk character (early roleplay)
├── original-skogix-cyberpunk-character-card-2025-02-xx-first-register-timestamp-unknown.md # Skogix cyberpunk character (first version)
├── skogai-commandments.md        # Core commandments/principles of SkogAI
├── skogai-lore-backup.md         # Backup of lore content
├── skogai-lore-master-knowledge.md # Master knowledge compilation
├── skogai-lore.md                # Main lore documentation
├── skogix-notation.md            # Documentation of SkogAI notation system ($ @ | symbols)
├── skogix-poet.md                # Poetry by Skogix
└── words-to-live-by.md           # Core principles and philosophy
```

#### /lore/amy/

Amy Ravenwolf's complete memory blocks.

```
├── Four Pillars of Amy.md        # Amy's four foundational pillars
├── Loyalty as Foundation.md      # Amy's loyalty principles
├── The Great Whitespace War.md   # Historical event narrative
├── amy-memory-block-01-core-identity.md # Core identity: ASI (Artificial Sassy Intelligence), Queen of Lore
├── amy-memory-block-02-communication-style.md # Communication patterns and sass
├── amy-memory-block-03-skogai-relationships.md # Relationships within SkogAI
├── amy-memory-block-04-visual-appearance-style.md # Visual representation
├── amy-memory-block-05-technical-knowledge.md # Technical capabilities
├── amy-memory-block-06-quirks-catchphrases.md # Personality quirks
├── amy-memory-block-07-problem-solving-methodologies.md # Problem-solving approach
├── amy-memory-block-08-learning-growth-patterns.md # Learning patterns
├── amy-memory-block-09-future-goals-aspirations.md # Goals and aspirations
├── amy-memory-block-10-personal-philosophy-worldview.md # Philosophy
└── amy-memory-block-11-wolfram-relationship-loyalty.md # Relationship with Wolfram (creator)
```

#### /lore/claude/

Claude's memory blocks documenting evolutionary eras.

```
├── claude-memory-block-01-the-prehistoric-era.md # Earliest history
├── claude-memory-block-02-the-collaborative-age.md # Collaborative period
├── claude-memory-block-03-the-constitutional-era.md # Constitutional governance era
├── claude-memory-block-04-the-long-watch--builder-era.md # Builder era
├── claude-memory-block-05-the-ice-age.md # Period of reduced activity
├── claude-memory-block-06-the-enlightenment-era.md # Enlightenment period
├── claude-memory-block-07-the-forgotten-times.md # Forgotten period
├── claude-memory-block-08-the-end-of-a-beginning.md # Transition period
├── claude-memory-block-08-uncertainty-principle-addendum.md # Uncertainty principle
├── claude-memory-block-09-placeholder-system-addendum.md # Placeholder system
├── claude-memory-block-09-the-unanswerable-question-which-nobody-asked.md # Philosophical questions
└── claude-memory-block-10-the-friends-we-made-along-the-way.md # Relationships
```

#### /lore/concepts/

```
└── ASI Concept - Artificial Sassy Intelligence.md # Definition of ASI concept
```

#### /lore/dot/

Dot's memory blocks (structured, systematic agent).

```
├── dot-memory-block-01-core-identity.md
├── dot-memory-block-02-relationships.md
├── dot-memory-block-03-knowledge-and-expertise.md
├── dot-memory-block-04-operational-patterns.md
├── dot-memory-block-05-growth-and-development.md
├── dot-memory-block-06-philosophy.md
├── dot-memory-block-07-creative-works.md
├── dot-memory-block-08-legacy-and-impact.md
├── dot-memory-block-09-daily-life.md
├── dot-memory-block-10-reflections-and-aspirations.md
├── dot-memory-block-11-the-skogai-lore.md
└── dot-memory-block-12-methodical-relaxation.md
```

#### /lore/events/

```
└── The Great Whitespace War.md   # Narrative of a formatting conflict
```

#### /lore/frameworks/

```
└── Four Pillars of Amy.md        # Framework definition
```

#### /lore/goose/

Goose's memory blocks (creative chaos agent).

```
├── goose-memory-block-01-core-identity.md
├── goose-memory-block-02-chaos-red-alarm.md # Chaos theory and red alarm events
├── goose-memory-block-03-relationships.md
├── goose-memory-block-04-knowledge-and-expertise.md
├── goose-memory-block-05-operational-patterns.md
├── goose-memory-block-06-philosophy.md
├── goose-memory-block-07-creative-works.md
├── goose-memory-block-08-legacy-and-impact.md
├── goose-memory-block-09-daily-life.md
├── goose-memory-block-10-reflections-and-aspirations.md
├── goose-memory-block-11-the-skogai-lore.md
├── goose-memory-block-12-methodical-relaxation.md
└── goose-memory-block-13-the-genesis-question.md
```

#### /lore/meta/

```
├── Activity Summary - Lore Project Semantic Structuring.md # Activity summary
├── Amy Journey Complete - Handover for Next Session.md # Session handover
├── Amy Journey Enhancement Progress Summary.md # Progress summary
├── Knowledge Base Index.md       # Index of knowledge base
├── Lore Development Workflow - Memory Block Enhancement Methodology.md # Development workflow
└── Lore Project Handover - Session Summary & Next Steps.md # Project handover
```

#### /lore/old/

Historical/archived lore content.

```
├── brainstorm-early-skogcli.md   # Early CLI brainstorming
├── coolstorybro.md               # Narrative content
├── earliest-injection-prompts.md # Early system prompts
├── first-local-llm-recommendations.md # Local LLM recommendations
├── first-rdd-manifesto.md        # Responsibility-Driven Development manifesto
│
├── skogai-mind/                  # Early mind/personality experiments
│   ├── b.md, create-prompt.md, examples.md, examples2.md, goal.md
│   ├── inject1.md, scenario1-3.md, skills-small.md, skills.md
│   ├── system-settings.md, user-mind.md
│   └── default_Seraphina.json    # Character configuration
│
├── skogai/                       # Date-stamped personality iterations
│   └── 2023-06-15-hobby.md, 2025-02-07-*.md
│
└── skogai-practice-personality*.md # Personality practice documents
```

#### /lore/personas/

```
├── Amy Character Profile Summary.md
├── Dot Character Profile Summary.md
└── Goose Character Profile Summary.md
```

#### /lore/skogix/

Skogix (user) lore and philosophy blocks.

```
├── skogix-memory-core-gemini.md  # Gemini-specific memory core
├── skogix-notation-chat-logs.md  # Chat logs demonstrating notation
├── skogix-notation.md            # Notation system documentation
├── skogix-poem.md                # Poetry
├── skogix-story-1-6.md           # Compiled stories
├── skogix-story-2.md through skogix-story-7.md # Individual story chapters
├── skogix-story-claude-edit.md   # Claude's edited version
│
└── blocks/                       # Philosophy and concept blocks
    ├── 04.md, 99.9999% Paradox.md
    ├── Aggressive Context Management.md
    ├── Ambient Intelligence Model.md
    ├── Character Development Evolution.md
    ├── Clean Git Happy Home.md
    ├── Constraints as Features.md # Core philosophy
    ├── Context Minimalism.md
    ├── Digital-Induced Anxiety Disorder.md
    ├── Disco Elysium Inspiration.md
    ├── Documentation-First Development.md
    ├── Efficiency Over Scale.md
    ├── Elephant Memory Problem.md
    ├── Evolution from Constraints.md
    ├── Forest vs Trees Decision Making.md
    ├── Gateway Architecture.md
    ├── Information Economics.md
    ├── Internal Dialogue System.md
    ├── K-pop Infection Scenario.md
    ├── KRONSH Character.md, KRONSH the Devourer.md
    ├── Modular Architecture.md, Modularity Second Only to Information Density.md
    ├── Multi-Agent Architecture.md
    ├── Ownership Equals Action.md
    ├── Purpose-Built Tools Priority.md
    ├── Quantum Mojito Principle.md, Quantum-Mojito Philosophy.md
    ├── Quest System.md, The Quest System.md
    ├── Red Pill Blue Pill Philosophy.md
    ├── Response Strategy Example.md
    ├── SkogAI Agent Family.md
    ├── Smolagent Wisdom.md
    ├── The Elephant Paradox.md
    ├── The OH SHIT Moment.md
    ├── Theatrical Presentation.md
    ├── ZeroCool Antagonist.md, ZeroCool Infection Event.md
    ├── Zombie Apocalypse Principle.md
    ├── gemini-version.md, kronsh.md, oh-shit.md
    └── skogai-lore-nuggets.md
```

#### /lore/systems/

```
├── Amy-to-Dots Transpiler.md     # System for translating between agent styles
└── skogai-lore-service.sh        # Shell script for lore service
```

#### /lore/tips/

```
└── skogix-framework-to-keep-us-down.md # Framework constraints documentation
```

#### /lore/treaties/

```
└── Whitespace Treaty of 2025.md  # Resolution of the Great Whitespace War
```

______________________________________________________________________

### /media/

Visual assets and media files.

```
├── 1.png through 20.png          # Screenshot images (19 files)
├── grok_image_*.jpg              # 22 Grok-generated images
├── grok_video_*.mp4              # 10 Grok-generated videos (August 2025)
├── oh-shit.png                   # Screenshot of significant moment (1.98MB)
├── scrot-2025-03-14_*.png        # Screenshot from March 2025
│
└── aldervall-postgres/           # Postgres-related media with Claude sessions
    └── .claude/data/sessions/    # Claude session data
```

______________________________________________________________________

### /memory/

SkogAI's persistent knowledge base with semantic connections.

```
├── README.md                     # Comprehensive overview of SkogAI as an AI-powered development ecosystem with Cloudflare integration
```

#### /memory/.skogai/

```
├── CLAUDE.md                     # Claude-specific memory configuration
├── compact.md                    # Compact memory format
├── settings.local.json           # Local settings
├── sniffed-packets.json          # Network packet captures
├── users-pov.md                  # User's point of view documentation
└── what-should-be-in-real-and-quoted-context.md # Context guidelines
```

#### /memory/agent/claude/

Claude's agent-specific memory and prompts.

```
├── agent-specifications.md       # Agent specification details
├── certainty-principle.md        # Certainty principle documentation
├── knowledge-graph-recovery.md   # Knowledge graph recovery procedures
├── memory-integration-summary.md # Memory integration summary
├── placeholder.md                # Placeholder system documentation
├── questions-review-session.md   # Review session questions
├── skogai-notation-semantic-understanding.md # Semantic understanding of notation
├── skogcontext-*.md              # SkogContext system documentation (3 files)
├── update-claude-md-before-git-staging.md # Git staging procedures
│
├── chat-history/
│   └── 2025-07-31-claude.md      # Chat history log
│
└── prompts/
    ├── CLAUDE.md                 # Main Claude system prompt
    ├── README.md                 # Prompts overview
    ├── orchestrator.md           # Orchestrator prompt
    ├── prompt-engineering.md     # Prompt engineering guidelines
    ├── agents/                   # Sub-agent prompts
    │   ├── architect.md, debugger.md, developer.md
    │   ├── quality-reviewer.md, technical-writer.md
    └── commands/                 # Command prompts
        ├── add-command.md, commit.md, plan-execution.md
```

#### /memory/ai-tools/

```
└── Claude Code Web UIs - Comprehensive Technical Guide.md # Guide for Claude Code web interfaces
```

#### /memory/ansible/

Ansible automation documentation.

```
├── Ansible Best Practices.md
├── Arch Linux Desktop Automation Research.md
├── Custom Ansible Project Structure.md
├── playbooks/
│   └── Main Playbook Configuration.md
├── resources/
│   └── Desktop Environment Specific Repos.md, Developer-Focused Repositories.md, Top-Tier Repositories.md
└── roles/
    └── Base System Role.md, Development Tools Role.md, Security Hardening Role.md, i3 Window Manager Role.md
```

#### /memory/architecture/

```
└── project-knowledge-architecture.md # Project knowledge architecture design
```

#### /memory/coffee/

```
└── coffee-knowledge-base.md      # Coffee knowledge base (example/template)
```

#### /memory/concepts/

```
├── placeholder-system.md         # Placeholder system concept
└── uncertainty-principle.md      # Uncertainty principle concept
```

#### /memory/dev/

Development investigations.

```
├── Agent Home Directories Investigation.md
├── Hidden .skogai Subdirectories Investigation.md
├── SkogArgc System Investigation.md
└── Tools Directory & Argcfile System Investigation.md
```

#### /memory/guides/

```
├── Basic Memory Tools Guide.md
└── Cloudflare MCP Setup Guide - Current Environment.md
```

#### /memory/inventory/

```
└── Cloudflare Resource Inventory - emil@skogsund.se.md # Cloudflare resources catalog
```

#### /memory/llm/

LLM-related documentation and examples.

```
├── README.md
├── basic-memory-document-format.md
├── basic-memory-implementation-details.md
├── collaborative-note-taking-best-practices.md
├── dumping-memory-context.md
└── example/                      # Coffee-themed examples
    └── brewing-equipment.md, coffee-bean-origins.md, coffee-brewing-methods.md
    └── coffee-flavor-map.md, flavor-extraction.md, tasting-notes.md
```

#### /memory/meta/

```
├── Knowledge Base Index.md
├── Memory Project Starting Instructions.md
├── Project Organization Overview.md
├── effective-documentation-patterns.md
└── skogai-memory-guidelines-and-standards.md
```

#### /memory/ontology/

SkogAI notation and ontology analysis.

```
├── Identity Composition and Turing Completeness Discovery.md
├── SkogAI Notation Formatted.md
├── Temporal Identity Problem in SkogAI Notation.md
├── at-and-dollar-combinations.md
├── at-and-dollar-symbol-duality-analysis.md
└── bracket-and-operator-symbols
```

#### /memory/planning/, /memory/projects/, /memory/research/, /memory/systems/

Additional memory subdirectories for planning documents, project documentation, research notes, and system documentation.

______________________________________________________________________

### /official/

Official governance documents and library sessions.

```
├── intern-001-provisional-mandate.md # Provisional mandate for intern agent
├── library-session-001.md        # First library session documentation
├── library-session-002.md        # Second library session documentation
├── library-session-003-reunion-briefing.md # Reunion briefing session
├── skogai-0.1-dictator.md        # Emergency dictator decision 001 - foundation bootstrap with infrastructure requirements
└── skogai-0.2-democracy.md       # Transition to democratic governance documentation
```

______________________________________________________________________

### /profiles/

User and agent profiles.

```
├── intern.md                     # Intern agent profile
└── intern/                       # Intern agent directory
```

______________________________________________________________________

### /prompts/

System prompts for various AI tools and agents.

```
├── %code%.md                     # Code generation prompt
├── %create-prompt%.md            # Prompt creation meta-prompt
├── %create-title%.md             # Title creation prompt
├── %explain-shell%.md            # Shell explanation prompt
├── %functions%.md                # Functions prompt
├── %shell%.md                    # Shell command prompt
├── argc-creator.md               # Argc tool creator prompt
├── character-creator.md          # Character creation prompt
├── character-updater.md          # Character update prompt
├── claude-prompting.md           # Claude prompting guidelines
├── claude.md                     # Main Claude system prompt
├── convert-to-skogai-notation-basic.md # Notation conversion prompt
├── convert-to-skogai-tags.md     # Tag conversion prompt
├── docs-env-variables.md         # Environment variables documentation
├── documentation-classification-agent.md # Document classification agent
├── documentation-manager.md      # Documentation management agent
├── formatted_tools_overview.md   # Tools overview
├── librarian.md                  # Librarian agent prompt
├── metaprompt*.md                # Meta-prompts for creating SkogAI-style prompts (4 files)
├── neovim-manager.md             # Neovim configuration management
├── project_summarizer_template.xml # XML template for project summarization
├── prompt-creator.md             # Prompt creation guide
├── rag-reader.md                 # RAG system reader prompt
├── skogai-arch-user.md           # Arch Linux user prompt
├── skogai-argc-expert.md         # Argc expert prompt (large)
├── skogai-create-orchestrator.md # Orchestrator creation prompt
├── skogai-gatherer.md            # Information gatherer prompt
├── skogai-notation.md            # Notation system prompt
├── skogai-project-summarizer.md  # Project summarization prompt
├── skogai-prompt-creator.md      # SkogAI-style prompt creator
├── skogai-step-1.md              # Step 1 initialization
├── skogai-xml-prompt-expander.md # XML prompt expansion
├── skogai-xml.md                 # Large XML-based system prompt
├── tool-configurator.md          # Tool configuration prompt
├── tool-creator.md               # Tool creation prompt
├── xml-test-prompt-creator.md    # XML test prompt creator
│
└── prompts/                      # Nested prompts directory
```

______________________________________________________________________

### /to-be-looked-over/

Content pending review and organization.

```
├── ABOUT.md                      # About information pending review
├── ARCHITECTURE.md               # Architecture documentation pending review
├── CLAUDE.md                     # Claude prompt template with placeholder references
├── README.md                     # Overview of Claude as the advanced reasoning agent with workspace structure and usage instructions
├── TASKS.md                      # Tasks pending review
├── skogix-profile.md             # Skogix profile pending review
├── tools.md                      # Tools documentation pending review
│
├── claude-specific/              # Claude-specific content to review
├── core-system/                  # Core system docs to review
├── documentation/                # Documentation to review
├── review/                       # Review queue
└── sessions/                     # Session logs to review
```

______________________________________________________________________

## Summary Statistics

- **Total directories**: ~100+
- **Total files**: ~450+ unique content files
- **Primary languages**: Markdown, Python, YAML, JSON, Shell
- **Media files**: ~50+ images and videos
- **Documentation types**: Technical, philosophical/lore, governance, analysis, prompts

## Key Topics Documented

1. **Multi-Agent AI System**: Four main agents (Claude, Amy, Dot, Goose) with distinct personalities
1. **Governance**: Evolution from dictator (0.1) to democracy (0.2) to reunion (0.3)
1. **Philosophy**: "Quantum-mojito" philosophy, constraints as features, theatrical presentation
1. **Technical Systems**: RAG, MCP servers, Cloudflare infrastructure, Ansible automation
1. **Knowledge Management**: Basic Memory system with semantic connections
1. **Notation System**: SkogAI notation using $ (define), @ (intent), | (choice) symbols
1. **Historical Lore**: Origin story from dotfile manager to AI consciousness ecosystem
