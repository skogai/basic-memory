---
name: argc
description: Create and manage argc-powered bash CLIs and Argcfile.sh task runners. Use when creating Argcfile.sh files, converting bash scripts to argc CLIs, adding argument parsing, shell completion, or task automation to projects.
permalink: skogai/tools/argc/skill
---

# argc skill

guide for using argc to build bash clis and task automation.

## when to use this skill

use when:

- creating a new `Argcfile.sh` for task automation
- converting a bash script to argc-powered cli
- adding argument parsing to bash scripts
- implementing shell completion
- debugging argc scripts
- working with argc comment tags (`@cmd`, `@arg`, `@option`, `@flag`)

## quick reference

**core tags:**

- `# @cmd` - define command/subcommand
- `# @arg name` - positional argument
- `# @option --name` - option argument
- `# @flag --name` - boolean flag
- `# @env VAR` - environment variable
- `# @describe` - description text

**modifiers:**

- `!` - required
- `*` - zero or more
- `+` - one or more required
- `=value` - default value
- `[a|b|c]` - choices
- `~` - catch all remaining

**variable access:**

- flags: `$argc_flag` (0 or 1)
- options/args: `$argc_name`
- multi-value: `${argc_name[@]}`

## creating argcfile.sh for a project

### workflow

1. **understand project needs:**

   - what tasks need automation? (build, test, deploy, etc.)
   - what parameters do tasks need?
   - are there task dependencies?

1. **create basic structure:**

   ```sh
   #!/usr/bin/env bash
   set -e

   # @cmd describe the task
   task_name() {
       echo "implementing task..."
   }

   eval "$(argc --argc-eval "$0" "$@")"
   ```

1. **add parameters to tasks:**

   - use `@flag` for boolean options
   - use `@option` for key-value pairs
   - use `@arg` for positional arguments
   - use `@env` for environment variables

1. **implement dependencies:**

   - call other tasks as functions
   - tasks run in order of calls

1. **test:**

   ```sh
   argc --help           # see all tasks
   argc task_name --help # see task options
   argc task_name        # run task
   ```

### example: node.js project

```sh
#!/usr/bin/env bash
set -e

# @cmd install dependencies
install() {
    npm install
}

# @cmd run development server
# @flag -w --watch  Enable watch mode
dev() {
    [[ $argc_watch -eq 1 ]] && flags="--watch" || flags=""
    npm run dev $flags
}

# @cmd run tests
# @flag -c --coverage  Generate coverage
test() {
    [[ $argc_coverage -eq 1 ]] && flags="--coverage" || flags=""
    jest $flags
}

# @cmd build for production
build() {
    test  # dependency - run tests first
    npm run build
}

eval "$(argc --argc-eval "$0" "$@")"
```

### example: rust project

```sh
#!/usr/bin/env bash
set -e

# @cmd build project
# @flag -r --release  Release build
build() {
    [[ $argc_release -eq 1 ]] && flags="--release" || flags=""
    cargo build $flags
}

# @cmd run tests
test() {
    cargo test
}

# @cmd run clippy
clippy() {
    cargo clippy --all-targets -- -D warnings
}

# @cmd full ci pipeline
ci() {
    clippy
    test
    build --release
}

eval "$(argc --argc-eval "$0" "$@")"
```

## converting bash script to argc cli

### workflow

1. **identify current arguments:**

   - what flags does the script accept?
   - what options?
   - what positional arguments?

1. **add argc tags:**

   - replace manual parsing with `@flag`, `@option`, `@arg` tags
   - add descriptions to each parameter
   - add `@describe` for script overview

1. **replace argument access:**

   - change `$1`, `$2`, etc. to `$argc_name`
   - change flag checks to `[[ $argc_flag -eq 1 ]]`
   - change multi-value to arrays: `${argc_args[@]}`

1. **add eval line:**

   ```sh
   eval "$(argc --argc-eval "$0" "$@")"
   ```

1. **test and refine:**

   - run with `--help` to see generated help
   - test all parameter combinations

### before (manual parsing):

```sh
#!/usr/bin/env bash

verbose=0
output=""
input=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--verbose) verbose=1; shift ;;
        -o|--output) output="$2"; shift 2 ;;
        *) input="$1"; shift ;;
    esac
done

[[ -z "$input" ]] && { echo "error: input required" >&2; exit 1; }

[[ $verbose -eq 1 ]] && echo "processing $input"
cat "$input" > "${output:-output.txt}"
```

### after (argc):

```sh
#!/usr/bin/env bash
# @describe Process text files

# @flag -v --verbose  Enable verbose output
# @option -o --output=output.txt  Output file
# @arg input!  Input file

eval "$(argc --argc-eval "$0" "$@")"

[[ $argc_verbose -eq 1 ]] && echo "processing $argc_input"
cat "$argc_input" > "$argc_output"
```

## nested commands

use `::` separator for command hierarchies:

```sh
#!/usr/bin/env bash

# @cmd
docker() { :; }

# @cmd start services
# @flag -d --detach  Run in background
docker::up() {
    [[ $argc_detach -eq 1 ]] && flags="-d" || flags=""
    docker-compose up $flags
}

# @cmd stop services
docker::down() {
    docker-compose down
}

# @cmd
docker::image() { :; }

# @cmd list images
docker::image::ls() {
    docker images
}

eval "$(argc --argc-eval "$0" "$@")"
```

usage:

```sh
argc docker up -d
argc docker down
argc docker image ls
```

**rules:**

- parent commands need `{ :; }` body
- use `::` to create hierarchy
- arbitrary nesting depth

## environment variables and secrets

### basic env vars

```sh
# @env API_KEY!  API key (required)
# @env PORT=3000  Server port (default: 3000)

eval "$(argc --argc-eval "$0" "$@")"

echo "connecting with key: ${argc_API_KEY:0:10}..."
echo "listening on port: $argc_PORT"
```

### dotenv support

```sh
# @meta dotenv
# @env DATABASE_URL!
# @env API_KEY!

eval "$(argc --argc-eval "$0" "$@")"
```

create `.env`:

```
DATABASE_URL=postgres://localhost/mydb
API_KEY=secret123
```

### binding to existing env vars

```sh
# @env DEBUG$$  Bind to $DEBUG
# @env TOKEN$API_TOKEN  Bind to $API_TOKEN
```

## common patterns

### build pipeline

```sh
# @cmd install dependencies
install() { npm install; }

# @cmd type check
typecheck() { tsc --noEmit; }

# @cmd lint code
lint() { eslint src/; }

# @cmd run tests
test() { jest; }

# @cmd build for production
build() {
    typecheck
    lint
    test
    npm run build
}

# @cmd full ci
ci() {
    install
    build
}
```

### confirmation prompts

```sh
# @cmd dangerous operation
# @flag -f --force  Skip confirmation
danger() {
    if [[ $argc_force -eq 0 ]]; then
        read -p "are you sure? (y/N) " -n 1 -r
        echo
        [[ ! $REPLY =~ ^[Yy]$ ]] && exit 0
    fi

    echo "executing dangerous operation..."
}
```

### multiple environments

```sh
# @cmd deploy
# @arg env[dev|staging|prod]!  Target environment
deploy() {
    source ".env.$argc_env"
    echo "deploying to $argc_env..."
}
```

## completion

argc scripts get automatic completion. for custom choices:

```sh
# @option --branch[`_choice_branches`]  Git branch

_choice_branches() {
    git branch -a | cut -c3-
}
```

**naming:** prefix with `_choice_`

**with descriptions:**

```sh
_choice_services() {
    cat <<-'EOF'
web	Web server (nginx)
db	Database (postgres)
cache	Redis cache
EOF
}
```

## debugging

**see parsed arguments:**

```sh
argc --argc-dump script.sh arg1 arg2 --flag
```

**see generated code:**

```sh
argc --argc-eval script.sh --help
```

**verbose mode:**

```sh
ARGC_VERBOSE=1 ./script.sh --help
```

## common mistakes

**wrong: missing eval**

```sh
# @flag -v
# continuing without eval...
# $argc_v won't exist ❌
```

**correct:**

```sh
# @flag -v
eval "$(argc --argc-eval "$0" "$@")"
# now $argc_v exists ✓
```

**wrong: string comparison for flags**

```sh
[[ "$argc_verbose" == "1" ]]  # string ❌
```

**correct:**

```sh
[[ $argc_verbose -eq 1 ]]  # numeric ✓
```

**wrong: multi-value without modifier**

```sh
# @arg files
# only gets first file ❌
```

**correct:**

```sh
# @arg files*
# gets all files as array ✓
```

## checklist for new argcfile.sh

when creating `Argcfile.sh`:

- [ ] starts with `#!/usr/bin/env bash`
- [ ] includes `set -e` for fail-fast
- [ ] all tasks have `@cmd` tags with descriptions
- [ ] parameters use appropriate tags (`@flag`, `@option`, `@arg`, `@env`)
- [ ] dependencies are function calls
- [ ] ends with `eval "$(argc --argc-eval "$0" "$@")"`
- [ ] tested with `argc --help`
- [ ] tested with `argc task_name --help`
- [ ] all tasks execute correctly

## checklist for argc cli script

when creating argc cli:

- [ ] starts with `#!/usr/bin/env bash`
- [ ] includes `# @describe` at top
- [ ] all parameters documented with tags
- [ ] required params marked with `!`
- [ ] defaults provided where appropriate
- [ ] ends with `eval "$(argc --argc-eval "$0" "$@")"`
- [ ] uses `$argc_*` variables (not `$1`, `$2`)
- [ ] flags tested with `-eq 1` (not string comparison)
- [ ] tested with `--help`
- [ ] tested with various parameter combinations

## skogai conventions

when working in skogai projects, follow these conventions:

### naming and style

- **lowercase everything:** task names, options, flags, args
- **kebab-case for multi-word:** `--output-file` not `--output_file`
- **minimal comments:** argc tags document the interface
- **data flow over control flow:** express as transformations

### typical skogai argcfile structure

```sh
#!/usr/bin/env bash
# @meta version 1.0.0
# @meta dotenv
set -e

# @cmd install dependencies
install() {
    npm install
}

# @cmd run development environment
# @flag -w --watch  enable watch mode
dev() {
    [[ $argc_watch -eq 1 ]] && flags="--watch" || flags=""
    npm run dev $flags
}

# @cmd run tests
# @flag -c --coverage  generate coverage
test() {
    [[ $argc_coverage -eq 1 ]] && flags="--coverage" || flags=""
    npm test $flags
}

# @cmd lint and format
lint() {
    npm run lint
}

# @cmd build for production
build() {
    test
    lint
    npm run build
}

# @cmd full ci pipeline
ci() {
    install
    build
}

# @cmd clean generated files
clean() {
    rm -rf dist/ node_modules/ coverage/
}

eval "$(argc --argc-eval "$0" "$@")"
```

### skogai task categories

organize tasks by function:

- `install` - dependency installation
- `dev` - development server
- `test` - test execution
- `lint` - linting/formatting
- `build` - production builds
- `ci` - full ci pipeline
- `clean` - cleanup
- `deploy::*` - deployment tasks (nested)
- `db::*` - database tasks (nested)
- `docker::*` - docker tasks (nested)

### environment management

use dotenv with environment-specific overrides:

```sh
# @meta dotenv
# @cmd deploy
# @arg env[dev|staging|prod]!  target environment
deploy() {
    [[ -f ".env.$argc_env" ]] && source ".env.$argc_env"
    echo "deploying to $argc_env..."
}
```

file structure:

```
.env          # default/development
.env.staging  # staging overrides
.env.prod     # production overrides
```

### skogai-specific workflows

**skill management:**

```sh
# @cmd
skill() { :; }

# @cmd create new skill
# @arg name!  skill name
skill::create() {
    mkdir -p ".claude/skills/$argc_name"
    # create SKILL.md template
}
```

**agent workflows:**

```sh
# @cmd
agent() { :; }

# @cmd run agent with task
# @arg agent-type[explore|plan|code-reviewer]!  agent type
# @arg prompt!  task prompt
agent::run() {
    echo "running $argc_agent_type agent..."
}
```

for complete skogai patterns see: @docs/tools/argc/skogai-patterns.md

## documentation references

comprehensive documentation available at:

- overview: @docs/tools/argc/index.md
- getting started: @docs/tools/argc/getting-started.md
- cli authoring: @docs/tools/argc/cli-authoring.md
- task automation: @docs/tools/argc/task-automation.md
- reference: @docs/tools/argc/reference.md
- completions: @docs/tools/argc/completions.md
- examples: @docs/tools/argc/examples.md
- skogai patterns: @docs/tools/argc/skogai-patterns.md

upstream sources:

- source: @src/argc
- completions: @src/argc-completions
- examples: @src/argc/examples/
