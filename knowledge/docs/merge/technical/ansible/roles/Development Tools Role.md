---
title: Development Tools Role
type: note
permalink: ansible/roles/development-tools-role
---

# Development Tools Role

## Overview

Comprehensive development environment setup with modern tools, editors, and productivity enhancements for software development.

## Role Structure

```yaml
# ansible/roles/development/

tasks/
├── main.yml              # Development tools orchestration
├── languages.yml         # Programming language runtimes
├── editors.yml           # Text editors and IDEs
├── version-control.yml   # Git and VCS tools
├── containers.yml        # Docker and container tools
├── databases.yml         # Database clients and tools
├── productivity.yml      # Development productivity tools
└── shell.yml             # Shell enhancements

defaults/
└── main.yml              # Development tool preferences

handlers/
└── main.yml              # Service restarts and updates

templates/
├── gitconfig.j2          # Git configuration template
├── vimrc.j2              # Vim configuration
├── zshrc.j2              # Zsh shell configuration
├── tmux.conf.j2          # Terminal multiplexer config
└── docker-daemon.json.j2 # Docker daemon configuration

files/
├── vim-plugins/          # Vim plugin configurations
├── zsh-themes/           # Custom zsh themes
└── scripts/              # Development utility scripts
```

## Task Descriptions

### main.yml

```yaml
# [orchestration] Setup development environment in logical order #coordination
# [validation] Check system requirements for development tools #pre-check
# [setup] Install programming language runtimes #languages
# [setup] Configure text editors and IDEs #editors
# [setup] Setup version control systems #vcs
# [setup] Install container and virtualization tools #containers
# [setup] Configure database clients #databases
# [setup] Setup productivity and utility tools #productivity
# [setup] Enhance shell environment #shell-enhancement
```

### languages.yml

```yaml
# [language] Install Python with pip and virtual environment tools #python
# [language] Install Node.js with npm and yarn package managers #nodejs
# [language] Install Rust programming language with cargo #rust
# [language] Install Go programming language #golang
# [language] Install Java Development Kit (OpenJDK) #java
# [language] Install Ruby with gem package manager #ruby
# [language] Setup language servers for code completion #language-servers
# [validation] Verify language installations and versions #language-check
```

### editors.yml

```yaml
# [editor] Install and configure Neovim with plugins #neovim
# [editor] Setup Vim with essential plugins and configuration #vim
# [editor] Install Visual Studio Code with extensions #vscode
# [editor] Configure editor themes and color schemes #theming
# [editor] Setup code formatters and linters #formatting
# [editor] Configure language-specific settings #language-config
```

### version-control.yml

```yaml
# [vcs] Configure Git with user information and aliases #git-config
# [vcs] Install Git GUI tools (gitk, git-gui) #git-gui
# [vcs] Setup SSH keys for Git repositories #ssh-keys
# [vcs] Install and configure diff and merge tools #diff-tools
# [vcs] Setup Git hooks and workflow automation #git-hooks
```

### containers.yml

```yaml
# [container] Install Docker and Docker Compose #docker
# [container] Configure Docker daemon settings #docker-config
# [container] Add user to docker group #docker-permissions
# [container] Install container security tools #security
# [container] Setup container development workflow #workflow
# [validation] Verify Docker installation and permissions #docker-check
```

### databases.yml

```yaml
# [database] Install PostgreSQL client tools #postgresql
# [database] Install MySQL/MariaDB client tools #mysql
# [database] Install Redis command line tools #redis
# [database] Install database GUI clients (DBeaver, pgAdmin) #gui-clients
# [database] Setup database connection configurations #connections
```

### productivity.yml

```yaml
# [tool] Install terminal multiplexer (tmux/screen) #multiplexer
# [tool] Install file managers (ranger, nnn) #file-managers
# [tool] Install process monitors (htop, btop) #monitoring
# [tool] Install network tools (curl, wget, httpie) #network-tools
# [tool] Install text processing tools (jq, yq, ripgrep) #text-tools
# [tool] Install compression tools (zip, unzip, tar) #compression
```

### shell.yml

```yaml
# [shell] Install and configure Zsh shell #zsh
# [shell] Install Oh My Zsh framework #oh-my-zsh
# [shell] Configure shell plugins and themes #plugins
# [shell] Setup shell aliases and functions #aliases
# [shell] Configure command history and completion #completion
# [shell] Install shell productivity tools (fzf, zoxide) #productivity
```

## Default Variables

```yaml
# Programming languages
install_python: true
install_nodejs: true
install_rust: true
install_golang: true
install_java: false
install_ruby: false

python_version: "3.11"
nodejs_version: "lts"

# Text editors
primary_editor: "neovim"
install_vscode: true
install_vim: true

# Version control
git_user_name: "{{ ansible_user_id }}"
git_user_email: "user@example.com"
generate_ssh_key: true

# Container tools
install_docker: true
install_docker_compose: true
docker_compose_version: "2.20.0"

# Database tools
install_postgresql_client: true
install_mysql_client: false
install_redis_tools: true

# Shell configuration
default_shell: "zsh"
install_oh_my_zsh: true
zsh_theme: "powerlevel10k"

# Development utilities
install_tmux: true
install_ranger: true
install_fzf: true
```

## Key Features

### Language Support

- [feature] Multiple programming language runtimes #multi-language
- [feature] Package managers for each language ecosystem #package-managers
- [feature] Language servers for IDE-like features #intellisense
- [feature] Code formatting and linting tools #code-quality

### Editor Configuration

- [feature] Modern text editors with plugin ecosystems #modern-editors
- [feature] Syntax highlighting and code completion #syntax-support
- [feature] Integrated debugging capabilities #debugging
- [feature] Project navigation and file management #navigation

### Development Workflow

- [feature] Version control integration and automation #vcs-integration
- [feature] Container-based development environments #containerization
- [feature] Database access and management tools #database-access
- [feature] Terminal productivity enhancements #terminal-productivity

### Shell Enhancement

- [feature] Modern shell with advanced features #modern-shell
- [feature] Intelligent command completion #completion
- [feature] File and directory navigation improvements #navigation
- [feature] Command history and search capabilities #history

## Handlers

```yaml
# [handler] Restart shell to apply configuration changes #shell-restart
# [handler] Update package manager caches #package-update
# [handler] Reload environment variables #env-reload
# [handler] Restart Docker daemon #docker-restart
# [handler] Update editor plugin caches #editor-update
```

## Dependencies

- [dependency] Base system role for package management #base-system
- [requirement] Network connectivity for package downloads #network
- [requirement] Sufficient disk space for development tools #storage

## Observations

- [productivity] Comprehensive development environment setup #complete-environment
- [flexibility] Configurable language and tool selection #customizable
- [efficiency] Modern tools for enhanced productivity #modern-tooling
- [integration] Seamless integration between tools #tool-integration

## Relations

- depends_on \[[Base System Role]\]
- integrates_with \[[Terminal Configuration Role]\]
- complements \[[i3 Window Manager Role]\]
- enables \[[Software Development Workflow]\]
