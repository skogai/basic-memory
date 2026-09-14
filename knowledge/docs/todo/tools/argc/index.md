---
title: argc documentation
type: tool
permalink: docs/tools/argc/index.md-1
tags:
  - argc
  - bash
  - cli
  - task-runner
  - completion
---

# argc

argc is a bash framework written in rust for building feature-rich command-line interfaces and task automation.

## dual purpose

**1. bash script argument parser** - transform bash scripts into full-featured clis through comment tags

**2. command runner** - task automation similar to make/just via `Argcfile.sh`

## quick reference

- source: `/home/skogix/.local/src/argc` (symlinked at `@src/argc`)
- completions: `/home/skogix/.local/src/argc-completions` (symlinked at `@src/argc-completions`)
- version: 1.23.0
- license: MIT OR Apache-2.0
- author: sigoden

## documentation structure

- @docs/tools/argc/getting-started.md - installation and first steps
- @docs/tools/argc/cli-authoring.md - building bash clis with argc
- @docs/tools/argc/task-automation.md - argcfile.sh task runner guide
- @docs/tools/argc/reference.md - complete tag and modifier reference
- @docs/tools/argc/completions.md - shell completion integration
- @docs/tools/argc/examples.md - practical patterns and examples
- @docs/tools/argc/skogai-patterns.md - skogai-specific usage and conventions

## core concepts

**comment-tag dsl** - argc uses bash comments as a domain-specific language:

```sh
# @cmd         - define command/subcommand
# @arg         - positional argument
# @option      - option argument (-o, --option)
# @flag        - boolean flag
# @env         - environment variable
# @meta        - metadata (version, dotenv, etc)
# @describe    - description text
# @alias       - command aliases
```

**variable naming** - argc maps parameters to bash variables with `argc_` prefix:

```sh
# @option --name
# becomes: $argc_name

# @arg files*
# becomes: ${argc_files[@]}
```

**modifiers** - symbols control parameter behavior:

- `!` - required
- `*` - multi-occurs/multi-values
- `+` - required + multi-occurs
- `=value` - default value
- `[a|b|c]` - static choices
- `[`\_choice_fn`]` - dynamic choices from function

## key features

- effortless argument parsing via comment tags
- automatic help generation
- cross-shell completion (bash, zsh, fish, powershell, nushell, elvish, xonsh, tcsh)
- man page generation
- standalone script builds (no argc dependency)
- environment variable integration
- task automation with dependency management
- 1000+ pre-built completion scripts for common commands

## usage patterns

**cli script:**

```sh
#!/usr/bin/env bash
# @flag -v --verbose  Enable verbose output
# @option --output    Output file
# @arg input!         Input file

eval "$(argc --argc-eval "$0" "$@")"

[[ $argc_verbose -eq 1 ]] && echo "processing $argc_input"
echo "result" > "${argc_output:-output.txt}"
```

**task runner (Argcfile.sh):**

```sh
#!/usr/bin/env bash
set -e

# @cmd build the project
build() {
    echo "building..."
}

# @cmd run tests
test() {
    build  # dependency
    echo "testing..."
}

eval "$(argc --argc-eval "$0" "$@")"
```

## related tools

- **argc-completions** - 1000+ command completion scripts
- integrates with: git, cargo, npm, docker, and many more
