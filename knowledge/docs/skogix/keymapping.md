---
title: skogix/keymappings
usage: reference
intent: keymapping philosophy, definitions, current state, and workflow for making changes
tags:
  - documentation
  - keymapping
  - skogix
references:
  - /home/skogix/docs/skogix/definitions.md
permalink: skogai/skogix/keymapping
---

# state

## definitions

```json
{
  "keybind.layer": "abstract group describing area of influence — e.g. keybind.layer.editor, keybind.layer.multiplexer, keybind.layer.wm",
  "input":         "physical key on the keyboard",
  "mod":           "modifier key (ctrl, alt, shift, super) pressed together with an input to form a key",
  "key":           "the abstraction of the received input signal: <mod-input> — e.g. <shift-b>, <ctrl-h>"
}
```

### layers

| layer | scope | examples |
|---|---|---|
| `keybind.layer.editor` | text editing, LSP, splits inside editor | neovim, zed |
| `keybind.layer.terminal` | font zoom, clipboard, GPU config, remote control | kitty |
| `keybind.layer.multiplexer` | sessions, windows, panes | tmux |
| `keybind.layer.wm` | workspaces, tiling, focus | hyprland |
| `keybind.layer.os` | global shortcuts, launchers, notifications | hypr binds |

The same conceptual action (e.g. "move focus left") maps to the same key pattern across layers. `<ctrl-h>` means "focus left" whether that is a vim split, tmux pane, or hyprland window.

#### layer ownership decisions

**Kitty vs tmux:** Kitty has built-in tabs/splits but tmux owns that layer. Kitty is the GPU-rendered shell frontend; tmux handles all terminal organization (session persistence, remote, multiplexing). Duplicated abstractions are where keyboards go to die.

Kitty keeps only:
- font zoom (`ctrl+shift+=` / `ctrl+shift+-`)
- clipboard passthrough
- remote control API (`kitty @`)
- one-shot terminal spawning

Everything else (windows, panes, tabs) belongs to tmux.

---

# workflow

## intent

### philosophy

**The core principle:** every layer should do the same conceptual thing with a different prefix key.

```
layer       prefix              example
────────────────────────────────────────────────────────
wm          super+_             super+h  → focus left
multiplexer ctrl+{a,b,t}+_     ctrl+b h → pane left
terminal    ctrl+shift+_        ctrl+shift+enter → new window
editor      shift+_, ctrl+_,    ctrl+h → split left
            space (leader),     space w h → focus left
            , (localleader)
```

The vocabulary — `hjkl`, direction, prev/next, open/close — stays constant. Only the prefix changes per layer. Muscle memory transfers; only the chord changes.

Modal first. Every layer has a mode where bare keys carry meaning. Fallback to insert/passthrough for text entry.

Vim is the reference implementation. `hjkl` = directions. All layers borrow that vocabulary.

Defaults as baseline. Deviate only when a default breaks the cross-layer consistency model. Fewer custom bindings = lower cognitive load when context-switching.

#### pragmatic state

The full intent has existed since Windows XP → Linux migration (20+ vimrcs, multiple written plugins). The current working baseline is **LazyVim** — a sensible opinionated default that covers 90% of the intent without the maintenance cost of a from-scratch config. Divergences from LazyVim defaults are tracked in the implementation section.

The goal is not to rebuild a custom config. The goal is to document the model clearly enough that any divergence is intentional and consistent across all layers.

### modality

| input | meaning |
|---|---|
| `h` | left / previous / collapse |
| `j` | down / next |
| `k` | up / previous |
| `l` | right / next / expand |
| `<ctrl-hjkl>` | cross-pane/split/window focus (works in tmux, vim, hyprland) |
| `<leader>` | open namespace — `space` in editor, prefix key in other layers |

### movement patterns

| pattern | key | scope |
|---|---|---|
| character | `hjkl` | editor | [@skogix:might be worth mentioning that dvorak+"normal/qwerty"-vimkeys means that JK is "left hand down" while HL is pretty much right hand relaxed. this means left hand ctrl+shift+super+alt while right hand often do movement]
| word | `w/b/e` | editor |
| line start/end | `0/$` | editor |
| paragraph/headers/sections | `{/}[/]` | editor | [@skogix:"since swedish home-made programmers dvorak have {}[]/;,.- as direct keypresses / no mod needed they are over-used as well ^^"]
| file start/end | `gg/G` | editor |
| pane/split focus | `<ctrl-hjkl>` | editor + multiplexer |
| workspace | `<super-1..9>` | wm |
| buffer/tab | `<ctrl-hl>` or `<shift-hl>` | editor |
| multiplexing-panes | `<ctrl+shift-hl>` or `C-{a,b,t} n/h/l` | tmux/kitty |
| windows/workspaces | `<super+hjkl>` or `<super+shift+_>` | i3wm/sway

### actions

| action | key | note |
|---|---|---|
| yank | `y` | vim default |
| paste | `p/P` | vim default |
| delete | `d/x` | vim default |
| undo/redo | `u/<ctrl-r>` | vim default |
| search | `/` (in-buffer), `<leader>/` (project) | |
| find file | `<leader>ff` or `<leader><space>` | |
| code action | `<leader>ca` | |
| rename | `<leader>cr` | |
| format | `<leader>cf` | |

---

## actuality

### programs per layer

| layer | program | config | key prefix |
|---|---|---|---|
| editor (primary) | neovim (lazyvim) | `~/.config/nvim/` | `<leader>` (space) |
| editor (secondary) | zed | `~/.config/zed/keymap.json` | `<space>` (vim mode) |
| terminal | kitty | `~/.config/kitty/kitty.conf` | `ctrl+shift+` |
| multiplexer | tmux | `~/.config/tmux/` | `ctrl+b` (or custom) |
| wm | hyprland | `~/.config/hypr/` | `super` |
| shell | zsh | `~/.zshrc` | — |

#### i3 / sway: what's actually in the config

i3 makes the philosophy explicit at the variable level:

```conf
set $mod  Mod4   # super key
set $left h
set $down j
set $up   k
set $right l
```

| action | key | maps to intent |
|---|---|---|
| focus left/down/up/right | `super+hjkl` | ✓ |
| move window left/down/up/right | `super+shift+hjkl` | ✓ |
| prev/next workspace on output | `super+ctrl+h/l` | ✓ |
| switch workspace | `super+1-9` | number-based, not hjkl |
| split vertical | `super+v` | ✗ (not hjkl) |
| fullscreen | `super+f` | ✓ |
| launcher | `super+space` / `super+d` | ✓ (open namespace) |
| terminal | `super+return` | ✓ |
| kill window | `super+shift+q` (sway) / `super+button2` (i3) | — |

Sway config mirrors i3 structure with the same `$mod+hjkl` focus pattern.

#### tmux: what's actually in the config

oh-my-tmux ships hjkl pane navigation by default. The user config (`tmux.conf.local`) uses defaults with no custom prefix change — prefix is `ctrl+b`.

| action | key | maps to intent |
|---|---|---|
| focus pane left/down/up/right | `ctrl+b h/j/k/l` | ✓ |
| resize pane left/down/up/right | `ctrl+b H/J/K/L` | ✓ |
| prev/next window | `ctrl+b ctrl+h/l` | ✓ |
| last window | `ctrl+b Tab` | — |
| split horizontal | `ctrl+b -` | ✗ (mnemonic, not hjkl) |
| split vertical | `ctrl+b _` | ✗ (mnemonic, not hjkl) |
| zoom pane | `ctrl+b +` | — |
| new session | `ctrl+b ctrl+c` | — |
| copy mode | `ctrl+b Enter` | — |
| vi keys in copy mode | `v` begin sel, `ctrl+v` rect | ✓ (vim vocab) |

Split bindings diverge: `-` (horizontal line) and `_` are mnemonics, not hjkl. This is the main tmux gap vs the intent model.

#### Kitty: what it actually owns

Kitty is GPU-rendered (contrast: xterm is CPU cave mode). The config is `~/.config/kitty/kitty.conf` — readable, no XML archaeology. Key things worth configuring:

```conf
font_family      JetBrainsMono Nerd Font
font_size        12.0
background_opacity 0.92
scrollback_lines 100000
enable_audio_bell no
```

Remote control API (`kitty @`) is the interesting unlock for SkogAI — terminal layout becomes code:

```bash
kitty @ launch --type=tab --title core --cwd ~/skogai
kitty @ launch --type=window --cwd ~/logs tail -f service.log
```

Transparency requires a compositor (picom/hyprland). Raw X11 = no transparency, not a bug.

---

## implementation

### workflow for changes

1. Identify which `$keybind.layer` the change lives in.
2. Check if the intent model already defines that key for that layer.
3. If yes: update the program config to match intent.
4. If no: decide — extend intent first, then update config.
5. Document divergences explicitly; do not silently patch configs.

### known divergences

| layer | key | intent | actuality | reason |
|---|---|---|---|---|
| zed (editor) | `<space>` | leader (namespace) | `vim::WrappingRight` (single press fallback) | Zed chord resolution handles both |
| zed (editor) | `<shift-hl>` | prev/next buffer | `vim::WindowTop/Bottom` | LazyVim-style `[b/]b` used instead |
| tmux | `ctrl+b -` / `ctrl+b _` | split should follow hjkl vocabulary | mnemonic split (- = horizontal, _ = vertical) | oh-my-tmux default; acceptable as visual mnemonic |
| i3/sway | `super+v` | split (v = vertical by vim convention?) | split vertical | i3 default; could conflict with vim `v` mental model |
| i3 | `super+1-9` | workspace nav | number-based, not directional | workspaces are named units, not directional; intentional |
