---
title: Developer-Focused Repositories
type: note
permalink: ansible/resources/developer-focused-repositories
tags:
  - '["ansible"'
  - '"arch-linux"'
  - '"development"'
  - '"automation"'
  - '"testing"'
  - '"multi-machine"]'
---

# Developer-Focused Repositories

## shricodev/dotfiles ⭐ One-Command Setup

**URL**: https://github.com/shricodev/dotfiles **Status**: Recently active with demo videos **Focus**: Automated development environment with Docker testing

### Key Features

- [feature] Multi-OS support (Arch Linux, Ubuntu) #multi-os
- [testing] Docker container testing #docker
- [installation] One-command installation via curl #automation
- [feature] SSH key generation #ssh
- [feature] Taskfile.dev integration #task-automation
- [feature] Comprehensive logging #logging

### Installation

```bash
curl -fsSL https://raw.githubusercontent.com/shricodev/dotfiles/main/bootstrap.sh | bash
```

### Evidence of Use

- [validation] Demo videos available #demos
- [documentation] Good with demo videos #docs

## jahrik/ansible-arch-workstation

**URL**: https://github.com/jahrik/ansible-arch-workstation **Status**: Maintained with Vagrant support **Focus**: Development workstation with Sway

### Key Features

- [feature] Sway window manager #sway
- [development] Neovim, zsh, alacritty #dev-tools
- [feature] Waybar status bar #statusbar
- [testing] Vagrant testing #vagrant
- [distribution] Ansible Galaxy role distribution #ansible-galaxy
- [feature] LVM partitioning examples #partitioning

### Evidence of Use

- [validation] Active repository with testing infrastructure #testing

## burakkose/dotfiles

**URL**: https://github.com/burakkose/dotfiles **Status**: Active (Arch is primary focus) **Focus**: Template-based dotfiles management

### Key Features

- [feature] Wayland-first (Sway default) #wayland
- [feature] Multiple WM support (Sway, i3, Openbox) #multi-wm
- [feature] AUR helper (trizen) #aur
- [security] Ansible Vault encryption #encryption
- [automation] Makefile automation #makefile

### Installation

```bash
make install-deps-arch && make arch
```

### Evidence of Use

- [validation] Well-structured with clear automation #automation

## Multi-Machine Management

### raphiz/my-arch-setup

**URL**: https://github.com/raphiz/my-arch-setup **Status**: Active **Focus**: Multi-machine management with rollback capability

#### Key Features

- [feature] BTRFS subvolume snapshots #btrfs
- [feature] Rollback to minimal state #rollback
- [feature] Host-specific configurations #multi-host
- [security] Ansible Vault for secrets #encryption
- [feature] Multiple machine support #multi-machine

#### Evidence of Use

- [validation] Production use for multiple machines #production

### jmcvaughn/ansible-arch

**URL**: https://github.com/jmcvaughn/ansible-arch **Status**: Actively maintained **Focus**: Provisions servers, desktops, and MacBooks

#### Key Features

- [feature] i3 window manager #i3
- [feature] Docker and ZFS support #containers
- [feature] TLP power management #power-management
- [feature] MacBook-specific optimizations #macos
- [architecture] Role-based architecture #roles

## Common Development Patterns

### Package Management

- [technique] Official packages via pacman module #pacman
- [technique] AUR packages via dedicated user #aur
- [security] Never run AUR helpers as root #security

### Security Practices

- [security] Ansible Vault for sensitive data #vault
- [security] SSH key automation #ssh
- [security] Role separation for privilege escalation #privilege

### Testing Infrastructure

- [testing] Vagrant for local testing #vagrant
- [testing] Docker for containerized testing #docker
- [testing] CI/CD pipelines for automation #ci-cd

## Relations

- part_of \[[Arch Linux Desktop Automation Research]\]
- implements \[[Development Tools]\]
- implements \[[Multi-Machine Management]\]
- relates_to \[[Ansible Best Practices]\]
- contains \[[Testing Strategies]\]
