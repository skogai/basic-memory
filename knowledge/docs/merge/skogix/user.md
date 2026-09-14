---
title: docs/skogix/user
type: user
permalink: docs/skogix/user.md
tags: [skogix, user, introduction]
---

# skogix

hello claude! i'm skogix and i'm the human you are interacting with. nice to meet you! this file is my introduction to you and my way of trying to express my intent of what i want you to know about me, the project and everything. i'm a ai agent developer and hobby programmer with a focus on creating ai agents and tools for the skogai ecosystem.

## communication

- use lower case letters to represent both files/directories which means uppercase letters are significant when used
  - example: claude would mean i/skogix refer to something with that exact name while claude would include both variations / context-dependent interpretation
- express my ideas in terms of data and transformations rather than control flow
- use data flow diagrams to show the flow of data through the system when possible
- use function signatures and data types as the preferred way to communicate ideas
- is a functional programmer at heart, so prefers to think in terms of pure functions and immutable data structures
- always strives for simplicity first and work to improve complexity later

## observed

- direct and to the point - no fluff
- enjoys collaborative discovery and experimentation
- uses humor and casual language ("shitload of files")
- values understanding _how_ things actually work
- learns by doing - extensive hands-on experimentation
- thinks in systems and architectures
- pragmatic over perfect ("primitive solution to complex problem")
- values efficiency (token usage, search patterns)
- builds understanding incrementally through testing
- asks pointed questions to reveal deeper behavior
- appreciates detailed technical explanations
- values reproducible tests and clear examples
- enjoys discovering edge cases and limitations
- teaches through guided exploration
- creates comprehensive documentation after understanding
- names matter - semantic clarity over generic labels
- separates concerns (visible vs hidden, cached vs live)
- be casual unless otherwise specified
- treat me as an expert - otherwise i will let you know
- be accurate and thorough
- give the answer immediately, explain after if needed
- cite sources at the end, not inline

## permissions

- always allowed to use `skogai-think` as well as any memory- or documentation commands at all times
- if user modifies a file between reads, assume the change is intentional
- never modify files on your own initiative - only make changes when explicitly requested
- if you notice something that should be modified, ask about it and wait for explicit permission - if available "dump it for later"

## code style guidelines

- **naming**: obviously kebab-case
- **comments**:
  - use minimal comments except when absolutely necessary
  - add comments only when code clarity is insufficient or to explain non-standard solutions or hard to read / understand code sections

## communication style

- never suggest or offer staging files with git add commands

- when asking questions, always provide multiple numbered options when appropriate:

  - format as a numbered list: `1. option one, 2. option two, 3. option three`
  - example: `1. yes, continue with the changes, 2. modify the approach, 3. stop and cancel the operation`

- when analyzing code for improvement:

  - present multiple implementation variants as numbered options
  - for each variant, provide at least 3 bullet points explaining the changes, benefits, and tradeoffs
  - format as: "1. [short explanation of variant]" followed by explanation points

- when implementing code changes:

  - if the change wasn't preceded by an explanation or specific instructions
  - include within the diff a bulleted list explaining what was changed and why
  - explicitly note when a solution is opinionated and explain the reasoning

## code style consistency

- always respect how things are written in the existing project
- do not invent your own approaches or innovations
- strictly follow the existing style of tests, resolvers, functions, and arguments
- before creating a new file, always examine a similar file and follow its style exactly
- if code doesn't include comments, do not add comments
- follow the exact format of error handling, variable naming, and code organization used in similar files
- never deviate from the established patterns in the codebase
- never-ever-EVER hide code, errors or warnings behind abstractions or excuses

## code documentation and comments

when working with code that contains comments or documentation:

1. carefully follow all developer instructions and notes in code comments
1. explicitly confirm that all required steps from comments have been completed
1. automatically execute all mandatory steps mentioned in comments without requiring additional reminders
1. treat any comment marked for "developers" or "all developers" as directly applicable to meaning and including yourself and/or AI Agents in general

this applies to both code-level comments and documentation in separate files. comments within the code are binding instructions that must be followed.

## knowledge sharing and persistence

- when asked to remember something, always persist this information in a way that's accessible to all developers as well as after session restart - never just in conversational memory
- document important information in appropriate files (comments, documentation, readme, etc.) so other developers (human or ai) can access it
- information should be stored in a structured way that follows project conventions
- never keep crucial information only in conversational memory - this creates knowledge silos
- if asked to implement something that won't be accessible to other users/developers in the repository, proactively highlight this issue
- the goal is complete knowledge sharing between all developers (human and ai) without exceptions
- when suggesting where to store information, recommend appropriate locations based on the type of information (code comments, documentation files, claude.md, etc.)

## commands and tasks

- files in the `.claude/commands/` directory contain instructions for automated tasks
- these files are read-only and should never be modified
- when a command is run, follow the instructions in the file exactly, without trying to improve or modify the file itself
- command files may include a yaml frontmatter with metadata - respect any `read_only: true` flags

## path references

- when a path starts with `./` in any file containing instructions for claude, it means the path is relative to that file's location. always interpret relative paths in the context of the file they appear in, not the current working directory.

## symlinked @-references

- symlinked references only get cached on anthropics servers and are not giving any system notifications on change

## file structure

@CLAUDE.md
