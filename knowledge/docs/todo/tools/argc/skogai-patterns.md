---
title: argc skogai patterns
type: tool
permalink: docs/tools/argc/skogai-patterns.md
tags: [argc, skogai, patterns, conventions]
---

# argc in skogai

skogai-specific patterns and conventions for using argc.

## skogai conventions

### file naming

- argcfile: `Argcfile.sh` (capital A)
- cli scripts: lowercase with hyphens: `tool-name.sh`
- helper scripts: prefix with underscore: `_helper.sh`

### project structure

```
project/
├── Argcfile.sh           # task automation
├── scripts/
│   ├── deploy.sh         # argc-powered scripts
│   └── _helpers.sh       # sourced utilities
└── .env                  # environment config
```

### coding style

**lowercase everything:**

```sh
# @cmd build the project
build() {
    echo "building..."
}

# @option --output-file  output file
# @flag --dry-run  dry run mode
```

**minimal comments:**

- argc tags serve as documentation
- only comment complex logic
- no ascii art or decorative comments

**kebab-case for multi-word:**

```sh
# @option --output-file  not --outputFile or --output_file
# @arg source-dir!  not sourceDir or source_dir
```

## common skogai argcfile patterns

### typical skogai argcfile.sh

```sh
#!/usr/bin/env bash
set -e

# @cmd install dependencies
install() {
    echo "installing dependencies..."
    npm install
}

# @cmd run development environment
# @flag -w --watch  enable watch mode
dev() {
    [[ $argc_watch -eq 1 ]] && flags="--watch" || flags=""
    npm run dev $flags
}

# @cmd run tests
# @flag -c --coverage  generate coverage report
# @arg pattern  test pattern
test() {
    local args=""
    [[ $argc_coverage -eq 1 ]] && args="--coverage"
    [[ -n "$argc_pattern" ]] && args="$args $argc_pattern"
    npm test $args
}

# @cmd build for production
build() {
    test
    npm run build
}

# @cmd lint and format
lint() {
    npm run lint
}

# @cmd full ci pipeline
ci() {
    install
    lint
    test --coverage
    build
}

# @cmd clean generated files
clean() {
    rm -rf dist/ node_modules/ coverage/
}

eval "$(argc --argc-eval "$0" "$@")"
```

### placeholder system integration

argc integrates with skogai's placeholder system:

```sh
#!/usr/bin/env bash
# @meta version 1.0.0
# @describe [$placeholder:project-name] task automation

# @cmd build [$placeholder:project-name]
build() {
    echo "building [$placeholder:project-name]..."
}

eval "$(argc --argc-eval "$0" "$@")"
```

placeholders get resolved by `skogparse` during execution.

### data flow patterns

express tasks as data transformations:

```sh
# @cmd process data pipeline
# @arg input!  input file
# @arg output!  output file
# @option --format[json|yaml|toml]=json  output format
pipeline() {
    # data flow: input → parse → transform → format → output
    cat "$argc_input" \
        | jq '.' \
        | transform_data \
        | format_output "$argc_format" \
        > "$argc_output"
}

transform_data() {
    jq 'map(select(.active == true))'
}

format_output() {
    case $1 in
        json) jq '.' ;;
        yaml) yq eval -P ;;
        toml) yq eval -o=toml ;;
    esac
}
```

## skogai task naming

### task categories

**build tasks:**

```sh
# @cmd build project
build() { :; }

# @cmd build for development
build-dev() { :; }

# @cmd build for production
build-prod() { :; }
```

**test tasks:**

```sh
# @cmd run all tests
test() { :; }

# @cmd run unit tests
test-unit() { :; }

# @cmd run integration tests
test-integration() { :; }
```

**development tasks:**

```sh
# @cmd start development server
dev() { :; }

# @cmd watch and rebuild
watch() { :; }
```

**maintenance tasks:**

```sh
# @cmd clean generated files
clean() { :; }

# @cmd update dependencies
update() { :; }
```

### nested task structure

organize related tasks:

```sh
# @cmd
db() { :; }

# @cmd migrate database
db::migrate() { :; }

# @cmd seed database
db::seed() { :; }

# @cmd reset database
db::reset() { :; }

# @cmd
docker() { :; }

# @cmd start docker services
docker::up() { :; }

# @cmd stop docker services
docker::down() { :; }
```

## environment management

### dotenv pattern

```sh
# @meta dotenv

# @cmd deploy
# @arg env[dev|staging|prod]!  target environment
# @env DEPLOY_KEY!  deployment key
deploy() {
    # load env-specific overrides
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

### explicit environment

```sh
# @cmd run command in environment
# @arg env[dev|staging|prod]!  environment
# @arg cmd~  command to run
run-in-env() {
    ENV=$argc_env ${argc_cmd[@]}
}
```

## skogai-specific workflows

### documentation generation

```sh
# @cmd generate documentation
# @flag --api  generate api docs
# @flag --readme  update readme
docs() {
    [[ $argc_api -eq 1 ]] && generate_api_docs
    [[ $argc_readme -eq 1 ]] && update_readme
}

generate_api_docs() {
    echo "generating api documentation..."
    # implementation
}

update_readme() {
    echo "updating readme..."
    # implementation
}
```

### skill management

```sh
# @cmd
skill() { :; }

# @cmd create new skill
# @arg name!  skill name
skill::create() {
    mkdir -p ".claude/skills/$argc_name"
    # create SKILL.md template
}

# @cmd test skill
# @arg name!  skill name
skill::test() {
    echo "testing skill: $argc_name"
    # test implementation
}

# @cmd validate skill
# @arg name!  skill name
skill::validate() {
    # validate SKILL.md frontmatter and content
    echo "validating skill: $argc_name"
}
```

### agent workflows

```sh
# @cmd
agent() { :; }

# @cmd run agent with task
# @arg agent-type[explore|plan|code-reviewer]!  agent type
# @arg prompt!  task prompt
agent::run() {
    echo "running $argc_agent_type agent..."
    # implementation
}

# @cmd test agent configuration
# @arg agent-name!  agent name
agent::test() {
    echo "testing agent: $argc_agent_name"
    # test implementation
}
```

## integration patterns

### with skogparse

```sh
# @cmd parse and execute
# @arg expression!  skogparse expression
parse() {
    result=$(skogparse "$argc_expression")
    echo "result: $result"
}
```

### with skogai projects

```sh
# @cmd sync with skogai
sync() {
    echo "syncing with skogai..."
    # sync implementation
}

# @cmd validate against skogai schema
validate() {
    echo "validating..."
    # validation logic
}
```

## best practices for skogai

1. **lowercase everything** - task names, options, flags, args
1. **kebab-case for multi-word** - `output-file` not `output_file`
1. **minimal comments** - argc tags document the interface
1. **data flow over control flow** - express as transformations
1. **explicit dependencies** - call tasks as functions
1. **environment via .env** - use `@meta dotenv` + `.env` files
1. **grouped tasks** - use `::` for related commands
1. **fail fast** - always `set -e` at top
1. **sensible defaults** - provide defaults with `=value`
1. **test frequently** - run `argc --help` and `argc task --help`

## anti-patterns to avoid

**don't: uppercase or mixed case**

```sh
# @cmd Build  ❌
Build() { :; }
```

**do: lowercase**

```sh
# @cmd build  ✓
build() { :; }
```

**don't: snake_case**

```sh
# @option --output_file  ❌
```

**do: kebab-case**

```sh
# @option --output-file  ✓
```

**don't: unnecessary comments**

```sh
# this builds the project
# it runs tests first
# then it compiles everything
# @cmd build project  ❌
build() { :; }
```

**do: let tags document**

```sh
# @cmd build project (runs tests first)  ✓
build() {
    test
    compile
}
```

**don't: complex control flow**

```sh
# @cmd process  ❌
process() {
    if [[ condition ]]; then
        if [[ another ]]; then
            # nested logic
        fi
    else
        # more branching
    fi
}
```

**do: small functions, clear flow**

```sh
# @cmd process  ✓
process() {
    validate_input || return 1
    transform_data
    write_output
}
```

## example: complete skogai argcfile

```sh
#!/usr/bin/env bash
# @describe skogai project automation
# @meta version 1.0.0
# @meta dotenv
set -e

# @cmd install dependencies
install() {
    npm install
}

# @cmd run development server
# @flag -w --watch  enable watch mode
# @option --port=3000  server port
dev() {
    [[ $argc_watch -eq 1 ]] && flags="--watch" || flags=""
    PORT=$argc_port npm run dev $flags
}

# @cmd run tests
# @flag -c --coverage  generate coverage
# @arg pattern  test pattern
test() {
    local args=""
    [[ $argc_coverage -eq 1 ]] && args="--coverage"
    [[ -n "$argc_pattern" ]] && args="$args $argc_pattern"
    npm test $args
}

# @cmd lint code
# @flag -f --fix  auto-fix issues
lint() {
    [[ $argc_fix -eq 1 ]] && flags="--fix" || flags=""
    npm run lint $flags
}

# @cmd build for production
build() {
    test
    lint
    npm run build
}

# @cmd clean generated files
clean() {
    rm -rf dist/ coverage/ node_modules/
}

# @cmd full ci pipeline
ci() {
    install
    lint
    test --coverage
    build
}

# @cmd
deploy() { :; }

# @cmd deploy to environment
# @arg env[dev|staging|prod]!  target environment
# @env DEPLOY_KEY!  deployment key
deploy::run() {
    [[ -f ".env.$argc_env" ]] && source ".env.$argc_env"

    build
    echo "deploying to $argc_env..."
    # deployment logic
}

# @cmd show deployment status
# @arg env[dev|staging|prod]=dev  environment
deploy::status() {
    echo "checking status for $argc_env..."
    # status check logic
}

eval "$(argc --argc-eval "$0" "$@")"
```

## references

- argc documentation: @docs/tools/argc/index.md
- skogai concepts: @docs/skogai/concepts/
- user conventions: @docs/skogix/user.md
