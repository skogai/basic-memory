---
title: skogcontext-module-architecture-design
type: note
permalink: agent/claude/skogcontext-module-architecture-design
---

# SkogContext Module Architecture Design

## Problem Analysis

The current skogcontext implementation has several architectural challenges:

1. **Path Resolution Issues**: run-tool.sh expects script names, not full paths (line 12: `"$root_dir/tools/$tool_name.sh"`)
1. **Execution Context**: Modules need to run from their own directories for relative commands
1. **Module Discovery**: No standard structure for module organization
1. **Environment Integration**: Complex integration with argc/run-tool.sh infrastructure

## Proposed Module Architecture

### 1. Module Structure Standard

**Hybrid Approach**: Support multiple patterns for maximum flexibility:

```
Pattern A: Single argc script
/path/to/module.sh

Pattern B: Module directory
/path/to/module/
├── run.sh          # Entry point argc script
├── lib/            # Optional helper scripts
└── README.md       # Optional documentation

Pattern C: Named argc script in directory
/path/to/module-name/
├── module-name.sh  # argc script matching directory name
└── lib/            # Optional helpers
```

### 2. Module Registry System

Create a module registry that handles discovery and execution:

```bash
# Registry structure
$SKOGAI_CONTEXT_FOLDER/modules/
├── registry/
│   ├── internal/   # Built-in modules symlinks
│   └── external/   # External modules symlinks
└── cache/          # Execution cache
```

### 3. Path Resolution Strategy

**Three-tier resolution**:

1. **Registry lookup**: Check if module name exists in registry
1. **Environment expansion**: Expand variables like `$SKOGAI_AGENTS/module`
1. **Pattern detection**: Detect and handle different module patterns

### 4. Execution Model

**Context-aware execution**:

- Modules execute from their own directory when needed
- Working directory preserved through execution chain
- Environment variables properly scoped

## Implementation Plan

### Phase 1: Core Infrastructure

1. Create module registry system
1. Implement path resolution logic
1. Extend run-tool.sh for module support

### Phase 2: Module Standards

1. Define module interface specification
1. Create module templates and examples
1. Implement discovery mechanisms

### Phase 3: Integration

1. Integrate with existing argc infrastructure
1. Test with real agent workflows
1. Performance optimization

## Technical Design Details

### Module Resolution Algorithm

```bash
resolve_module_path() {
    local module_spec="$1"

    # 1. Registry lookup
    if [[ -L "$registry_dir/$module_spec" ]]; then
        readlink -f "$registry_dir/$module_spec"
        return
    fi

    # 2. Environment expansion
    local expanded_path
    expanded_path=$(eval echo "$module_spec")

    # 3. Pattern detection
    detect_module_pattern "$expanded_path"
}
```

### Execution Context Management

```bash
execute_module() {
    local module_path="$1"
    local module_dir="$(dirname "$module_path")"

    # Execute in module's directory for relative commands
    (
        cd "$module_dir"
        exec "$module_path" "$@"
    )
}
```

This architecture provides:

- **Simplicity**: Agents still just set environment variables
- **Flexibility**: Multiple module patterns supported
- **Robustness**: Proper path resolution and execution context
- **Maintainability**: Clear standards and discovery mechanisms
