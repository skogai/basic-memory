---
title: argc task automation
type: tool
permalink: docs/tools/argc/task-automation.md
tags: [argc, argcfile, task-runner, automation]
---

# task automation with argcfile.sh

argc doubles as a command runner similar to make/just through `Argcfile.sh` files.

## basic argcfile.sh

create `Argcfile.sh` in your project root:

```sh
#!/usr/bin/env bash
set -e

# @cmd build the project
build() {
    echo "building..."
    cargo build --release
}

# @cmd run tests
test() {
    echo "running tests..."
    cargo test
}

# @cmd clean build artifacts
clean() {
    echo "cleaning..."
    cargo clean
}

eval "$(argc --argc-eval "$0" "$@")"
```

run tasks:

```sh
argc build
argc test
argc clean
argc --help  # see all tasks
```

## why argcfile.sh?

**advantages over make:**

- real bash functions (not make's weird syntax)
- proper argument parsing
- automatic help generation
- cross-platform (make varies on macos/linux/bsd)
- better error handling

**advantages over just:**

- pure bash (no new syntax to learn)
- full bash ecosystem available
- better shell integration

## argcfile.sh features

### auto-cd to project root

argc automatically changes to the directory containing `Argcfile.sh`:

```sh
# in /home/user/project/Argcfile.sh
# @cmd show working directory
pwd_task() {
    pwd  # always shows /home/user/project
}

# run from anywhere:
# cd /tmp
# argc pwd_task  # still shows /home/user/project
```

available variables:

- `$ARGC_PWD` - original directory where argc was invoked
- `$PWD` - project root (where Argcfile.sh lives)

### task dependencies

call other tasks as functions:

```sh
# @cmd build the project
build() {
    echo "compiling..."
}

# @cmd run tests (builds first)
test() {
    build  # dependency
    echo "testing..."
}

# @cmd deploy (tests first)
deploy() {
    test  # runs test, which runs build
    echo "deploying..."
}
```

dependencies are just function calls - simple and explicit.

### task parameters

tasks can accept arguments, options, and flags:

```sh
# @cmd run development server
# @flag -w --watch  Enable watch mode
# @option --port=3000  Server port
# @arg env[dev|staging|prod]=dev  Environment
dev() {
    echo "starting server on port $argc_port"
    echo "environment: $argc_env"
    [[ $argc_watch -eq 1 ]] && echo "watch mode enabled"
}

# usage:
# argc dev
# argc dev prod --port 8080 --watch
```

### environment variables

```sh
# @cmd deploy to production
# @env DEPLOY_KEY!  Deployment key (required)
# @env DEPLOY_HOST=prod.example.com  Target host
deploy() {
    echo "deploying to $argc_DEPLOY_HOST"
    echo "using key: ${argc_DEPLOY_KEY:0:10}..."
}

# usage:
# DEPLOY_KEY=secret123 argc deploy
# DEPLOY_KEY=secret123 DEPLOY_HOST=staging.example.com argc deploy
```

### dotenv support

```sh
# @meta dotenv

# @cmd deploy
# @env DEPLOY_KEY!
# @env API_URL!
deploy() {
    echo "deploying to $argc_API_URL"
}
```

create `.env` file:

```sh
DEPLOY_KEY=secret123
API_URL=https://api.example.com
```

### task groups (nested commands)

organize tasks into namespaces:

```sh
#!/usr/bin/env bash
set -e

# @cmd
docker() { :; }

# @cmd start docker services
# @flag -d --detach  Run in background
docker::up() {
    [[ $argc_detach -eq 1 ]] && flags="-d" || flags=""
    docker-compose up $flags
}

# @cmd stop docker services
docker::down() {
    docker-compose down
}

# @cmd
db() { :; }

# @cmd migrate database
# @arg version  Target version
db::migrate() {
    [[ -n "$argc_version" ]] && target="--target $argc_version" || target=""
    migrate up $target
}

# @cmd seed database
db::seed() {
    ./scripts/seed.sh
}

eval "$(argc --argc-eval "$0" "$@")"
```

usage:

```sh
argc docker up --detach
argc docker down
argc db migrate
argc db migrate 20231201
argc db seed
```

### private tasks

prefix with `_` to hide from help:

```sh
# @cmd public task
public_task() {
    _helper  # can call private tasks
}

# private task (not shown in --help)
_helper() {
    echo "internal helper"
}
```

`_helper` is callable but won't appear in `argc --help`.

## common patterns

### build pipeline

```sh
# @cmd install dependencies
install() {
    npm install
}

# @cmd type check
typecheck() {
    tsc --noEmit
}

# @cmd lint code
lint() {
    eslint src/
}

# @cmd run tests
# @flag -w --watch  Watch mode
test() {
    [[ $argc_watch -eq 1 ]] && flags="--watch" || flags=""
    jest $flags
}

# @cmd build for production
build() {
    typecheck
    lint
    test
    npm run build
}

# @cmd full ci pipeline
ci() {
    install
    build
}
```

### environment management

```sh
# @cmd
env() { :; }

# @cmd switch to development
env::dev() {
    ln -sf .env.dev .env
    echo "switched to development"
}

# @cmd switch to staging
env::staging() {
    ln -sf .env.staging .env
    echo "switched to staging"
}

# @cmd switch to production
env::prod() {
    ln -sf .env.prod .env
    echo "switched to production"
}

# @cmd show current environment
env::show() {
    if [[ -L .env ]]; then
        echo "current: $(readlink .env)"
    else
        echo "no environment active"
    fi
}
```

### docker orchestration

```sh
# @cmd
docker() { :; }

# @cmd build docker images
# @flag --no-cache  Build without cache
docker::build() {
    [[ $argc_no_cache -eq 1 ]] && flags="--no-cache" || flags=""
    docker-compose build $flags
}

# @cmd start all services
# @flag -d --detach  Run in background
docker::up() {
    docker::build
    [[ $argc_detach -eq 1 ]] && flags="-d" || flags=""
    docker-compose up $flags
}

# @cmd stop all services
docker::down() {
    docker-compose down
}

# @cmd view logs
# @arg service  Specific service (optional)
# @flag -f --follow  Follow logs
docker::logs() {
    [[ $argc_follow -eq 1 ]] && flags="-f" || flags=""
    docker-compose logs $flags ${argc_service}
}

# @cmd execute command in service
# @arg service!  Service name
# @arg cmd~  Command to execute
docker::exec() {
    docker-compose exec $argc_service ${argc_cmd[@]}
}
```

usage:

```sh
argc docker build --no-cache
argc docker up -d
argc docker logs web -f
argc docker exec web bash
```

### release workflow

```sh
# @cmd prepare release
# @arg version!  Version number (semver)
release() {
    # validate version
    if [[ ! "$argc_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "error: invalid version format (use semver: 1.2.3)" >&2
        exit 1
    fi

    # update version
    sed -i "s/version = \".*\"/version = \"$argc_version\"/" Cargo.toml

    # run full build
    ci

    # tag release
    git tag "v$argc_version"

    echo "release $argc_version prepared"
    echo "run: git push && git push --tags"
}
```

### database tasks

```sh
# @cmd
db() { :; }

# @cmd create database
db::create() {
    createdb myapp_dev
}

# @cmd drop database
# @flag -f --force  Skip confirmation
db::drop() {
    if [[ $argc_force -eq 1 ]]; then
        dropdb myapp_dev
    else
        read -p "drop database myapp_dev? (y/N) " -n 1 -r
        echo
        [[ $REPLY =~ ^[Yy]$ ]] && dropdb myapp_dev
    fi
}

# @cmd reset database
db::reset() {
    db::drop --force
    db::create
    db::migrate
    db::seed
}

# @cmd run migrations
# @arg direction[up|down]=up  Migration direction
# @arg steps=1  Number of steps
db::migrate() {
    migrate $argc_direction $argc_steps
}

# @cmd seed database
db::seed() {
    psql myapp_dev < seeds.sql
}
```

## advanced features

### parallel execution

```sh
# @cmd run linters in parallel
lint() {
    local pids=()

    eslint src/ & pids+=($!)
    stylelint styles/ & pids+=($!)
    tsc --noEmit & pids+=($!)

    for pid in "${pids[@]}"; do
        wait $pid || exit 1
    done
}
```

### conditional tasks

```sh
# @cmd build if needed
# @arg target!  Build target
smart_build() {
    if [[ -f "dist/$argc_target" ]] && \
       [[ "src/$argc_target" -ot "dist/$argc_target" ]]; then
        echo "$argc_target is up to date"
    else
        echo "building $argc_target..."
        # build logic
    fi
}
```

### task timing

```sh
# @cmd run with timing
# @arg task!  Task to run
timed() {
    local start=$(date +%s)

    $argc_task

    local end=$(date +%s)
    local duration=$((end - start))
    echo "task completed in ${duration}s"
}
```

### watching for changes

```sh
# @cmd watch and rebuild
# @flag --poll  Use polling instead of inotify
watch() {
    if [[ $argc_poll -eq 1 ]]; then
        flags="--poll"
    fi

    while true; do
        build
        inotifywait $flags -r -e modify src/ || sleep 1
    done
}
```

## best practices

1. **always set -e** - fail fast on errors
1. **document tasks** - use `@describe` for complex tasks
1. **explicit dependencies** - call functions, don't duplicate code
1. **validate inputs** - check arguments before expensive operations
1. **provide defaults** - use `=value` for sensible defaults
1. **group related tasks** - use nested commands (`db::migrate`)
1. **hide helpers** - prefix with `_` for internal functions
1. **use env vars** - for secrets and configuration
1. **leverage dotenv** - avoid hardcoding credentials
1. **test locally** - run `argc --help` to verify task structure

## migrating from make

**makefile:**

```make
.PHONY: build test clean

build:
	cargo build --release

test: build
	cargo test

clean:
	cargo clean
```

**argcfile.sh:**

```sh
#!/usr/bin/env bash
set -e

# @cmd build the project
build() {
    cargo build --release
}

# @cmd run tests
test() {
    build
    cargo test
}

# @cmd clean artifacts
clean() {
    cargo clean
}

eval "$(argc --argc-eval "$0" "$@")"
```

key differences:

- no `.PHONY` needed
- dependencies are function calls
- proper bash syntax throughout
- automatic argument parsing

## debugging

**list all tasks:**

```sh
argc --help
```

**see what argc parses:**

```sh
argc --argc-dump Argcfile.sh task_name arg1 arg2
```

**verbose mode:**

```sh
ARGC_VERBOSE=1 argc build
```

**dry run pattern:**

```sh
# @cmd deploy
# @flag -n --dry-run  Show what would happen
deploy() {
    if [[ $argc_dry_run -eq 1 ]]; then
        echo "would deploy to production"
        return
    fi
    echo "deploying..."
}
```

## references

- @docs/tools/argc/cli-authoring.md - understand argc tag system
- @docs/tools/argc/reference.md - complete tag reference
- @src/argc/docs/command-runner.md - upstream documentation
- @src/argc-completions/Argcfile.sh - real-world example (1000+ completion management)
