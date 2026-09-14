---
title: learning-session-from-monolithic-to-modular-context-generation
type: note
permalink: project/skogcontext/learning-session-from-monolithic-to-modular-context-generation
---

# skogcontext Learning Session: From Monolithic to Modular Context Generation

## What We Learned About argc

### argc Ecosystem - "Write Once, Deploy Everywhere"

From a single argc-annotated script, you automatically get:

1. **CLI interface** with `--help` and proper argument parsing
1. **OpenAI function specifications** (functions.json)
1. **Executable binaries** (bin/) for standalone use
1. **MCP integration** for Claude Code
1. **HTTP API** accessible via curl at <https://tools.skogai.se>

### Two argc Tool Patterns

**Static Tools** (like `fs_ls.sh`):

```bash
# @describe List files at path
# @option --path! The directory path
main() {
    ls -1 "$argc_path" >> "$LLM_OUTPUT"
}
```

- Pure functions with parameters
- Reusable across any context
- No agent-specific knowledge

**Agent Tools** (like `librarian/tools.sh`):

```bash
# @cmd Show this agent's library
show_library() {
    tree "$LIBRARY_PATH" >> "$LLM_OUTPUT"  # Agent knows its own paths
}
```

- "Objects" with fields (paths, preferences) and methods (commands)
- Agent-specific behavior and knowledge
- Provide "alternative executables" for agent needs

### Security Model

- Only content written to `$LLM_OUTPUT` is visible to users
- Random echo statements, stderr, debug output is hidden
- Prevents accidental data leaks (like `cat ~/.ssh/*`)
- Makes AI-generated scripts much safer to run

## Current State Analysis

### Old Context System (Monolithic)

```bash
# /home/skogix/skogix/scripts/update
$SKOGAI_DOT_FOLDER/scripts/context-readme.sh >>context
$SKOGAI_DOT_FOLDER/scripts/context-git.sh >>context
$SKOGAI_DOT_FOLDER/scripts/context-workspace.sh >>context
# ...hardcoded script paths, sequential execution
```

**Problems:**

- Hardcoded script paths from `$SKOGAI_DOT_FOLDER`
- No parameterization or reusability
- Environment-dependent setup
- Shell-only, not available to AI platforms

### New argc Transformation

We successfully converted `context-workspace.sh` from:

```bash
# Old: Hardcoded, external dependencies
$SKOGAI_DOT_FOLDER/scripts/context-start.sh "workspace"
tree . --gitignore
$SKOGAI_DOT_FOLDER/scripts/context-end.sh "workspace"
```

To:

```bash
# New: Self-contained, parameterized argc tool
# @describe Generate workspace context with file tree
# @option --section=workspace Context section name
main() {
  printf "[@claude:context:%s]\n" "$argc_section" >>"$LLM_OUTPUT"
  printf "(generated: %s)\n" "$(date)" >>"$LLM_OUTPUT"
  tree . --gitignore >>"$LLM_OUTPUT"
  printf "[@/claude:context:%s]\n" "$argc_section" >>"$LLM_OUTPUT"
}
```

**Verified it works:** `LLM_OUTPUT=./output argc --argc-run context-workspace.sh`

## Target Architecture Vision

## Refined Target Architecture

### Automatic Context Formatting

Instead of manual printf in each module, context formatting should be automatic:

```bash
# In context-workspace.sh - simplified, no manual formatting needed
main() {
  tree . --gitignore >>"$LLM_OUTPUT"
}
```

The orchestrator (`update`) handles context wrapping:

```bash
# argc_section defaults to script basename (workspace.sh → workspace)
section_name="${argc_section:-$(basename "$script" .sh)}"
agent_name="${SKOGAI_AGENT_NAME:-claude}"

printf "[@%s:context:%s]\n" "$agent_name" "$section_name" >> "$CONTEXT_OUTPUT"
LLM_OUTPUT="$CONTEXT_OUTPUT" argc --argc-run "$script"
printf "[@/%s:context:%s]\n" "$agent_name" "$section_name" >> "$CONTEXT_OUTPUT"
```

### Multi-Path Module Discovery

Default location: `./.context/modules/` Environment discovery: `env | grep SKOGAI_MODULE_`

```bash
# Load from default location
for module in ./.context/modules/*.sh; do
    run_module "$module"
done

# Load from environment-specified paths
env | grep '^SKOGAI_MODULE_' | while IFS='=' read -r var_name path; do
    for module in "$path"/*.sh; do
        run_module "$module"
    done
done
```

### Directory Structure

```
skogcontext/
├── update              # Smart orchestrator
├── run                 # Entry point
├── .context/
│   └── modules/        # Default argc modules location
│       ├── workspace.sh
│       ├── git-status.sh
│       └── readme.sh
└── tmp/context         # Final output (legacy)
```

### Modular System Design

```
skogcontext/
├── update              # Orchestrator (environment-driven)
├── run                 # Entry point
├── modules/            # Argc context generation modules
│   ├── workspace.sh    # Self-contained argc tools
│   ├── git-status.sh
│   ├── readme.sh
│   └── user.sh
└── tmp/context         # Final output (legacy compatibility)
```

### Environment-Driven Configuration

```bash
MODULES_DIR="${SKOGAI_CONTEXT_MODULES:-./modules}"
CONTEXT_OUTPUT="${SKOGAI_CONTEXT_OUTPUT:-./tmp/context}"
AGENT_NAME="${SKOGAI_AGENT_NAME:-claude}"
```

### Module Discovery Pattern

```bash
for module in "$MODULES_DIR"/*.sh; do
    LLM_OUTPUT="$CONTEXT_OUTPUT" argc --argc-run "$module"
done
```

## Key Insights & Principles

### 1. Static vs Agent Pattern

> "When we want dynamic/agent-dependent behavior, we should think: 'let the agent provide an alternative executable' rather than making the static tool know about all possible agent contexts."

### 2. Universal Deployment

> Each argc module becomes available across CLI, MCP, HTTP API, and OpenAI functions automatically

### 3. Composability

> Agents can orchestrate static tools in their own specific ways while keeping the tools reusable

### 4. Legacy Compatibility

> New system must produce `./tmp/context` for existing workflows

### 5. Environment-Driven Flexibility

> `$ENV` variables control behavior rather than hardcoded paths

## Questions for Discussion

## Questions for Discussion ✅ RESOLVED

1. **Module Discovery**: Should modules be auto-discovered via filesystem scan, or explicitly configured? → **Multi-path**: `./.context/modules/` + `SKOGAI_MODULE_*` environment variables

1. **Error Handling**: How should `update` handle when individual argc modules fail? → **Bubble up**: Let real errors bubble up and appear in output - pipeable like everything else

1. **Module Dependencies**: Should modules be able to depend on outputs from other modules? → **Text pipeable**: It's only "text out" so it's pipeable like everything else

1. **Static vs Agent Balance**: Which context generation tasks should be static tools vs agent-specific? → **Added to questions.md** for further exploration

1. ✅ **Migration Strategy**: How do we transition from the old system to new argc modules? → **Simple swap**: Just point `SKOGAI_CONTEXT_FOLDER`, `SKOGAI_CONTEXT_UPDATE`, `SKOGAI_CONTEXT_RUN` to the new skogcontext location - immediately migrated!

1. ✅ **Testing**: How do we validate argc modules work across all deployment targets? → **Already solved**: Use `argc --argc-run /home/skogix/.local/src/llm-functions/Argcfile.sh test` - argc ecosystem handles universal testing

## Next Steps for Discussion

- Finalize the modular architecture design
- Decide on environment variable conventions
- Plan the migration strategy from old to new system
- Identify which existing context scripts should become argc modules first
