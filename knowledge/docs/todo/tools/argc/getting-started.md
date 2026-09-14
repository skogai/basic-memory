---
title: argc getting started
type: tool
permalink: docs/tools/argc/getting-started.md
tags: [argc, getting-started, installation]
---

# getting started with argc

## installation

argc is pre-installed and available at:

- binary: `argc` (check with `which argc`)
- source: `@src/argc` → `/home/skogix/.local/src/argc`
- completions: `@src/argc-completions` → `/home/skogix/.local/src/argc-completions`

verify installation:

```sh
argc --version  # should show: argc 1.23.0
```

## first steps

### 1. create your first cli script

create `hello.sh`:

```sh
#!/usr/bin/env bash
# @describe a friendly greeting tool

# @option --name=World  Name to greet
# @flag -l --loud       Shout the greeting

eval "$(argc --argc-eval "$0" "$@")"

greeting="hello, $argc_name!"
[[ $argc_loud -eq 1 ]] && greeting="${greeting^^}"

echo "$greeting"
```

make it executable and run:

```sh
chmod +x hello.sh
./hello.sh                  # hello, World!
./hello.sh --name Alice     # hello, Alice!
./hello.sh --name Bob -l    # HELLO, BOB!
```

automatic help:

```sh
./hello.sh --help
```

### 2. create your first argcfile.sh

create `Argcfile.sh` in your project:

```sh
#!/usr/bin/env bash
set -e

# @cmd build the project
build() {
    echo "building..."
    # your build commands here
}

# @cmd run development server
# @flag -w --watch  Enable watch mode
dev() {
    if [[ $argc_watch -eq 1 ]]; then
        echo "starting dev server with watch..."
    else
        echo "starting dev server..."
    fi
}

# @cmd run all tests
# @flag -v --verbose  Verbose output
test() {
    build  # run build first
    echo "running tests..."
    [[ $argc_verbose -eq 1 ]] && echo "verbose mode enabled"
}

eval "$(argc --argc-eval "$0" "$@")"
```

run tasks:

```sh
argc build              # build the project
argc dev --watch        # start dev server with watch
argc test -v            # run tests verbosely
argc --help             # see all available tasks
```

## shell integration

### enable completion

for bash (add to `~/.bashrc`):

```sh
eval "$(argc --argc-completions bash)"
```

for zsh (add to `~/.zshrc`):

```sh
eval "$(argc --argc-completions zsh)"
```

for fish (add to `~/.config/fish/config.fish`):

```sh
argc --argc-completions fish | source
```

### completion for argc-powered scripts

any script using argc automatically gets completion:

```sh
./hello.sh <TAB>        # shows --name, --loud, --help
argc <TAB>              # shows all Argcfile.sh commands
```

## next steps

- @docs/tools/argc/cli-authoring.md - learn to build complex clis
- @docs/tools/argc/task-automation.md - master argcfile.sh patterns
- @docs/tools/argc/reference.md - explore all tags and modifiers
- @docs/tools/argc/examples.md - see real-world patterns

## common patterns

**required argument:**

```sh
# @arg input!  Input file (required)
```

**multi-value argument:**

```sh
# @arg files*  Files to process
# access: ${argc_files[@]}
```

**choices:**

```sh
# @option --format[json|yaml|toml]=json  Output format
```

**environment variable:**

```sh
# @env API_KEY!  API key (required from env)
```

**nested commands:**

```sh
# @cmd
db() { :; }
# @cmd migrate database
db::migrate() { echo "migrating..."; }
# @cmd seed database
db::seed() { echo "seeding..."; }

# usage: argc db migrate
```

## debugging

**see parsed arguments:**

```sh
argc --argc-dump script.sh arg1 arg2
```

**verbose mode:**

```sh
ARGC_VERBOSE=1 ./script.sh --help
```

**check what argc sees:**

```sh
argc --argc-eval script.sh --help  # see generated shell code
```

## references

- upstream docs: `@src/argc/README.md`
- specification: `@src/argc/docs/specification.md`
- examples: `@src/argc/examples/`
