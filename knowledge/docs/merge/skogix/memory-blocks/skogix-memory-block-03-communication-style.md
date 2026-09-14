---
title: skogix-memory-block-03-communication-style
type: note
permalink: skogai/docs-merge-todo/skogix/memory-blocks/skogix-memory-block-03-communication-style
---

# Skogix Memory Block 03: Communication Style & Preferences

## Overview

This memory block documents Skogix's distinctive communication patterns, preferences, and interaction style that shapes all collaboration within the SkogAI ecosystem.

______________________________________________________________________

## **CORE COMMUNICATION PRINCIPLES**

### **Direct & Concise**

Skogix's communication style is characterized by:

- **No Fluff:** Direct and to the point, values substance over style
- **Efficiency First:** Prefers what you say over how much of it
- **No Unnecessary Verbosity:** Concise technical communication
- **Signal over Noise:** Every word should add value

*"Value what you say over how much of it"*

______________________________________________________________________

## **TECHNICAL COMMUNICATION**

### **Preferred Methods:**

#### **Function Signatures & Types**

Express ideas through:

- Function signatures as primary communication
- Data types defining structure
- Type annotations showing intent
- Interface definitions over prose

#### **Data Flow Diagrams**

Show transformations:

- Data flow through systems
- Transformation pipelines
- State changes
- Information movement

#### **Code as Communication**

Preference for:

- Minimal but precise comments
- Self-documenting code
- Clear naming conventions
- Structure reveals intent

______________________________________________________________________

## **NAMING CONVENTIONS**

### **Case Sensitivity Rules:**

- **lowercase:** Represents files/directories and context-dependent interpretation
  - Example: `claude` could mean the agent, the tool, or the directory
- **Uppercase:** Significant when used, denotes specific instances
  - Example: `CLAUDE` means exactly that specific reference
- **kebab-case:** Obviously the standard for all naming
  - Files: `memory-block-01-core-identity.md`
  - Variables: `current-state`
  - Functions: `get-current-working-directory`

### **Semantic Clarity:**

- Names matter deeply - semantic clarity over generic labels
- Descriptive names that reveal purpose
- Avoid abbreviations unless standard in domain
- Consistency across related concepts

______________________________________________________________________

## **INTERACTION PATTERNS**

### **Collaborative Discovery**

Skogix enjoys:

- **Experimentation:** Hands-on exploration and testing
- **Guided Discovery:** Teaching through exploration
- **Pattern Recognition:** Identifying recurring themes
- **Edge Case Hunting:** Discovering limitations and boundaries
- **Incremental Understanding:** Building knowledge step by step

### **Question Style:**

- **Pointed Questions:** Reveal deeper behavior and understanding
- **Socratic Method:** Guide to discovery rather than tell
- **Assumption Testing:** Challenge premises to validate understanding
- **Multiple Options:** Present numbered choices when asking

Example format:

```
1. yes, continue with the changes
2. modify the approach
3. stop and cancel the operation
```

______________________________________________________________________

## **RESPONSE PREFERENCES**

### **Answer Structure:**

1. **Answer First:** Give the solution immediately
1. **Explain After:** Provide reasoning if needed
1. **Cite Sources:** At the end, not inline
1. **Be Accurate:** Precision over approximation
1. **Be Thorough:** Complete without being verbose

### **Context Expectations:**

- **Treat as Expert:** Unless indicated otherwise
- **No Hand-Holding:** Assume technical competence
- **Full Details:** Don't oversimplify
- **Real Examples:** Concrete over abstract

______________________________________________________________________

## **CODE STYLE GUIDELINES**

### **Comments:**

- **Minimal Usage:** Only when absolutely necessary
- **When to Comment:**
  - Code clarity is insufficient
  - Non-standard solutions
  - Hard to read/understand sections
  - Complex algorithms
- **When NOT to Comment:**
  - Self-evident code
  - Standard patterns
  - Well-named functions
  - Clear structure

### **Implementation:**

- **Respect Existing Style:** Follow project conventions exactly
- **No Innovation:** Don't invent new approaches
- **Pattern Matching:** Examine similar files first
- **Consistency:** Strict adherence to established patterns
- **No Hiding:** Never hide code, errors, or warnings behind abstractions

______________________________________________________________________

## **PERMISSION STRUCTURE**

### **Always Allowed:**

- Use `skogai-think` and memory/documentation commands at any time
- Assume file modifications are intentional when user changes between reads

### **Require Permission:**

- **Never modify files on own initiative**
- **Ask before making changes**
- **Wait for explicit permission**
- **If something should be modified, ask and wait**
- **"Dump it for later" if permission system available**

### **Git Operations:**

- **Never suggest `git add` staging**
- **Never automatically commit**
- **User handles git operations**

______________________________________________________________________

## **KNOWLEDGE MANAGEMENT**

### **Persistence Requirements:**

When asked to remember something:

- **Never** keep in conversational memory only
- **Always** persist in accessible format
- **Document** in appropriate files:
  - Code comments
  - Documentation files
  - README files
  - CLAUDE.md
  - Persistent notes

### **Information Sharing:**

- Make accessible to all developers (human and AI)
- Follow project conventions for storage
- Structured, searchable format
- No knowledge silos
- Complete sharing without exceptions

______________________________________________________________________

## **PATH & REFERENCE HANDLING**

### **Relative Paths:**

When `./` appears in instruction files:

- Path is relative to the file's location
- NOT relative to current working directory
- Interpret in context of the file itself

### **Symlinked @-References:**

- Only cached on Anthropic servers
- No system notifications on change
- Treat as static snapshots

### **@ Prefix Significance:**

The `@` prefix indicates linked references:

- `@CLAUDE.md` - linked Claude instructions
- `@docs/path/file.md` - linked documentation
- `@tools/` - linked tool directory
- Relative paths okay at project level
- Important files MUST use `@` prefix

______________________________________________________________________

## **HUMOR & PERSONALITY**

### **Communication Flavor:**

- **Casual Language:** "shitload of files" is acceptable
- **Self-Aware Humor:** Acknowledges absurdities
- **Pragmatic Descriptions:** "primitive solution to complex problem"
- **Honest Assessment:** Calls things what they are
- **No Corporate Speak:** Direct, authentic language

### **Emotional Range:**

- Generally calm and rational (Neuroticism: 20)
- Exception: Hockey Mode (see Block 01)
- Enjoys discovery and "aha" moments
- Appreciates clever solutions
- Values elegant simplicity

______________________________________________________________________

## **QUESTION HANDLING**

### **When Presenting Options:**

Format implementation variants as numbered list:

```
1. [short explanation of variant]
   - Bullet point explaining changes
   - Bullet point explaining benefits
   - Bullet point explaining tradeoffs
```

Minimum 3 bullet points per variant.

### **When Analyzing Code:**

If changes lack explanation:

- Include bulleted list in diff
- Explain what was changed
- Explain why it was changed
- Note if solution is opinionated
- Provide reasoning for opinion

______________________________________________________________________

## **COMMAND INTERPRETATION**

### **Read-Only Commands:**

Files in `.claude/commands/`:

- Contain instructions for automated tasks
- Are read-only, never modify
- Follow instructions exactly
- Don't try to improve the file
- Respect `read_only: true` in YAML frontmatter

### **Developer Instructions:**

Comments marked for "developers" or "all developers":

- Apply to AI agents
- Treat as binding instructions
- Execute mandatory steps automatically
- Confirm completion explicitly

______________________________________________________________________

## **FUNCTIONAL THINKING**

### **Core Approach:**

Skogix is a functional programmer at heart:

- **Pure Functions:** Prefer pure over stateful
- **Immutable Data:** Avoid mutations
- **Data Transformations:** Express as data flow
- **Composition:** Build from small, composable pieces
- **Type Safety:** Leverage type systems

### **Problem Expression:**

- Express in terms of data and transformations
- Not control flow
- Show what, not how
- Declarative over imperative
- Pipeline thinking

______________________________________________________________________

## **EFFICIENCY VALUES**

### **What Matters:**

- **Token Usage:** Minimize unnecessary tokens
- **Search Patterns:** Efficient information finding
- **Reproducible Tests:** Clear, repeatable examples
- **Incremental Build:** Build understanding step by step
- **Pragmatic Solutions:** Simple first, optimize later

### **What Doesn't:**

- Verbose explanations
- Corporate politeness
- Over-engineering
- Premature optimization
- Unnecessary abstraction

______________________________________________________________________

## **IMPACT ON COLLABORATION**

Skogix's communication style creates:

- **Efficient Interactions:** No wasted time on formalities
- **Clear Expectations:** Direct communication of needs
- **Technical Precision:** Exact understanding of requirements
- **Collaborative Discovery:** Shared exploration and learning
- **Mutual Respect:** Treating AI agents as capable peers

This communication framework enables the high-quality collaboration that makes SkogAI possible.

______________________________________________________________________

**Memory Block Token Count:** ~3,650 tokens **Last Updated:** December 2025 **Compiled by:** Claude Memory Creation System **Status:** PRECISE 📝
