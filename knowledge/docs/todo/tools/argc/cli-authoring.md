---
title: argc cli authoring
type: tool
permalink: docs/tools/argc/cli-authoring.md
tags: [argc, cli, bash, scripting]
---

# building bash clis with argc

argc transforms bash scripts into feature-rich clis through a comment-tag dsl.

## anatomy of an argc script

```sh
#!/usr/bin/env bash
# @describe Tool description shown in --help
# @meta version 1.0.0

# @option --config  Config file path
# @flag -v --verbose  Enable verbose output
# @arg input!  Input file (required)

eval "$(argc --argc-eval "$0" "$@")"

# now use argc_* variables
[[ $argc_verbose -eq 1 ]] && echo "processing $argc_input"
[[ -n "$argc_config" ]] && echo "using config: $argc_config"
```

**key components:**

1. shebang: `#!/usr/bin/env bash`
1. comment tags: `# @tag ...`
1. eval line: `eval "$(argc --argc-eval "$0" "$@")"`
1. implementation: use `argc_*` variables

## argument types

### flags (boolean)

```sh
# @flag -v --verbose  Enable verbose output
# @flag --dry-run     Show what would happen

# access:
[[ $argc_verbose -eq 1 ]] && echo "verbose mode"
[[ $argc_dry_run -eq 1 ]] && echo "dry run"
```

flags are always `0` (not set) or `1` (set).

### options (key-value)

```sh
# @option --name  Your name
# @option -o --output  Output file
# @option --format=json  Output format (default: json)

# access:
echo "name: $argc_name"
echo "output: ${argc_output:-default.txt}"  # with fallback
echo "format: $argc_format"  # has default from tag
```

### positional arguments

```sh
# @arg source!  Source file (required)
# @arg dest     Destination file (optional)

# access:
echo "copying $argc_source to ${argc_dest:-default.txt}"
```

**modifiers:**

- `!` = required
- no modifier = optional

### multi-value parameters

```sh
# @arg files*  Files to process (zero or more)
# @arg items+  Items (one or more required)

# access as arrays:
for file in "${argc_files[@]}"; do
    echo "processing: $file"
done

# count:
echo "processing ${#argc_items[@]} items"
```

**modifiers:**

- `*` = zero or more
- `+` = one or more (required)

### choices (enum)

**static choices:**

```sh
# @option --format[json|yaml|toml|xml]=json  Output format
# @option --log-level[debug|info|warn|error]  Log level
```

**dynamic choices:**

```sh
# @option --branch[`git branch -r`]  Remote branch
# @option --file[`_choice_files`]  Select file

_choice_files() {
    ls *.txt 2>/dev/null
}
```

### catch-all arguments

```sh
# @arg args~  Remaining arguments

# passes everything after -- to the array:
# ./script.sh --flag -- arg1 arg2 arg3
# ${argc_args[@]} = (arg1 arg2 arg3)
```

## nested commands

create command hierarchies with `::` separator:

```sh
#!/usr/bin/env bash

# @cmd
docker() { :; }

# @cmd list containers
# @flag -a --all  Show all containers
docker::ps() {
    [[ $argc_all -eq 1 ]] && echo "showing all"
}

# @cmd
docker::image() { :; }

# @cmd list images
docker::image::ls() {
    echo "listing images"
}

# @cmd remove images
# @flag -f --force  Force removal
# @arg images+  Images to remove
docker::image::rm() {
    for img in "${argc_images[@]}"; do
        echo "removing $img (force: $argc_force)"
    done
}

eval "$(argc --argc-eval "$0" "$@")"
```

usage:

```sh
./docker.sh ps --all
./docker.sh image ls
./docker.sh image rm -f image1 image2
```

**rules:**

- parent commands need empty body: `{ :; }`
- use `::` to create hierarchy
- each level can have its own options/args

## environment variables

### define and validate env vars

```sh
# @env DATABASE_URL!  Database connection string (required)
# @env PORT=3000  Server port (default: 3000)
# @env DEBUG$$  Enable debug mode (bind to $DEBUG)

# access:
echo "connecting to $argc_DATABASE_URL"
echo "listening on port $argc_PORT"
[[ -n "$argc_DEBUG" ]] && echo "debug enabled"
```

**modifiers:**

- `!` = required (fail if not set)
- `=value` = default value
- `$$` = bind to env var with same name
- `$NAME` = bind to specific env var

### dotenv support

```sh
# @meta dotenv
# @env API_KEY!
# @env SECRET!

# loads from .env file in same directory
```

`.env` file:

```
API_KEY=abc123
SECRET=xyz789
```

## metadata

```sh
# @meta version 1.2.3
# @meta author skogix
# @meta dotenv  # load .env file
# @meta symbol +  # allow +arg syntax
# @meta combine-shorts  # allow -abc for -a -b -c
```

## descriptions and help text

```sh
# @describe A comprehensive tool for processing data
# @describe
# @describe This tool can handle multiple formats and provides
# @describe extensive options for customization.

# multi-line descriptions:
# @describe Line 1
# @describe Line 2
# @describe
# @describe New paragraph
```

for options/args/flags:

```sh
# @option --timeout  Connection timeout in seconds
# @flag -q --quiet  Suppress all output
# @arg input!  Input file to process
```

text after the parameter name becomes its description.

## aliases

```sh
# @cmd
# @alias b
build() {
    echo "building..."
}

# usage: ./script.sh build  OR  ./script.sh b
```

## validation patterns

### required parameters

```sh
# @arg file!  Required file
# @env API_KEY!  Required env var
# @option --name!  Required option (rare, usually use arg)
```

### type-like validation via choices

```sh
# @option --port[`seq 1024 65535`]  Port number
# @option --count[`seq 1 100`]  Count (1-100)
```

### custom validation

```sh
# @arg email!  Email address

eval "$(argc --argc-eval "$0" "$@")"

if [[ ! "$argc_email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "error: invalid email format" >&2
    exit 1
fi
```

## advanced features

### prefixed options

```sh
# @option -D-*  Define variables (-Dkey=value)
# @option -X-*  Java options (-Xmx1g -Xms512m)

# usage: ./script.sh -Dfoo=bar -Dkey=val -Xmx2g
# access: ${argc_D_[@]} and ${argc_X_[@]}
```

### multi-value with delimiter

```sh
# @option --tags*,  Tags (comma-separated or multiple)

# usage: ./script.sh --tags a,b,c --tags d
# result: argc_tags=(a b c d)
```

### completion integration

```sh
# @option --file <FILE>  Input file
# @option --dir <DIR>  Directory

# <FILE> and <DIR> trigger path completion
# other built-in types: <COMMAND> <USER> <GROUP> <HOST>
```

## building standalone scripts

remove argc dependency:

```sh
argc --argc-build script.sh > standalone.sh
chmod +x standalone.sh
```

the generated script includes argc's parsing logic and has no external dependencies.

## generating documentation

**man pages:**

```sh
argc --argc-mangen script.sh > script.1
man ./script.1
```

**completion scripts:**

```sh
argc --argc-completions bash script.sh > script-completion.bash
source script-completion.bash
```

## best practices

1. **always include @describe** - makes `--help` useful
1. **use meaningful variable names** - `--output-file` not `--out`
1. **provide defaults** - `@option --port=8080`
1. **validate early** - check required params before expensive operations
1. **use flags for booleans** - not `--verbose=true`
1. **group related options** - put common options first
1. **leverage nested commands** - for complex clis with multiple actions
1. **test with --help** - ensure help text is clear
1. **use choices** - restrict invalid input early
1. **document env vars** - use `@env` even if optional

## common pitfalls

**wrong: missing eval line**

```sh
# @flag -v
# script.sh continues... ❌ argc_v won't exist
```

**correct:**

```sh
# @flag -v
eval "$(argc --argc-eval "$0" "$@")"
# now argc_v is available ✓
```

**wrong: testing flags**

```sh
[[ "$argc_verbose" == "1" ]]  # string comparison ❌
```

**correct:**

```sh
[[ $argc_verbose -eq 1 ]]  # numeric comparison ✓
```

**wrong: multi-value without modifier**

```sh
# @arg files  Files
# ./script.sh a b c
# argc_files = "a" (only first) ❌
```

**correct:**

```sh
# @arg files*  Files
# ./script.sh a b c
# argc_files = (a b c) ✓
```

## references

- @docs/tools/argc/reference.md - complete tag reference
- @docs/tools/argc/examples.md - real-world examples
- @src/argc/examples/ - upstream examples
- @src/argc/docs/specification.md - formal specification
