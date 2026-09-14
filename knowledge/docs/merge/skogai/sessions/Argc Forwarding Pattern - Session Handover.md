---
title: Argc Forwarding Pattern - Session Handover
type: note
permalink: skogai/sessions/argc-forwarding-pattern-session-handover
---

# Argc Forwarding Pattern - Session Handover

## Current State

Successfully implemented a hierarchical argc command forwarding pattern in `/home/skogix/skogai/skogargc/`.

## What Works

- **File**: `/home/skogix/skogai/skogargc/docs/Argcfile.sh`
- **Command**: `argc demo flags --verbose`
- **Result**: Forwards to parent and executes correctly
- **Completion**: `argc demo <tab>` shows parent's subcommands

## Core Pattern

```bash
# Dynamic parent discovery
parent_argcfile() {
  (cd .. && argc --argc-script-path 2>/dev/null) || echo ""
}

# Command forwarding  
demo() {
  local parent=$(parent_argcfile)
  if [[ -n "$parent" ]]; then
    argc --argc-run "$parent" demo "${argc_args[@]}"
  else
    echo "No parent Argcfile found - base case reached"
  fi
}

# Completion forwarding (note: double "demo")
_choice_skogix_args() {
  if [[ "$ARGC_COMPGEN" -eq 1 ]]; then
    local parent=$(parent_argcfile)
    if [[ -n "$parent" ]]; then
      args=("${argc__positionals[@]}")
      args[-1]="$ARGC_LAST_ARG"  
      argc --argc-compgen generic "$parent" demo demo "${args[@]}"
    fi
  fi
}
```

## Key Technical Details

1. **Execution forwarding**: `argc --argc-run "$parent" <command> "${argc_args[@]}"`
1. **Completion forwarding**: `argc --argc-compgen generic "$parent" <command> <command> "${args[@]}"`
1. **Path discovery**: Uses `argc --argc-script-path` in parent directory
1. **Base case**: Empty string when no parent Argcfile exists

## Next Steps / TODO

- Generalize the pattern for any command name (not just "demo")
- Create reusable template/generator
- Test at multiple hierarchy depths
- Document best practices for complex hierarchies

## Files Modified

- `/home/skogix/skogai/skogargc/docs/Argcfile.sh` - working implementation
- `/home/skogix/skogai/skogargc/docs/argc-forwarding-pattern.md` - documentation
- `/home/skogix/skogai/skogargc/argc-forward.sh` - abandoned approach

## Architecture Insight

This enables building modular CLI tool ecosystems:

```
/project/Argcfile.sh           # root commands
├── tools/Argcfile.sh          # forwards to root  
├── deploy/Argcfile.sh         # forwards to root
└── docs/Argcfile.sh           # forwards to parent
```

Each level specializes while transparently accessing parent capabilities.
