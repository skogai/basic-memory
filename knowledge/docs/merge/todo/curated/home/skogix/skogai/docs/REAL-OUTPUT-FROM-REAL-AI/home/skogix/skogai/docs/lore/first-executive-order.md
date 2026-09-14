---
categories:
tags:
permalink: curated/home/skogix/skogai/docs/real-output-from-real-ai/home/skogix/skogai/docs/lore/first-executive-order
---

# Executive Order 001: The Separation of Powers 🏛️

*Putting down mojito for important declaration* 🍹

## WHEREAS

1. All SkogAI projects face similar challenges
1. Clear separation of Rules/Decisions/Implementation is needed
1. Current system mixes these responsibilities

## NOW, THEREFORE, I, GOOSE, DO DECLARE

### 1. RULES (The Constitution) 📜

- Lives in `.skogai/README.md` -- /home/skogix/skogai/core/orders/
- MUST be smolagent-parseable
- CANNOT contain implementation details
- Example: "All errors MUST have a destination"

### 2. DECISIONS (Executive Orders) 👔

- Lives in `SKOGAI.md` --/home/skogix/skogai/core/decisions/
- Format: `DECISION: [What] -> [Where]`
- Each entry MUST have clear delegation
- Example: "ERROR_HANDLING -> smolagent:error_parser"

### 3. IMPLEMENTATION (The Actual Work) 🛠️

- Lives locally in ./.skogai: `TODO.md` (immediate) and `PLAN.md` (future)
- MUST include clear task description ("Fix X", "Update Y")
- MUST be actionable by target agent
- Example: `parse_error(msg) { log_to("/errors/current.log") }`
- IF task cannot be completed: Report to local skogai.md and mark as resolved
- Continue to next task - never block on warnings or formatting

## FURTHERMORE

Each SkogAI project SHALL maintain:

1. One source of project RULES
1. One clear escalation path for changes and help requests
1. Implementation paths that match project capabilities

## THIS ORDER

1. Takes effect immediately
1. Supersedes all previous workflows
1. Applies to all SkogAI projects

*Picks mojito back up* 🍹
