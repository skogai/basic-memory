---
title: Main Playbook Configuration
type: note
permalink: ansible/playbooks/main-playbook-configuration
---

# Main Playbook Configuration

## Overview

Primary orchestration playbook that coordinates all system setup phases for i3-based Arch Linux automation.

## Playbook Structure

```yaml
# ansible/playbooks/main.yml

- name: "Pre-flight System Validation"
  hosts: all
  gather_facts: yes
  tasks:
    # [validation] Verify target system is Arch Linux #system-check
    # [validation] Check available disk space and memory #resource-check
    # [validation] Validate network connectivity #network-check
    # [validation] Ensure running as appropriate user #permission-check

- name: "Base System Setup"
  import_playbook: base-system.yml
  # [setup] Essential system packages and configuration #foundation
  # [setup] User management and sudo configuration #security
  # [setup] System services and networking #services

- name: "Security Hardening"
  import_playbook: security-hardening.yml
  # [security] Firewall configuration and rules #firewall
  # [security] SSH hardening and key management #ssh
  # [security] System audit and monitoring setup #monitoring

- name: "Desktop Environment Setup"
  import_playbook: desktop-environment.yml
  # [desktop] Display server installation and configuration #display
  # [desktop] Window manager setup and theming #wm
  # [desktop] Audio system configuration #audio

- name: "User Configuration and Dotfiles"
  import_playbook: user-configuration.yml
  # [user] Personal application configuration #apps
  # [user] Dotfiles deployment and management #dotfiles
  # [user] Development environment setup #development

- name: "Post-Installation Validation"
  hosts: all
  tasks:
    # [validation] Verify all services are running #service-check
    # [validation] Test desktop environment functionality #desktop-check
    # [validation] Validate user configuration #user-check
    # [cleanup] Remove temporary files and caches #cleanup
```

## Execution Flow

### Phase 1: Validation

- [step] System compatibility checks #pre-flight
- [step] Resource availability validation #resources
- [step] User permission verification #permissions

### Phase 2: Foundation

- [step] Base system packages and updates #base
- [step] Essential services configuration #services
- [step] User account setup #users

### Phase 3: Security

- [step] Firewall and network security #security
- [step] SSH configuration and hardening #ssh
- [step] System monitoring setup #monitoring

### Phase 4: Desktop

- [step] Display server and drivers #display
- [step] i3 window manager installation #i3
- [step] Audio and multimedia setup #multimedia

### Phase 5: User Space

- [step] Application installation and configuration #applications
- [step] Dotfiles deployment #dotfiles
- [step] Development tools setup #development

### Phase 6: Validation

- [step] System functionality verification #post-check
- [step] Service status validation #services
- [step] Cleanup and optimization #cleanup

## Configuration Variables

```yaml
# Global execution control
ansible_setup_mode: "full"  # full, minimal, custom
ansible_desktop_environment: "i3"
ansible_audio_system: "pipewire"

# Feature toggles
enable_security_hardening: true
enable_development_tools: true
enable_multimedia_apps: true
setup_dotfiles: true

# User configuration
primary_user: "{{ ansible_user }}"
user_shell: "zsh"
```

## Error Handling

- [strategy] Fail-fast on critical system errors #error-handling
- [strategy] Continue on non-critical application failures #resilience
- [strategy] Comprehensive logging for troubleshooting #logging
- [strategy] Rollback capability for major configuration changes #rollback

## Observations

- [orchestration] Clear phase separation enables selective execution #modularity
- [orchestration] Validation steps ensure system reliability #validation
- [orchestration] Variable-driven configuration supports customization #flexibility
- [orchestration] Comprehensive error handling prevents partial setups #reliability

## Relations

- orchestrates \[[Base System Setup]\]
- orchestrates \[[Desktop Environment Setup]\]
- orchestrates \[[User Configuration]\]
- implements \[[Ansible Best Practices]\]
