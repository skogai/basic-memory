---
title: ast-grep-cheat-sheet
type: note
permalink: tools/ast-grep-cheat-sheet
tags:
  - '[skogai'
  - ast
  - grep
  - cheat
  - sheet
  - ai]
---

# ast-grep Cheat Sheet

## Basic Commands

```bash
# Search for patterns
ast-grep run --pattern "PATTERN" --lang LANGUAGE [FILES...]

# Search and replace
ast-grep run --pattern "OLD" --rewrite "NEW" --lang LANGUAGE [FILES...]

# Apply changes automatically
ast-grep run --pattern "OLD" --rewrite "NEW" --lang LANGUAGE --update-all [FILES...]

# Interactive mode (review each change)
ast-grep run --pattern "OLD" --rewrite "NEW" --lang LANGUAGE --interactive [FILES...]

# Scan with custom rules
ast-grep scan [FILES...]
```

## Metavariables & Wildcards

| Pattern | Description                | Example                                |
| ------- | -------------------------- | -------------------------------------- |
| `$_`    | Single wildcard (any node) | `print($_)` matches any print call     |
| `$name` | Named capture              | `def $name():` captures function names |
| `$$$`   | Multiple statements        | `if $cond: $$$` matches any if block   |
| `$$`    | Multiple expressions       | `func($$)` matches func with any args  |

## Common Patterns

### Python

```yaml
# Function definitions
def $name($args): $$$

# Class definitions
class $name: $$$

# Import statements
import $module
from $module import $name

# Exception handling
try: $$$
except $exception: $$$

# Print statements
print($args)

# None checks
if $var is None: $$$
```

### JavaScript/TypeScript

```yaml
# Function declarations
function $name($params) { $$$ }

# Arrow functions
$name = ($params) => $body

# Console logs
console.log($args)

# Async functions
async function $name($params) { $$$ }

# Class methods
class $class {
  $method($params) { $$$ }
}
```

### Go

```yaml
# Function definitions
func $name($params) $return { $$$ }

# Error handling
if err != nil { $$$ }

# Struct definitions
type $name struct { $$$ }
```

## Configuration Files

### sgconfig.yml (Project root)

```yaml
languageGlobs:
  python: ["**/*.py"]
  javascript: ["**/*.js", "**/*.mjs"]
  typescript: ["**/*.ts", "**/*.tsx"]

ruleDirs: [rules]
outputStyle: pretty
```

### Custom Rules (rules/\*.yml)

```yaml
id: rule-name
message: "Description of the issue"
severity: warning # error, warning, info
language: python
rule:
  pattern: |
    problematic_pattern
fix: |
  better_pattern
```

## Languages Supported

- **Web**: JavaScript, TypeScript, HTML, CSS
- **Systems**: C, C++, Rust, Go
- **Scripting**: Python, Ruby, Bash, Lua
- **JVM**: Java, Kotlin, Scala
- **Others**: C#, PHP, Swift, Elixir, Haskell
- **Config**: JSON, YAML

## Useful Flags

| Flag            | Description                            |
| --------------- | -------------------------------------- |
| `--lang LANG`   | Specify language explicitly            |
| `--update-all`  | Apply all changes without confirmation |
| `--interactive` | Review each change interactively       |
| `--json`        | Output results as JSON                 |
| `--context NUM` | Show NUM lines of context              |
| `--debug-query` | Debug pattern parsing                  |

## Tips & Tricks

1. **Start simple**: Use basic patterns first, then add complexity
1. **Use playground**: Visit https://ast-grep.github.io/playground.html to test patterns
1. **Language-specific**: Patterns must match the language's AST structure
1. **Combine with git**: `git ls-files '*.py' | xargs ast-grep run --pattern "..."`
1. **Batch operations**: Process multiple files at once for consistency

## Examples

```bash
# Find all TODO comments
ast-grep run --pattern "# TODO" --lang python

# Rename a function everywhere
ast-grep run --pattern "old_func" --rewrite "new_func" --update-all

# Find inefficient loops
ast-grep run --pattern "for $i in range(len($arr)): $$$"

# Convert prints to logging
ast-grep run --pattern "print($msg)" --rewrite "logging.info($msg)"
```

## Why ast-grep > grep/sed/awk

- ✅ **Structure-aware**: Understands code syntax
- ✅ **Safe refactoring**: No false positives from comments/strings
- ✅ **Clean diffs**: Readable output
- ✅ **Multi-language**: Single tool for all languages
- ✅ **Powerful patterns**: Metavariables and wildcards
