---
title: i3 Window Manager Role
type: note
permalink: ansible/roles/i3-window-manager-role
---

# i3 Window Manager Role

## Overview

Comprehensive i3 window manager setup with modern tooling, theming, and productive keybindings for Arch Linux.

## Role Structure

```yaml
# ansible/roles/i3/

tasks/
├── main.yml              # Primary i3 setup orchestration
├── packages.yml          # i3 and related package installation
├── config.yml            # i3 configuration deployment
├── statusbar.yml         # Status bar setup (i3status-rust/polybar)
├── compositor.yml        # Picom compositor configuration
├── launcher.yml          # Application launcher setup (rofi/dmenu)
└── theming.yml           # Theme and appearance configuration

defaults/
└── main.yml              # Default i3 configuration variables

handlers/
└── main.yml              # i3 restart and reload handlers

templates/
├── i3-config.j2          # Main i3 configuration template
├── i3status-rust.toml.j2 # Status bar configuration
├── picom.conf.j2         # Compositor configuration
├── rofi-config.rasi.j2   # Rofi launcher theme
└── xinitrc.j2            # X11 initialization script

files/
├── wallpapers/           # Default wallpaper collection
├── scripts/              # i3 utility scripts
│   ├── screenshot.sh     # Screenshot functionality
│   ├── volume.sh         # Volume control script
│   └── brightness.sh     # Brightness control script
└── fonts/                # Icon fonts for status bar
```

## Task Descriptions

### main.yml

```yaml
# [orchestration] Coordinate all i3 setup tasks in proper order #coordination
# [validation] Verify display server is available #display-check
# [setup] Install i3 and essential packages #package-installation
# [setup] Deploy i3 configuration files #config-deployment
# [setup] Configure status bar and compositor #visual-setup
# [setup] Setup application launcher and theming #launcher-setup
# [setup] Install and configure utility scripts #utilities
# [validation] Test i3 configuration syntax #config-validation
```

### packages.yml

```yaml
# [package] Install i3-wm window manager #i3-core
# [package] Install i3-gaps for window gaps #i3-gaps
# [package] Install i3status-rust for modern status bar #statusbar
# [package] Install picom compositor for transparency/effects #compositor
# [package] Install rofi application launcher #launcher
# [package] Install feh for wallpaper management #wallpaper
# [package] Install xorg-server and xinit #display-server
# [package] Install fonts (ttf-font-awesome, noto-fonts) #fonts
# [package] Install utilities (scrot, maim for screenshots) #utilities
```

### config.yml

```yaml
# [config] Deploy main i3 configuration from template #i3-config
# [config] Create user i3 config directory structure #directories
# [config] Set executable permissions on script files #permissions
# [config] Configure autostart applications #autostart
# [config] Setup workspace assignments and naming #workspaces
# [config] Configure window rules and floating settings #window-rules
```

### statusbar.yml

```yaml
# [statusbar] Install and configure i3status-rust #status-config
# [statusbar] Setup status bar modules (CPU, memory, network) #modules
# [statusbar] Configure status bar theming and colors #theming
# [statusbar] Setup click actions for status bar elements #interactions
# [statusbar] Alternative: Configure polybar if selected #polybar-option
```

### compositor.yml

```yaml
# [compositor] Deploy picom configuration #picom-config
# [compositor] Configure transparency and shadow effects #effects
# [compositor] Setup compositor autostart #autostart
# [compositor] Configure performance settings #performance
# [compositor] Setup fade animations and transitions #animations
```

### launcher.yml

```yaml
# [launcher] Deploy rofi configuration and theme #rofi-config
# [launcher] Setup application launcher keybindings #keybindings
# [launcher] Configure rofi modes (run, window, drun) #modes
# [launcher] Setup custom rofi scripts #custom-scripts
# [launcher] Alternative: Configure dmenu if selected #dmenu-option
```

### theming.yml

```yaml
# [theming] Apply GTK theme configuration #gtk-theme
# [theming] Setup icon theme and cursor theme #icons-cursors
# [theming] Configure Qt application theming #qt-theme
# [theming] Deploy wallpapers and set default #wallpapers
# [theming] Setup color scheme consistency #color-scheme
```

## Default Variables

```yaml
# Core i3 configuration
i3_modifier_key: "Mod4"  # Windows key
i3_terminal: "alacritty"
i3_browser: "firefox"
i3_file_manager: "thunar"

# Status bar configuration
statusbar_type: "i3status-rust"  # i3status-rust, polybar, i3blocks
statusbar_position: "top"
statusbar_font: "Source Code Pro 10"

# Compositor settings
compositor_enabled: true
compositor_type: "picom"
enable_transparency: true
enable_shadows: true

# Launcher configuration
launcher_type: "rofi"  # rofi, dmenu
rofi_theme: "Arc-Dark"

# Theming
gtk_theme: "Arc-Dark"
icon_theme: "Papirus-Dark"
cursor_theme: "Adwaita"
wallpaper_path: "/usr/share/wallpapers/default.jpg"

# Workspace configuration
i3_workspaces:
  - { name: "1:term", key: "1" }
  - { name: "2:web", key: "2" }
  - { name: "3:code", key: "3" }
  - { name: "4:files", key: "4" }
  - { name: "5:media", key: "5" }
```

## Key Features

### Window Management

- [feature] Tiling window layout with automatic arrangement #tiling
- [feature] Window gaps for modern appearance #gaps
- [feature] Floating window rules for specific applications #floating
- [feature] Multi-monitor support with workspace assignment #multi-monitor

### Status Bar

- [feature] System information display (CPU, RAM, disk) #system-info
- [feature] Network status and connectivity #network
- [feature] Audio volume and brightness controls #controls
- [feature] Date and time display #datetime
- [feature] Workspace indicators and switching #workspaces

### Application Integration

- [feature] Fast application launching via rofi #launcher
- [feature] Screenshot functionality with keybindings #screenshots
- [feature] Volume and brightness control scripts #system-control
- [feature] Workspace-specific application assignments #app-assignment

## Handlers

```yaml
# [handler] Restart i3 window manager #i3-restart
# [handler] Reload i3 configuration #i3-reload
# [handler] Restart picom compositor #compositor-restart
# [handler] Update font cache #font-cache-update
# [handler] Restart display manager #display-restart
```

## Dependencies

- [dependency] Base system role for essential packages #base-system
- [dependency] Display server (X11) configuration #display-server
- [requirement] Working graphics drivers #graphics-requirement

## Observations

- [desktop] Complete i3 desktop environment setup #complete-desktop
- [modularity] Configurable components via variables #modular-config
- [usability] Productive keybindings and workflows #productive
- [theming] Consistent visual appearance across applications #visual-consistency

## Relations

- depends_on \[[Base System Role]\]
- integrates_with \[[Audio System Role]\]
- integrates_with \[[Terminal Configuration Role]\]
- implements \[[Modern i3 Desktop]\]
