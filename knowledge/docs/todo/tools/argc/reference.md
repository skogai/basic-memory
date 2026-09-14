---
title: argc reference
type: tool
permalink: docs/tools/argc/reference.md
tags: [argc, reference, tags, modifiers]
---

# argc complete reference

comprehensive reference for all argc tags, modifiers, and features.

## comment tags

### @describe

set description text for commands or the script.

```sh
# @describe This is a tool for processing data
# @describe
# @describe It supports multiple formats and provides
# @describe extensive options for customization.
```

- supports multi-line (each `@describe` adds a line)
- blank `@describe` adds empty line
- shown in `--help` output

### @cmd

define a command or subcommand.

```sh
# @cmd
build() { echo "building..."; }

# @cmd build the project
build() { echo "building..."; }

# nested commands:
# @cmd
docker() { :; }
# @cmd start services
docker::up() { docker-compose up; }
```

- without text: parent command (needs `{ :; }` body)
- with text: command description
- use `::` for nesting

### @arg

positional argument.

```sh
# @arg name  Description
# @arg input!  Required argument
# @arg files*  Multiple arguments (zero or more)
# @arg items+  Multiple required (one or more)
# @arg config=default.json  With default value
# @arg format[json|yaml|toml]  With choices
# @arg remaining~  Catch all remaining args
```

**syntax:** `@arg <name><modifier> <description>`

**access:** `$argc_name` or `${argc_name[@]}` for multi-value

### @option

option argument (key-value).

```sh
# @option --name  Description
# @option -o --output  Short and long form
# @option --port=8080  With default
# @option --format[json|yaml]  With choices
# @option --config <FILE>  With completion hint
# @option --tags*,  Multiple (comma-sep or repeated)
# @option -D-*  Prefixed options
```

**syntax:** `@option <flags><modifier> <description>`

**access:** `$argc_name` or `${argc_name[@]}` for multi-value

### @flag

boolean flag.

```sh
# @flag -v --verbose  Enable verbose output
# @flag --dry-run  Dry run mode
# @flag -f  Short form only
```

**syntax:** `@flag <flags> <description>`

**access:** `$argc_verbose` (0 or 1)

### @env

environment variable.

```sh
# @env VAR  Optional env var
# @env API_KEY!  Required env var
# @env PORT=3000  With default
# @env DEBUG$$  Bind to $DEBUG
# @env TOKEN$API_TOKEN  Bind to $API_TOKEN
```

**syntax:** `@env <name><modifier> <description>`

**access:** `$argc_VAR`

### @meta

metadata directives.

```sh
# @meta version 1.2.3
# @meta author skogix
# @meta dotenv
# @meta combine-shorts
# @meta symbol +
# @meta man-section 1
```

**available meta values:**

- `version <ver>` - set version string
- `author <name>` - set author
- `dotenv` - load .env file
- `combine-shorts` - allow `-abc` for `-a -b -c`
- `symbol <char>` - allow symbol syntax like `+arg`
- `man-section <n>` - man page section (1-8)

### @alias

command alias.

```sh
# @cmd build project
# @alias b
build() { echo "building..."; }

# usage: argc build  OR  argc b
```

**syntax:** `@alias <name>`

## modifiers

modifiers control parameter behavior. append to parameter name.

### ! (required)

makes parameter required.

```sh
# @arg input!  Required
# @option --name!  Required option (rare)
# @env API_KEY!  Required env var
```

### \* (multiple)

zero or more values.

```sh
# @arg files*  Files to process
# usage: cmd file1 file2 file3
# access: ${argc_files[@]}
```

### + (required multiple)

one or more values (required).

```sh
# @arg items+  At least one item required
# usage: cmd item1 item2
```

### ~ (catch-all)

capture all remaining arguments.

```sh
# @arg remaining~  Everything else
# usage: cmd --flag -- arg1 arg2 arg3
# access: ${argc_remaining[@]} = (arg1 arg2 arg3)
```

useful for delegating to other commands:

```sh
# @arg docker_args~
docker_wrapper() {
    docker "${argc_docker_args[@]}"
}
```

### =value (default)

provide default value.

```sh
# @option --port=8080
# @arg format=json
# @env DEBUG=0
```

### [choices] (enum)

restrict to specific values.

**static choices:**

```sh
# @option --format[json|yaml|toml|xml]
# @arg env[dev|staging|prod]
```

**dynamic choices (backticks):**

```sh
# @option --branch[`git branch -r`]
# @arg file[`ls *.txt`]
# @option --service[`_choice_services`]

_choice_services() {
    docker-compose config --services
}
```

### , (comma separator)

allow comma-separated values for multi-value params.

```sh
# @option --tags*,  Tags
# usage: --tags a,b,c --tags d
# result: argc_tags=(a b c d)
```

### <TYPE> (completion hint)

hint for shell completion.

```sh
# @option --input <FILE>
# @option --dir <DIR>
# @option --cmd <COMMAND>
# @option --user <USER>
# @option --group <GROUP>
# @option --host <HOST>
```

built-in types trigger appropriate completion.

### -\* (prefixed options)

accept prefix-style options.

```sh
# @option -D-*  Define variables
# @option -X-*  JVM options

# usage: cmd -Dkey=val -Dfoo=bar -Xmx1g
# access: ${argc_D_[@]} and ${argc_X_[@]}
```

### $$ (bind to same env var)

bind to environment variable with same name.

```sh
# @env DEBUG$$
# reads from $DEBUG env var
```

### $NAME (bind to specific env var)

bind to specific environment variable.

```sh
# @env TOKEN$API_TOKEN
# reads from $API_TOKEN env var
```

## variable naming

argc maps parameters to bash variables with `argc_` prefix:

```sh
# @flag --verbose          → $argc_verbose (0 or 1)
# @option --output-file    → $argc_output_file
# @arg input-file          → $argc_input_file
# @env API_KEY             → $argc_API_KEY
```

**naming rules:**

- prepend `argc_`
- hyphens become underscores
- preserve case

**multi-value (arrays):**

```sh
# @arg files*              → ${argc_files[@]}
# @option --tags*,         → ${argc_tags[@]}
```

## built-in variables

argc provides special variables:

- `$ARGC_PWD` - directory where argc was invoked (for Argcfile.sh)
- `$ARGC_COMPGEN` - set to 1 during completion generation

## parameter syntax

### basic syntax

```
@tag <name><modifier> <description>
```

examples:

```sh
# @arg input!  Required input file
# @option --port=8080  Server port
# @flag -v --verbose  Verbose mode
```

### short and long forms

```sh
# short only:
# @flag -v
# @option -o

# long only:
# @flag --verbose
# @option --output

# both (recommended):
# @flag -v --verbose
# @option -o --output
```

### multiple short forms

```sh
# @option -a -b --output  Multiple short forms
# usage: -a file  OR  -b file  OR  --output file
```

## command structure

### flat commands

```sh
#!/usr/bin/env bash

# @cmd build
build() { :; }

# @cmd test
test() { :; }

eval "$(argc --argc-eval "$0" "$@")"
```

### nested commands

```sh
#!/usr/bin/env bash

# @cmd
docker() { :; }

# @cmd start services
docker::up() { :; }

# @cmd stop services
docker::down() { :; }

# @cmd
docker::image() { :; }

# @cmd list images
docker::image::ls() { :; }

eval "$(argc --argc-eval "$0" "$@")"
```

**rules:**

- use `::` separator
- parent commands need `{ :; }` body
- arbitrary nesting depth

### default command

if no `@cmd` tags exist, entire script is the command:

```sh
#!/usr/bin/env bash
# @describe A simple script
# @arg input!
# @flag --verbose

eval "$(argc --argc-eval "$0" "$@")"

echo "input: $argc_input"
```

## validation

### required parameters

```sh
# @arg file!
# @env API_KEY!
# @option --name!
```

argc validates before running your code.

### choices

```sh
# @option --format[json|yaml|toml]
# ./script.sh --format xml
# error: invalid value for --format
```

argc validates against choices.

### custom validation

do custom validation in your script:

```sh
# @arg port  Port number

eval "$(argc --argc-eval "$0" "$@")"

if [[ -n "$argc_port" ]] && \
   { [[ $argc_port -lt 1024 ]] || [[ $argc_port -gt 65535 ]]; }; then
    echo "error: port must be 1024-65535" >&2
    exit 1
fi
```

## help generation

argc automatically generates `--help` output:

```sh
./script.sh --help
```

**customizing help:**

```sh
# @describe Main description line 1
# @describe Line 2
# @describe
# @describe New paragraph after blank line

# @cmd build project
# @describe This command builds the project
# @describe using cargo in release mode
# @option --target  Target triple
# @flag --release  Build in release mode
build() { :; }
```

**help output includes:**

- description
- usage syntax
- all commands (nested shown with hierarchy)
- all options/flags/args with descriptions
- environment variables
- examples (if provided)

## completion

### automatic completion

argc scripts get automatic shell completion:

```sh
# enable globally:
eval "$(argc --argc-completions bash)"

# now any argc script has completion:
./script.sh <TAB>
```

### completion for choices

```sh
# @option --format[json|yaml|toml]
# ./script.sh --format <TAB>
# shows: json  yaml  toml
```

### dynamic completion

```sh
# @option --branch[`git branch -a | cut -c3-`]
# ./script.sh --branch <TAB>
# shows actual git branches
```

### path completion

```sh
# @option --file <FILE>
# ./script.sh --file <TAB>
# shows files in current directory
```

### custom completion functions

```sh
# @option --service[`_choice_services`]

_choice_services() {
    docker-compose config --services 2>/dev/null
}
```

functions prefixed with `_choice_` are completion helpers.

## advanced features

### symbol parameters

allow leading symbols:

```sh
# @meta symbol +
# @arg toolchain  Rust toolchain

# usage: ./script.sh +nightly
```

### dotenv integration

```sh
# @meta dotenv
# @env DATABASE_URL!
```

loads `.env` file from script directory:

```
DATABASE_URL=postgres://localhost/mydb
API_KEY=secret123
```

### man page generation

```sh
argc --argc-mangen script.sh > script.1
man ./script.1
```

generates proper man pages from argc tags.

### standalone builds

```sh
argc --argc-build script.sh > standalone.sh
chmod +x standalone.sh
```

creates self-contained script with no argc dependency.

## special patterns

### delegating commands

```sh
# @arg docker_args~  Docker arguments

docker_wrapper() {
    docker "${argc_docker_args[@]}"
}

# usage: ./wrapper.sh run -it alpine sh
# runs: docker run -it alpine sh
```

### multi-stage parsing

```sh
# @option --global  Global option
# @arg cmd!  Subcommand
# @arg args~  Subcommand args

eval "$(argc --argc-eval "$0" "$@")"

case $argc_cmd in
    build)
        # parse build-specific args
        ;;
    test)
        # parse test-specific args
        ;;
esac
```

### conditional parameters

use bash logic:

```sh
# @flag --production
# @option --debug-port  Debug port

eval "$(argc --argc-eval "$0" "$@")"

if [[ $argc_production -eq 1 ]] && [[ -n "$argc_debug_port" ]]; then
    echo "error: cannot debug in production" >&2
    exit 1
fi
```

## debugging

### dump parsed arguments

```sh
argc --argc-dump script.sh arg1 arg2 --flag
```

shows how argc parsed the arguments.

### see generated code

```sh
argc --argc-eval script.sh --help
```

shows the shell code argc generates.

### verbose mode

```sh
ARGC_VERBOSE=1 ./script.sh --help
```

## reference documentation

- formal specification: `@src/argc/docs/specification.md`
- variable reference: `@src/argc/docs/variables.md`
- examples: `@src/argc/examples/`
- completions guide: `@docs/tools/argc/completions.md`
