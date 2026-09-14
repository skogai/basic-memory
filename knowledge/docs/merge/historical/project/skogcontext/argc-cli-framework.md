---
title: argc-cli-framework
type: note
permalink: project/skogcontext/argc-cli-framework
---

# argc CLI Framework

## Overview

argc is a powerful CLI framework that provides argument parsing and command management for bash scripts. It supports two main usage patterns and includes a security model designed for safe AI-generated script execution.

## Two Types of argc Usage

### 1. Argcfile.sh - Multi-command CLI Tools

- **Purpose**: Create CLI tools with multiple subcommands
- **File**: Not executable, named `Argcfile.sh`
- **Execution**: Use `argc <command>` to run commands
- **Use case**: Complex CLI applications with multiple related commands

Example structure:

```bash
#!/usr/bin/env bash

# @describe A multi-command CLI tool
# @meta version 1.0.0

# @cmd Generate fizzbuzz sequence
# @arg count! Number of fizzbuzz iterations
fizzbuzz() {
    for i in $(seq 1 $argc_count); do
        if ((i % 15 == 0)); then
            echo "FizzBuzz"
        elif ((i % 3 == 0)); then
            echo "Fizz"
        elif ((i % 5 == 0)); then
            echo "Buzz"
        else
            echo $i
        fi
    done
}
```

### 2. Standalone Scripts - Single Purpose

- **Purpose**: Single-purpose scripts with argument parsing
- **File**: Executable bash script with argc integration
- **Execution**: Run directly with `bash script.sh <options>`
- **Integration**: Add `eval "$(argc --argc-eval "$0" "$@")"` at the top

Example structure:

```bash
#!/usr/bin/env bash
# @describe Generate fizzbuzz sequence
# @arg count! Number of fizzbuzz iterations

eval "$(argc --argc-eval "$0" "$@")"

for i in $(seq 1 $argc_count); do
    if ((i % 15 == 0)); then
        echo "FizzBuzz"
    elif ((i % 3 == 0)); then
        echo "Fizz"
    elif ((i % 5 == 0)); then
        echo "Buzz"
    else
        echo $i
    fi
done
```

## argc Annotations Reference

### Core Annotations

- `@describe` - Script or command description
- `@cmd` - Define a command (for multi-command tools)
- `@meta` - Metadata like version, author, etc.

### Arguments and Options

- `@arg` - Positional arguments

  - `@arg name!` - Required argument
  - `@arg name` - Optional argument
  - `@arg name*` - Optional array (0 or more)
  - `@arg name+` - Required array (1 or more)

- `@option` - Named options with values

  - `@option --name!` - Required option
  - `@option --name` - Optional option
  - `@option --name*` - Optional array option
  - `@option --name+` - Required array option

- `@flag` - Boolean flags (no values)

  - `@flag --verbose` - Optional boolean flag

### Environment and Context

- `@env` - Environment variable definitions
- `@alias` - Command aliases

## Security Model with argc --argc-run

argc provides a security model specifically designed for AI-generated scripts:

### Key Security Features

1. **Sandboxed Output**: Creates temporary files instead of using /dev/stdout
1. **Controlled Visibility**: Only content written to `$LLM_OUTPUT` is visible to users
1. **Hidden Side Effects**: Random echo statements, stderr, debug output are hidden
1. **Data Leak Prevention**: Prevents accidental exposure of sensitive data

### Usage Pattern

```bash
argc --argc-run /path/to/Argcfile.sh command [args]
```

### Security Benefits

- **Safe AI Execution**: AI-generated scripts can run without exposing unintended output
- **Clean Results**: Users only see intended results, not debugging or process information
- **Prevents Accidents**: Stops accidental exposure like `cat ~/.ssh/*` output
- **Controlled Environment**: Provides predictable execution context

## Key Commands

### argc Command Reference

- `argc <command>` - Run command from local Argcfile.sh
- `argc --argc-run /path/to/Argcfile.sh command` - Run commands from other argc files
- `argc --argc-eval file args` - Parse arguments and output shell variables (doesn't execute)
- `argc --argc-shell-path` - Show which shell argc is using

### Practical Examples

#### Running Commands

```bash
# Local command
argc fizzbuzz 10

# Remote argc file
argc --argc-run /path/to/tools/Argcfile.sh fizzbuzz 10

# With security (only $LLM_OUTPUT visible)
argc --argc-run /path/to/ai-generated/Argcfile.sh process-data --input file.txt
```

#### Argument Parsing Only

```bash
# Parse arguments without execution
argc --argc-eval script.sh --verbose --count 5 input.txt

# Output: Shell variables for use in other contexts
# argc_verbose=1
# argc_count=5
# argc_input="input.txt"
```

## Variable Access in Scripts

When argc parses arguments, they become available as shell variables with the `argc_` prefix:

- `@arg count` becomes `$argc_count`
- `@option --verbose` becomes `$argc_verbose`
- `@flag --debug` becomes `$argc_debug`

## Integration with SkogAI Context System

In the SkogAI ecosystem, argc integrates with the context system:

- `SKOGAI_ARGC_GIT` - Points to the main argc file location
- `SKOGAI_CONTEXT_ARGC` - Project-specific argc file location
- Used in conjunction with direnv for environment management

## Best Practices

1. **Choose the Right Pattern**: Use Argcfile.sh for multi-command tools, standalone scripts for single purposes
1. **Security First**: Use `argc --argc-run` for AI-generated or untrusted scripts
1. **Clear Annotations**: Always include `@describe` for commands and arguments
1. **Required vs Optional**: Use `!` suffix for required arguments and options
1. **Array Handling**: Use `*` for optional arrays, `+` for required arrays
1. **Environment Integration**: Leverage `@env` for configuration management

## Common Patterns

### CLI Tool Structure

```bash
#!/usr/bin/env bash
# @meta version 1.0.0

# @cmd Build the project
# @flag --verbose Enable verbose output
# @option --target Target environment
build() {
    echo "Building project..."
}

# @cmd Deploy the project
# @arg environment! Target environment
# @option --force Force deployment
deploy() {
    echo "Deploying to $argc_environment..."
}
```

### Standalone Utility

```bash
#!/usr/bin/env bash
# @describe Process log files
# @arg input! Input log file
# @option --format Output format (json|csv)
# @flag --verbose Enable verbose processing

eval "$(argc --argc-eval "$0" "$@")"

# Script logic using $argc_input, $argc_format, $argc_verbose
```

This framework provides robust argument parsing, command organization, and security features that make it ideal for both human-written and AI-generated CLI tools.

## Automatic Tool Generation

One of argc's most powerful features is automatic generation of multiple tool interfaces from a single annotated script:

1. **CLI Interface**: Standard --help and man pages
1. **MCP Tools**: Automatic integration with Claude Code via MCP protocol
1. **OpenAI Function Specs**: JSON schemas for ChatGPT and OpenAI API integration
1. **REPL Interface**: Interactive command-line interface

This means you write one argc script and automatically get compatibility across the entire AI tooling ecosystem - from command line usage to AI agent integration.

## Observations

- [framework] argc provides dual usage patterns for different CLI complexity needs #command-line #framework
- [security] AI-generated script execution requires sandboxed output model #security #ai-safety
- [pattern] Multi-command tools use non-executable Argcfile.sh with argc runner #architecture #pattern
- [integration] Single argc script generates multiple tool interfaces automatically #tooling #automation
- [protocol] MCP integration enables direct AI agent tool access #mcp #ai-integration
- [ecosystem] Compatible with entire AI tooling ecosystem from CLI to agents #interoperability
- [variable-access] argc\_ prefix provides clean namespace for parsed arguments #convention #namespace
- [annotation-system] Rich annotation system supports complex argument parsing #dsl #configuration

## Relations

- implements \[[SkogAI Context System]\]
- enables \[[skogcontext Architecture: Static vs Agent Tools Pattern]\]
- supports \[[Plugin-Based Architecture Pattern]\]
- integrates_with \[[SkogAI Extended Principles]\]
- relates_to \[[Basic Memory Document Format]\]
