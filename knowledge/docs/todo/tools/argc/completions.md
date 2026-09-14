---
title: argc completions
type: tool
permalink: docs/tools/argc/completions.md
tags: [argc, completions, shell, autocomplete]
---

# argc shell completions

argc provides comprehensive shell completion support across multiple shells and includes 1000+ pre-built completion scripts.

## automatic completion for argc scripts

any script using argc automatically gets completion - no additional work needed.

### enable argc completion globally

**bash** (add to `~/.bashrc`):

```sh
eval "$(argc --argc-completions bash)"
```

**zsh** (add to `~/.zshrc`):

```sh
eval "$(argc --argc-completions zsh)"
```

**fish** (add to `~/.config/fish/config.fish`):

```sh
argc --argc-completions fish | source
```

**powershell** (add to profile):

```powershell
argc --argc-completions powershell | Out-String | Invoke-Expression
```

**nushell** (add to `config.nu`):

```nu
argc --argc-completions nushell | save completion-menu.nu
source completion-menu.nu
```

once enabled, all argc-powered scripts get automatic completion:

```sh
./my-script.sh <TAB>      # completes flags, options, args
argc <TAB>                # completes Argcfile.sh commands
```

## completion features

### parameter completion

argc automatically completes:

- flags: `-v`, `--verbose`
- options: `--output`, `--format`
- arguments: based on type hints
- commands: all defined `@cmd` tags
- choices: values from `[a|b|c]` or dynamic functions

### type-based completion

use `<TYPE>` hints for smart completion:

```sh
# @option --file <FILE>       # completes files
# @option --dir <DIR>         # completes directories
# @option --command <COMMAND> # completes commands
# @option --user <USER>       # completes users
# @option --group <GROUP>     # completes groups
# @option --host <HOST>       # completes hostnames
```

### static choices

```sh
# @option --format[json|yaml|toml]
# script.sh --format <TAB>
# shows: json  yaml  toml
```

### dynamic choices

use backticks or choice functions:

```sh
# @option --branch[`git branch -a | cut -c3-`]
# script.sh --branch <TAB>
# shows actual branches

# @option --service[`_choice_services`]

_choice_services() {
    docker-compose config --services 2>/dev/null
}
```

## argc-completions project

pre-built completion scripts for 1000+ commands.

### location

- source: `@src/argc-completions`
- completions: `@src/argc-completions/completions/`
- examples: git, cargo, npm, docker, kubectl, terraform, aws, gcloud, etc.

### using pre-built completions

completions are automatically available if argc-completions is in your PATH.

check available completions:

```sh
ls @src/argc-completions/completions/
```

use a completion:

```sh
source <(argc --argc-completions bash git)
git <TAB>  # enhanced completion
```

### major available completions

**development tools:**

- git, cargo, npm, yarn, pnpm, pip, poetry, maven, gradle

**cloud platforms:**

- aws, gcloud, azure, terraform, kubectl, helm, docker

**system tools:**

- systemctl, journalctl, ssh, scp, rsync, tar

**databases:**

- psql, mysql, redis-cli, mongodb

see full list: `@src/argc-completions/MANIFEST.md`

## creating custom completions

### basic completion function

```sh
# @option --file[`_choice_txt_files`]

_choice_txt_files() {
    ls *.txt 2>/dev/null
}
```

**naming convention:** `_choice_<name>`

### contextual completion

access current command state via `ARGC_CWORD` and `argc_*` variables:

```sh
# @option --format[json|yaml|toml]
# @option --file[`_choice_files`]

_choice_files() {
    case ${argc_format:-json} in
        json) ls *.json ;;
        yaml) ls *.{yml,yaml} ;;
        toml) ls *.toml ;;
    esac
}
```

### completion with descriptions

```sh
_choice_services() {
    cat <<-'EOF'
web	Web server (nginx)
db	Database (postgres)
cache	Redis cache
worker	Background worker
EOF
}
```

format: `value<TAB>description`

### conditional completion

```sh
_choice_environments() {
    # only show prod if user has permission
    if [[ -f ~/.prod-access ]]; then
        echo dev
        echo staging
        echo prod
    else
        echo dev
        echo staging
    fi
}
```

### nested command completion

argc handles nested command completion automatically:

```sh
# @cmd
docker() { :; }
# @cmd
docker::image() { :; }
# @cmd list images
docker::image::ls() { :; }

# completion works:
# script.sh d<TAB>           → docker
# script.sh docker i<TAB>    → image
# script.sh docker image l<TAB> → ls
```

## advanced completion patterns

### delegating completion

delegate to another command's completion:

```sh
# @arg docker_args~[`_choice_docker`]

_choice_docker() {
    # delegate to docker's own completion
    _argc_util_comp_subcommand docker
}
```

requires `_argc_util_comp_subcommand` from argc-completions utils.

### key-value completion

```sh
# @option --label*,[`_choice_labels`]

_choice_labels() {
    _argc_util_comp_kv =
    if [[ -n "$ARGC_CWORD" ]]; then
        # completing value after =
        case "${ARGC_CWORD%%=*}" in
            env) echo dev; echo staging; echo prod ;;
            region) echo us-east-1; echo us-west-2 ;;
        esac
    else
        # completing key
        echo env=
        echo region=
        echo version=
    fi
}
```

### multi-part completion

```sh
# @option --endpoint[`_choice_endpoint`]

_choice_endpoint() {
    if _argc_util_has_path_prefix; then
        # completing path part
        echo /api/users
        echo /api/posts
        echo /health
    else
        # completing host part
        echo http://localhost:3000
        echo https://api.example.com
    fi
}
```

### parallel completion

speed up slow completions:

```sh
# @option --pkg[`_choice_packages`]

_choice_packages() {
    _argc_util_parallel _choice_npm_packages _choice_cargo_packages ::: \
        _choice_pip_packages
}

_choice_npm_packages() {
    npm search --json "$ARGC_CWORD" 2>/dev/null | jq -r '.[].name'
}

_choice_cargo_packages() {
    cargo search "$ARGC_CWORD" 2>/dev/null | cut -d' ' -f1
}

_choice_pip_packages() {
    pip search "$ARGC_CWORD" 2>/dev/null | cut -d' ' -f1
}
```

## completion utilities

argc-completions provides utility functions:

### available utilities

located at `@src/argc-completions/utils/_argc_utils.sh`:

- `_argc_util_comp_subcommand` - delegate to another command
- `_argc_util_comp_kv` - key-value pair completion
- `_argc_util_comp_parts` - multi-part completion (host:port, user@host)
- `_argc_util_parallel` - run completions in parallel
- `_argc_util_mode_kv` - detect kv completion mode
- `_argc_util_has_path_prefix` - check for path prefix

### using utilities in custom scripts

source the utilities:

```sh
#!/usr/bin/env bash
source @src/argc-completions/utils/_argc_utils.sh

# @option --server[`_choice_servers`]

_choice_servers() {
    _argc_util_comp_parts @ :
    if [[ -n "$argc__parts_left" ]]; then
        # completing user part
        echo admin
        echo deploy
    else
        # completing host part
        echo server1.example.com
        echo server2.example.com
    fi
}

eval "$(argc --argc-eval "$0" "$@")"
```

## debugging completions

### test completion output

```sh
# see what completions are generated:
ARGC_COMPGEN=1 ./script.sh --option <CURRENT_WORD>
```

### verbose completion

```sh
# see completion process:
ARGC_VERBOSE=1 ./script.sh <TAB>
```

### check choice function

run the choice function directly:

```sh
# source the script
source ./script.sh

# run choice function
_choice_my_options
```

### dump completion state

```sh
# @option --test[`_choice_debug`]

_choice_debug() {
    echo "ARGC_CWORD: $ARGC_CWORD" >&2
    echo "ARGC_LAST: $ARGC_LAST" >&2
    echo "current vars:" >&2
    set | grep "^argc_" >&2

    # actual completions
    echo option1
    echo option2
}
```

## generating completions

### for custom commands

generate a completion script:

```sh
argc --argc-completions bash my-tool.sh > my-tool-completion.bash
source my-tool-completion.bash
```

### for system commands

argc-completions includes a generator for any command with `--help`:

```sh
cd @src/argc-completions
argc generate my-command
# creates: completions/my-command.sh
```

see `@src/argc-completions/docs/generate.md` for details.

## completion behavior

### when completions run

completions run during:

- `<TAB>` key press
- automatic completion display (depends on shell config)

### completion context

during completion, argc sets:

- `$ARGC_COMPGEN=1` - indicates completion mode
- `$ARGC_CWORD` - current word being completed
- `$ARGC_LAST` - last completed argument
- `$argc_*` - already parsed arguments

### completion performance

**fast completions:**

- static choices: instant
- simple commands: instant
- file/directory: near-instant

**slow completions:**

- network calls: avoid or cache
- expensive computations: use `_argc_util_parallel`
- large datasets: filter/limit results

### caching completions

implement caching for expensive operations:

```sh
_choice_cached() {
    local cache_file="/tmp/my-completion-cache"
    local cache_ttl=3600  # 1 hour

    if [[ -f "$cache_file" ]] && \
       [[ $(($(date +%s) - $(stat -c %Y "$cache_file"))) -lt $cache_ttl ]]; then
        cat "$cache_file"
    else
        _expensive_operation | tee "$cache_file"
    fi
}

_expensive_operation() {
    # slow operation here
    sleep 1
    echo result1
    echo result2
}
```

## best practices

1. **keep choice functions fast** - completion should feel instant
1. **handle errors silently** - redirect stderr: `2>/dev/null`
1. **filter by current word** - use `$ARGC_CWORD` to narrow results
1. **provide descriptions** - use `value<TAB>description` format
1. **test in all target shells** - bash/zsh/fish behavior differs
1. **cache expensive operations** - network calls, heavy computation
1. **use type hints** - `<FILE>`, `<DIR>` for path completion
1. **leverage utilities** - use `_argc_util_*` functions
1. **fail gracefully** - return empty if data unavailable
1. **document complex completions** - comment the logic

## references

- argc completion guide: `@src/argc/README.md#completion`
- argc-completions project: `@src/argc-completions/README.md`
- generation docs: `@src/argc-completions/docs/generate.md`
- completion patterns: `@src/argc-completions/docs/complete-patterns.md`
- utilities source: `@src/argc-completions/utils/_argc_utils.sh`
