---
title: Base System Role
type: note
permalink: ansible/roles/base-system-role
---

# Base System Role

## Overview

Foundation role that establishes essential system packages, services, and configurations for Arch Linux.

## Role Structure

```yaml
# ansible/roles/base/

tasks/
├── main.yml              # Primary task orchestration
├── packages.yml          # Package management tasks
├── services.yml          # System service configuration
├── locale.yml            # Locale and timezone setup
└── users.yml             # User account management

defaults/
└── main.yml              # Default variable definitions

handlers/
└── main.yml              # Service restart handlers

templates/
├── sudoers.j2            # Sudo configuration template
├── hosts.j2              # System hosts file template
└── locale.conf.j2        # Locale configuration template

files/
└── pacman.conf           # Custom pacman configuration
```

## Task Descriptions

### main.yml

```yaml
# [orchestration] Include all base system tasks in proper order #coordination
# [validation] Verify system is Arch Linux before proceeding #pre-check
# [setup] Update package databases and keyring #package-sync
# [setup] Install essential packages via pacman #essential-packages
# [setup] Configure system locale and timezone #localization
# [setup] Setup user accounts and sudo access #user-management
# [setup] Configure system services and startup #services
# [validation] Verify all base components are functional #post-check
```

### packages.yml

```yaml
# [package] Update pacman package database #pacman-sync
# [package] Install base system packages (base-devel, git, wget, curl) #base-packages
# [package] Install AUR helper (yay or paru) #aur-helper
# [package] Install essential utilities (htop, neofetch, tree, vim) #utilities
# [package] Install network tools (networkmanager, openssh) #networking
# [package] Configure pacman parallel downloads and color output #pacman-config
# [validation] Verify critical packages are installed #package-check
```

### services.yml

```yaml
# [service] Enable and start NetworkManager #networking
# [service] Enable and configure SSH daemon #ssh
# [service] Setup systemd-timesyncd for time synchronization #time-sync
# [service] Configure systemd journal limits #logging
# [service] Enable firewall service (ufw or iptables) #firewall
# [validation] Verify all services are active #service-status
```

### locale.yml

```yaml
# [locale] Configure system locale (en_US.UTF-8) #locale-config
# [locale] Set system timezone based on variable #timezone
# [locale] Generate locale files #locale-gen
# [locale] Configure keyboard layout #keyboard
# [validation] Verify locale configuration #locale-check
```

### users.yml

```yaml
# [user] Create primary user account #user-creation
# [user] Configure user shell (bash/zsh) #shell-config
# [user] Setup sudo access for user #sudo-config
# [user] Create user directories (Documents, Downloads, etc.) #user-dirs
# [user] Set appropriate file permissions #permissions
# [validation] Verify user can execute sudo commands #sudo-test
```

## Default Variables

```yaml
# Package management
base_packages:
  - base-devel
  - git
  - wget
  - curl
  - htop
  - neofetch
  - tree
  - vim

aur_helper: "yay"
pacman_parallel_downloads: 5

# System configuration
system_locale: "en_US.UTF-8"
system_timezone: "UTC"
keyboard_layout: "us"

# User configuration
primary_user_shell: "/bin/bash"
create_user_directories: true

# Service configuration
enable_ssh: true
enable_firewall: true
enable_time_sync: true
```

## Handlers

```yaml
# [handler] Restart NetworkManager service #network-restart
# [handler] Restart SSH daemon #ssh-restart
# [handler] Reload systemd daemon #systemd-reload
# [handler] Regenerate locale files #locale-regen
# [handler] Update user shell database #shell-update
```

## Dependencies

- [dependency] None - this is the foundation role #foundation
- [requirement] Target system must be Arch Linux #arch-requirement
- [requirement] Network connectivity for package downloads #network-requirement

## Observations

- [foundation] Establishes minimal working Arch Linux system #base-system
- [modularity] Self-contained with no external role dependencies #independence
- [flexibility] Configurable via variables for different setups #customizable
- [validation] Includes verification steps for reliability #reliable

## Relations

- foundation_for \[[i3 Window Manager Role]\]
- foundation_for \[[Security Hardening Role]\]
- foundation_for \[[Development Tools Role]\]
- implements \[[Essential System Setup]\]
