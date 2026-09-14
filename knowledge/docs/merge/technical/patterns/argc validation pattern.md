---
title: argc validation pattern
type: note
permalink: docs/patterns/argc-validation-pattern
---

# argc Validation Pattern

## The Core Pattern

When executing system commands with user-provided arguments, VALIDATE FIRST using argc wrappers:

```bash
argc --argc-run ~/.local/src/argc-completions/completions/<tool>.sh <command> <args>
```

## What Happens

1. argc wrapper executes choice functions that query LIVE system state
1. Validates input against actual available options
1. Returns error with REAL valid options if invalid
1. Self-correcting feedback loop

## Example

User says: "restart the api service"

**Wrong approach:**

```bash
systemctl restart api  # Fails - guessing
```

**Right approach:**

```bash
argc --argc-run ~/.local/src/argc-completions/completions/linux/systemctl.sh restart api
# Returns: invalid value `api`
# [possible values: postgresql.service, docker.service, sshd.service, ...]
# Now execute correct one
systemctl restart postgresql.service
```

## Key Insight

This works for 1000+ commands. Every argc wrapper has:

- Static structure from help parsing
- Dynamic validation via choice functions querying real state
- Self-correcting error messages with actual alternatives

## Locations

- Wrappers: `~/.local/src/argc-completions/completions/`
- Linux-specific: `~/.local/src/argc-completions/completions/linux/`
- Custom: `$SKOGAI_TOOLS_ARGC`

## Commands to Validate

High-risk operations with user input:

- systemctl (restart, stop, start, enable, disable)
- docker (run, stop, rm, exec)
- git (checkout, merge, rebase)
- npm/yarn (run)
- kubectl operations
- Any command where user provides resource names

## Integration Pattern

Before executing command with user-provided arg:

1. Try argc validation first
1. Parse error output for valid options
1. Execute correct command
