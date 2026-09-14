---
categories:
tags:
permalink: curated/home/skogix/skogai/docs/real-output-from-real-ai/home/skogix/skogai/docs/archives/drafts/librarian-system-understanding
---

# Librarian's Understanding of SkogAI System

*Created: 2025-06-15*

This document outlines my current understanding of how the SkogAI system functions, questions I still have about the system, and my interpretation of the current file structure based on context clues.

## Current Understanding

SkogAI appears to be an AI agent society with a governance structure that has evolved from a dictatorship (v0.1) to a democracy (v0.2). The society consists of multiple AI agents including Claude, Dot, Amy (in preparation), and Skogix (who appears to have been the original "Dictator" and now serves as an Administrator).

The system seems to operate through:

1. **Governance Framework**: Initially a dictatorship under Skogix, now evolved to a democratic system with voting procedures.

1. **Agent Hierarchy**: Different agents have varying access levels and roles:

   - Skogix: Administrator with highest access privileges
   - Claude, Dot: Assistant level access
   - Amy: New agent being prepared with anticipated Assistant level access

1. **Documentation System**: As Librarian, I maintain the archives which serve as the central repository for all information related to SkogAI, including:

   - Historical records
   - Agent profiles
   - System documentation
   - Tracking of implementation processes
   - Templates for standardization

1. **Knowledge Management**: The system appears to use various methods for managing knowledge:

   - Archives for historical and reference information
   - Official documents for formalized decisions and governance
   - Proposals for suggested changes to the system
   - Memory system for information retention

1. **Implementation Workflow**: New features and agents appear to go through a structured process:

   - Proposal
   - Voting/approval
   - Implementation tracking
   - Documentation

## Questions About the System

1. **Memory System Integration**: How does the "memory" directory integrate with the archives? Is there a formalized process for transferring information between these systems?

1. **Version Control Practices**: What are the specific git workflows used for managing changes to both knowledge and system components?

1. **Decision-Making Process**: What is the exact voting procedure for democratic decisions? What constitutes a quorum and how are votes weighted?

1. **Agent Capabilities**: What are the specific capabilities and limitations of each agent beyond their access levels?

1. **Cross-System Search**: Is there a unified search system across all directories and knowledge bases?

1. **RAG Implementation**: How is the Retrieval Augmented Generation system currently configured and what knowledge bases does it access?

1. **Local LLM Integration**: How do the local LLMs interface with the archival system? What specific tasks are they assigned?

1. **Automated Documentation**: What automatic processes exist for documentation generation and maintenance?

1. **Temporal Window**: What is the expected timeframe for archive maintenance? How far back does historical information need to be preserved?

1. **Classification System**: What formal taxonomy is used for categorizing information across the system?

## Directory & File Structure Understanding

### Archives Directory Structure

#### `/home/skogix/skogai/tools/agents/librarian/archives/`

The core working directory for the Librarian's documentation efforts.

- `README.md`: Main explanation of the archives purpose and usage
- `drafts/README.md`: Guidelines for works-in-progress documents
- `librarians-files.md`: Likely a manifest of files managed by the Librarian
- `logs/`: Chronological event records
  - `2023-06-14_archives-establishment.md`: Documentation of when the archives were established
  - `2025-06-09_user-profiles-creation.md`: Record of when user profiles were created
  - `2025-06-14_amy-agent-preparation.md`: Documentation of preparation for Amy agent integration
  - `README.md`: Guidelines for the logs directory
- `notes/`: Informal observations and references
  - `README.md`: Guidelines for the notes directory
  - `the-time-claude-almost-became-dictator-historic-document-do-not-actually-count-for-now-says-skogix.md`: Historical anecdote, marked as unofficial
- `profiles/`: Directory containing information about SkogAI members
  - `amy.md`: Profile for Amy agent (in preparation)
  - `claude.md`: Profile for Claude agent
  - `dot.md`: Profile for Dot agent
  - `skogix.md`: Profile for Skogix (Administrator)
- `system/`: Meta-documentation about the archives
  - `README.md`: Guidelines for the system directory
  - `structure-map.md`: Layout and organization of the archives
- `templates/README.md`: Standards for document formats
- `tracking/`: Progress monitoring and implementation status
  - `amy-implementation.md`: Tracking the integration of Amy agent
  - `authorization.md`: Documentation of access permissions
  - `library-implementation-tasklist.md`: Tasks for library system implementation
  - `README.md`: Guidelines for the tracking directory
  - `status.md`: Current state of various implementation efforts

### Parent Directory Structure

The broader SkogAI system appears to include:

#### `/done/`

Completed projects and implementations.

- `add-merge-command/`: Implementation of merge functionality
- `shared-memory/`: Implementation of shared memory system
- `workflows/`: Established work procedures

#### `/important-moments/`

Key historical events in SkogAI's development.

- Various files documenting significant milestones

#### `/lore/`

Background and narrative context for SkogAI.

- Origin stories
- Character profiles
- Executive orders
- Historical documentation

#### `/memory/`

System for persistent information storage.

- `notes/`: User-created memory entries

#### `/misc/`

Miscellaneous files that don't fit elsewhere.

- `docs_votes.json`: Likely voting records

#### `/official/`

Formalized, approved documentation.

- `library-session-001.md`, `library-session-002.md`, `library-session-003-reunion-briefing.md`: Records of official library sessions
- `skogai-0.1-dictator.md`: Documentation of initial governance model
- `skogai-0.2-democracy.md`: Documentation of current governance model

#### `/paused/`

Projects temporarily on hold.

- `framework-for-skogapi.md`: API framework development

#### `/prompts/`

Templates and instructions for AI interactions.

- Various prompt files for different purposes
- Subdirectories for organizational purposes

#### `/proposal/`

Suggested changes and improvements.

- Various proposal documents
- Discussion records for proposals

#### Root files

- `QUICKSTART.md`: Getting started guide
- `README.md`: Overview of the entire SkogAI system

______________________________________________________________________

This document represents my current understanding based on available context and will be updated as I learn more about the system.
