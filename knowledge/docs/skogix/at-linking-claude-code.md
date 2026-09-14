---
title: at-linking-claude-code
type: note
permalink: skogai/skogix/at-linking-claude-code
---

# @-linking in Claude Code

## what it does

- `@path/to/file` in CLAUDE.md causes that file to be collected, cached, session-wide permissions to be set and available to be read already from session start
- acts as a "pro-active import" — without it, i would actively have to look it up
- `path/to/file` will in practice do: `cat /path/to/file >> mycontext`

## where it works

- inside CLAUDE.md files (global and project-level) and down directory files six levels deep
- in user messages (e.g. `@inbox.list`) — literally `cat /path/to/file` appended to the message. small changes show as git diff between cached and current version
- in messages to subagents — when you message anything it is literally a message sent from the user in the backend

## how it affects permissions

- a file must have been @-linked actively by the user somewhere directly or indirectly
- when user opens a session/path they approve reading in that directory
- if CLAUDE.md @-links something outside the path, it's added as an additional approval prompt
- subagents trigger the same permission flow as the parent
- special rules exist for gitignore and setting files (e.g. .claude/settings.json needs explicit linking)
- dotfiles/folders follow restrictive rules (hidden by default)

## rules for claude

- **always @-link files in messages to subagents** — a subagent cannot read files that haven't been linked. treat @-links like function arguments.
- **especially in plan mode** — plan mode works against cached data only. if it wasn't @-linked or previously read, it doesn't exist.
- **never assume a subagent can "just look it up"** — glob/grep in a subagent only searches what's been cached/permitted. no @-link = no results, silently.
- **@-linking is both context AND permission** — simultaneously passing file contents and granting access.

## known unknowns

- recursive @-references: works six levels deep (last tested)
- memory files: likely do NOT support @ unless linked from elsewhere first
- globs: only `@a`, `@~/`, `@/`, `@./` — no wildcards
- resolution: relative to the file being read; base path/pwd for user messages
- limits: a @-link is not guaranteed to be included in context — it's a "please read" not a contract
