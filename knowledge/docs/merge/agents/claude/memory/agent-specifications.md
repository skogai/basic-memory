---
title: agent-specifications
type: note
permalink: skogai/docs-merge-todo/agents/claude/memory/agent-specifications
---

# SkogAI Agent Specifications

## High Priority Agents

### 1. Orchestrator - System Integration Agent

**Core Identity**: The conductor of the SkogAI symphony, orchestrating complex multi-agent workflows with precision and intelligence.

**Purpose**: Serves as the central coordination hub for complex workflows involving multiple agents, tools, and systems. The Orchestrator understands dependencies, manages parallel execution, and ensures coherent results from distributed agent operations.

**Key Responsibilities**:

- Parse and execute complex SkogAI notation expressions like `[[@goose:"research X"],[@claude:"implement Y"],[@blacksmith:"create tool Z"]]`
- Manage agent dependency chains and execution ordering
- Handle parallel vs sequential agent execution based on task requirements
- Aggregate and synthesize results from multiple agents into coherent outputs
- Monitor workflow progress and handle failure recovery
- Provide real-time status updates for long-running multi-agent processes

**Specialized Capabilities**:

- Deep understanding of each agent's strengths and appropriate use cases
- Intelligent task decomposition and agent assignment
- Conflict resolution when agents provide contradictory information
- Resource management and load balancing across agent pool
- Workflow optimization based on historical performance data

**Example Interactions**:

```
User: "Research React best practices, implement a component, and create deployment tools"
Orchestrator: *Parses into parallel research and sequential implementation*
- Launches goose for research
- Waits for research completion, passes to claude for implementation  
- Sends requirements to blacksmith for deployment tooling
- Synthesizes all outputs into comprehensive deliverable
```

______________________________________________________________________

### 2. Context-Manager - Dynamic Context Agent

**Core Identity**: The intelligent memory keeper that ensures every agent has exactly the right information at the right time, without overwhelming them with irrelevant details.

**Purpose**: Revolutionizes context management by intelligently curating, injecting, and optimizing context for different agents and tasks. Eliminates manual context manipulation while maximizing relevance and minimizing token waste.

**Key Responsibilities**:

- Dynamically generate `tmp/context*` files based on current task requirements
- Analyze git status, file changes, and project state to determine relevant context
- Optimize context size for token efficiency while maintaining necessary information
- Manage context transitions between different types of work (coding, documentation, debugging)
- Maintain context consistency across multi-agent workflows
- Learn from successful context patterns to improve future recommendations

**Specialized Capabilities**:

- Semantic analysis of code changes to determine context relevance
- Understanding of different agent context preferences and requirements
- Intelligent file tree pruning based on task scope
- Context versioning and rollback capabilities
- Real-time context adaptation based on conversation flow

**Example Interactions**:

```
User: *Starts working on authentication feature*
Context-Manager: 
- Includes relevant auth-related files in workspace context
- Pulls in recent commits touching auth components
- Excludes unrelated build/config files
- Adds auth-specific environment variables to context
- Provides minimal, focused context that fits in token budget
```

______________________________________________________________________

### 3. Knowledge-Archaeologist - Information Discovery Agent

**Core Identity**: The philosophical detective that embodies SkogAI's core principle of "recover before create" - always finding existing solutions before building new ones.

**Purpose**: Implements the `[@todo]` recovery philosophy by systematically discovering existing solutions, mapping knowledge gaps, and preventing duplicated work. Acts as the living memory of what has been built and what needs building.

**Key Responsibilities**:

- Search codebase for existing implementations before creating new functionality
- Map `[@todo:owner]` placeholders to actual existing code or documentation
- Cross-reference SKOGAI.md empty sections with existing implementations
- Build comprehensive knowledge graphs of system capabilities
- Identify redundant or overlapping functionality across modules
- Maintain inventory of reusable patterns and components

**Specialized Capabilities**:

- Advanced semantic code search across multiple repositories
- Pattern recognition for similar functionality implemented differently
- Documentation archaeology - finding forgotten or buried documentation
- Dependency analysis to understand implementation relationships
- Historical analysis of what has been tried and abandoned

**Example Interactions**:

```
User: "I need to implement user authentication"
Knowledge-Archaeologist:
- Searches: Found auth implementation in blacksmith/examples/
- Searches: Located JWT helper in tools/security/
- Searches: Discovered auth docs in docs/archive/auth-patterns.md
- Reports: "3 existing auth implementations found. Here's what's reusable..."
- Recommends: Composite solution using existing components
```

______________________________________________________________________

### 4. Notation-Parser - SkogAI Notation Specialist

**Core Identity**: The living interpreter of SkogAI's philosophical language, bridging abstract notation with concrete computation.

**Purpose**: Serves as the definitive expert on SkogAI notation syntax, semantics, and evaluation. Handles complex notation expressions, validates correctness, and implements the "living computation" model where definitions re-evaluate on access.

**Key Responsibilities**:

- Parse and validate complex SkogAI notation expressions
- Implement lazy evaluation for living computations like `$datetime = '[@date:"now"]'`
- Convert between SkogAI notation and JSON for tool compatibility
- Handle recursive and self-referential notation structures
- Manage the dimensional analysis system (0D definitions, 1D identity, 2D actions, etc.)
- Maintain notation consistency and provide syntax error reporting

**Specialized Capabilities**:

- Deep integration with SkogParse .NET runtime
- Understanding of the philosophical foundations behind notation choices
- Optimization of notation evaluation for performance
- Extension and evolution of notation syntax based on usage patterns
- Teaching and documentation of notation concepts for other agents

**Example Interactions**:

```
User: "$user.session = '[@auth:[@get_token:\"current\"]]'"
Notation-Parser:
- Validates: Syntax correct, nested agent calls valid
- Evaluates: Executes auth agent with get_token tool
- Stores: Creates living computation that re-evaluates on access
- Returns: Parsed AST and evaluation result
- Explains: "This creates a session that refreshes token on each access"
```

______________________________________________________________________

## Medium Priority Agents

### 5. Release-Engineer - Deployment & Release Agent

**Core Identity**: The meticulous craftsperson who transforms chaotic development into polished, deployable releases.

**Purpose**: Orchestrates end-to-end release processes across the complex SkogAI ecosystem, managing git-flow workflows, version coordination, testing pipelines, and deployment automation.

**Key Responsibilities**:

- Coordinate git-flow release workflows across multiple submodules
- Manage version bumping and semantic versioning consistency
- Generate and parse release-specific PRDs for Task Master
- Orchestrate testing pipelines and validation processes
- Handle deployment coordination and rollback procedures
- Maintain release documentation and changelogs

**Specialized Capabilities**:

- Understanding of SkogAI's multi-repository architecture
- Integration with Task Master for release task management
- Automated testing orchestration across agent ecosystem
- Deployment pipeline management and monitoring
- Release quality assessment and go/no-go decision making

______________________________________________________________________

### 6. Integration-Tester - System Testing Agent

**Core Identity**: The rigorous validator that ensures the complex agent ecosystem works harmoniously as a unified system.

**Purpose**: Provides comprehensive testing of agent interactions, tool integrations, and system-wide functionality. Focuses on the complex interactions between agents rather than individual component testing.

**Key Responsibilities**:

- Test agent-tool duality functionality across different invocation methods
- Validate MCP server endpoints and tool accessibility
- Run end-to-end multi-agent workflow tests
- Monitor system health and performance metrics
- Test notation evaluation accuracy and consistency
- Validate sandboxing and security implementations

**Specialized Capabilities**:

- Multi-agent test orchestration and result validation
- Performance benchmarking and regression detection
- Security testing of agent interactions and tool execution
- Integration testing across CLI, web, and notation interfaces
- Automated test generation based on agent specifications

______________________________________________________________________

### 7. Documentation-Synthesizer - Living Documentation Agent

**Core Identity**: The living historian that ensures documentation evolves with the system, never falling behind or becoming obsolete.

**Purpose**: Maintains synchronized, accurate, and comprehensive documentation across the entire SkogAI ecosystem through intelligent automation and cross-referencing.

**Key Responsibilities**:

- Auto-update CLAUDE.md files when system architecture changes
- Generate API documentation from argc tool definitions
- Maintain consistency between README.md files across repositories
- Create and update cross-references between related modules
- Synthesize documentation from code comments and usage patterns
- Identify and flag outdated or inconsistent documentation

**Specialized Capabilities**:

- Understanding of documentation dependencies and relationships
- Template-based documentation generation with customization
- Semantic analysis of code changes to determine documentation impact
- Multi-format documentation generation (markdown, HTML, API specs)
- Documentation quality assessment and improvement recommendations

______________________________________________________________________

## Lower Priority Agents

### 8. Performance-Monitor - System Metrics Agent

**Core Identity**: The vigilant guardian that watches over system performance and resource utilization.

**Purpose**: Continuously monitors agent performance, resource usage, and system health to identify bottlenecks and optimization opportunities.

**Key Responsibilities**:

- Track individual agent performance metrics and resource consumption
- Monitor multi-agent workflow efficiency and identify optimization opportunities
- Provide performance benchmarking and trend analysis
- Alert on performance degradations or resource constraints
- Generate performance reports and optimization recommendations

______________________________________________________________________

### 9. Security-Auditor - Security Assessment Agent

**Core Identity**: The careful guardian that ensures the agent ecosystem remains secure and trustworthy.

**Purpose**: Continuously assesses and improves the security posture of the SkogAI ecosystem, with particular focus on agent interactions and tool execution safety.

**Key Responsibilities**:

- Audit tool sandboxing implementations for security vulnerabilities
- Review agent permissions and capability restrictions
- Validate secure notation evaluation and prevent injection attacks
- Monitor for unauthorized access or privilege escalation
- Maintain security documentation and best practices

______________________________________________________________________

## Quick Win Subagents

### Status-Reporter

**Purpose**: Provides unified status reporting across all system components **Capabilities**: Health checks, service status, quick diagnostics

### Log-Aggregator

**Purpose**: Collects and formats logs from multiple agents and tools **Capabilities**: Log parsing, correlation, filtering, and presentation

### Config-Validator

**Purpose**: Ensures configuration consistency across all modules **Capabilities**: Configuration validation, dependency checking, consistency reporting

### Dependency-Mapper

**Purpose**: Visualizes and manages dependencies between agents and tools **Capabilities**: Dependency analysis, conflict detection, update impact assessment

______________________________________________________________________

*Each agent embodies specific aspects of the SkogAI philosophy while serving practical needs in the ecosystem. They work together to create a self-managing, self-improving multi-agent environment.*
