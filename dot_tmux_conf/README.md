# tmux Configuration (macOS)

A comprehensive tmux configuration optimized for macOS with AeroSpace window manager compatibility, Neovim integration, and a modern plugin ecosystem.

## Prerequisites

### Required
- **tmux** 3.2+ (`brew install tmux`)
- **TPM** (Tmux Plugin Manager):
  ```bash
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

### Recommended
- **sesh** - Session manager (`brew install joshmedeski/sesh/sesh`)
- **fzf** - Fuzzy finder (`brew install fzf`)
- **fd** - Fast file finder (`brew install fd`)

## Installation

1. Install TPM (see above)
2. Start tmux
3. Press `Prefix + I` (Shift+i) to install plugins
4. Reload config: `Prefix + r`

## Key Bindings Reference

**Prefix key:** `Ctrl + b`

> **Note:** Many bindings are Neovim-aware - they pass through to Neovim when it's focused, otherwise they control tmux.

---

### Pane Management

#### Creating & Closing Panes

| Shortcut | Action |
|----------|--------|
| `Alt + e` | Split horizontally (side by side) |
| `Alt + E` | Split vertically (stacked) |
| `Alt + \` | Split horizontally (alternative) |
| `Alt + -` | Split vertically (alternative) |
| `Prefix, \` or `\|` | Split horizontally |
| `Prefix, -` or `_` | Split vertically |
| `Alt + w` | Close pane |
| `Alt + W` | Close window |
| `Prefix, x` | Kill pane (no confirmation) |

#### Navigating Panes

| Shortcut | Action |
|----------|--------|
| `Alt + Arrow Keys` | Move between panes |
| `Ctrl + h/j/k/l` | Move between panes (vim-style, Neovim-aware) |
| `Prefix, h/j/k/l` | Move between panes (always works) |

#### Resizing Panes

| Shortcut | Action |
|----------|--------|
| `Prefix, Ctrl + Arrow Keys` | Resize pane by 1 cell |
| `Prefix, Ctrl + h/j/k/l` | Resize pane by 1 cell |
| `Alt + z` | Toggle zoom (fullscreen pane) |

#### Swapping & Moving Panes

| Shortcut | Action |
|----------|--------|
| `Prefix, H/J/K/L` | Swap pane in direction |
| `Prefix, Alt + H/J/K/L` | Move pane in direction |

#### Layout Presets

| Shortcut | Action |
|----------|--------|
| `Prefix, =` | Even horizontal layout |
| `Prefix, +` | Even vertical layout |
| `Prefix, Space` | Tiled layout |

---

### Window (Tab) Management

#### Creating & Closing Windows

| Shortcut | Action |
|----------|--------|
| `Alt + t` | New window |
| `Alt + W` | Close window |
| `Prefix, ,` | Rename window |

#### Navigating Windows

| Shortcut | Action |
|----------|--------|
| `Alt + [` | Previous window |
| `Alt + ]` | Next window |
| `Alt + u` | Previous window (alternative) |
| `Alt + i` | Next window (alternative) |
| `Alt + \`` | Last window (toggle) |

#### Selecting Windows by Number

| Shortcut | Action |
|----------|--------|
| `Alt + 6-9, 0` | Select window 6-10 (no AeroSpace conflict) |
| `Prefix, 1-9, 0` | Select window 1-10 |

#### Reordering Windows

| Shortcut | Action |
|----------|--------|
| `Alt + {` | Move window left |
| `Alt + }` | Move window right |
| `Alt + U` | Move window left (alternative) |
| `Alt + I` | Move window right (alternative) |
| `Prefix, !/\@/#/$/%` | Swap window to position 1-5 |

---

### Session Management (Sesh)

| Shortcut | Action |
|----------|--------|
| `Alt + o` | Quick session picker (fzf popup) |
| `Prefix, T` | Session picker (same as Alt+o) |
| `Prefix, L` | Switch to last session |
| `Prefix, R` | Rename current session |

#### Session Picker Controls (inside fzf)

| Key | Action |
|-----|--------|
| `Ctrl + a` | Show all sessions |
| `Ctrl + t` | Show tmux sessions only |
| `Ctrl + g` | Show config sessions |
| `Ctrl + x` | Show zoxide directories |
| `Ctrl + f` | Find directories |
| `Ctrl + d` | Kill selected session |
| `Tab/Shift+Tab` | Navigate list |
| `Enter` | Select session |
| `Type path` | Create new session |

---

### Copy Mode

#### Entering Copy Mode

| Shortcut | Action |
|----------|--------|
| `Alt + c` | Enter copy mode |
| `Ctrl + u` | Enter copy mode + scroll up (Neovim-aware) |

#### Copy Mode Controls

| Key | Action |
|-----|--------|
| `Space` | Start selection |
| `c` | Clear selection (stay in place) |
| `y` | Yank to clipboard (stay in copy mode) |
| `Enter` | Copy and exit |
| `Ctrl + c` | Copy (stay in copy mode) |
| `Escape` | Cancel and exit |

#### Mouse Copy

| Action | Result |
|--------|--------|
| Double-click | Select and copy word |
| Triple-click | Select and copy line |
| Click and drag | Select text, copy on release |
| Right-click | Paste |

---

### Plugin Shortcuts

#### tmux-thumbs (Quick Copy)

| Shortcut | Action |
|----------|--------|
| `Alt + y` | Quick copy mode - highlights copyable text |

#### tmux-jump (Vimium-style)

| Shortcut | Action |
|----------|--------|
| `Alt + Y` | Jump mode - type letters to jump |

#### tmux-fuzzback (Search Scrollback)

| Shortcut | Action |
|----------|--------|
| `Alt + /` | Fuzzy search in scrollback |
| `Prefix, f` | Fuzzy search in scrollback (alternative) |

#### tmux-fzf-url (URL Picker)

| Shortcut | Action |
|----------|--------|
| `Prefix, u` | Pick URL from terminal |

#### Extrakto (Text Extraction)

| Shortcut | Action |
|----------|--------|
| `Ctrl + Space` | Extract text from terminal (Neovim-aware) |

Inside Extrakto:
- `Tab` - Copy to clipboard
- `Enter` - Insert into terminal

#### tmux-text-macros

| Shortcut | Action |
|----------|--------|
| `Alt + m` | Open macros menu (Neovim-aware) |
| `Alt + M` | Open macros menu (always) |

#### tmux-fzf (Clipboard)

| Shortcut | Action |
|----------|--------|
| `Alt + p` | Browse clipboard history |

#### tmux-suspend (Nested Sessions)

| Shortcut | Action |
|----------|--------|
| `Alt + Enter` | Suspend/resume outer tmux (for nested SSH sessions) |

---

### Miscellaneous

| Shortcut | Action |
|----------|--------|
| `Prefix, r` | Reload tmux config |
| `F12` | Toggle synchronized panes (type in all panes) |
| `Home` | Go to beginning of line |
| `End` | Go to end of line |
| `Prefix, "` | Choose paste buffer |
| `Prefix, ?` | List all key bindings |
| `Prefix, d` | Detach from session |
| `Prefix, :` | Command prompt |

---

## Installed Plugins

| Plugin | Description |
|--------|-------------|
| [tmux-nova](https://github.com/o0th/tmux-nova) | Modern status bar theme |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Save/restore sessions |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) | Auto-save sessions |
| [tmux-open](https://github.com/tmux-plugins/tmux-open) | Open files/URLs from copy mode |
| [tmux-window-name](https://github.com/ofirgall/tmux-window-name) | Smart window naming |
| [tmux-better-mouse-mode](https://github.com/nhdaly/tmux-better-mouse-mode) | Improved mouse support |
| [tmux-suspend](https://github.com/MunifTanjim/tmux-suspend) | Suspend for nested sessions |
| [tmux-notify](https://github.com/ofirgall/tmux-notify) | Notifications when commands complete |
| [tmux-fzf-url](https://github.com/wfxr/tmux-fzf-url) | Pick URLs with fzf |
| [tmux-fuzzback](https://github.com/roosta/tmux-fuzzback) | Fuzzy search scrollback |
| [tmux_capture_last_command_output](https://github.com/ofirgall/tmux_capture_last_command_output) | Capture command output |
| [tmux-thumbs](https://github.com/fcsonline/tmux-thumbs) | Quick copy (like Vimium hints) |
| [tmux-jump](https://github.com/schasse/tmux-jump) | Jump to text (like Vimium) |
| [tmux-text-macros](https://github.com/Neo-Oli/tmux-text-macros) | Text snippet macros |
| [tmux-fzf](https://github.com/sainnhe/tmux-fzf) | FZF integration |
| [extrakto](https://github.com/laktak/extrakto) | Extract text from terminal |

---

## Configuration Files

| File | Purpose |
|------|---------|
| `~/.tmux.conf` | Main config (sources modular files) |
| `~/.tmux_conf/settings.tmux` | General settings |
| `~/.tmux_conf/binds.tmux` | Key bindings |
| `~/.tmux_conf/plugins.tmux` | Plugin configuration |
| `~/.tmux_conf/design.tmux` | Theme and appearance |

---

## Settings Overview

- **Prefix:** `Ctrl + b`
- **Mode keys:** Vi
- **Mouse:** Enabled
- **Base index:** 1 (windows and panes start at 1)
- **True color:** Enabled
- **Clipboard:** OSC 52 (works over SSH)
- **Scrollback:** 10,000 lines
- **Escape time:** 1ms (fast for Neovim)

---

## AeroSpace Compatibility

This configuration avoids conflicts with AeroSpace window manager:
- `Alt + 1-5` are reserved for AeroSpace workspaces
- `Alt + 6-9, 0` are used for tmux windows
- All other conflicting shortcuts have been remapped

---

## Troubleshooting

### Plugins not loading
```bash
# Reinstall plugins
Prefix + I
```

### Colors look wrong
Ensure your terminal supports true color and has `TERM=xterm-256color` or `TERM=tmux-256color`.

### Neovim keybindings not passing through
The config detects Neovim automatically. If issues persist, check if `is_nvim` detection works:
```bash
tmux display-message "#{pane_current_command}"
```

### Session restore not working
```bash
# Check resurrect directory
ls ~/.tmux/resurrect/
# Manual restore
Prefix + Ctrl + r
```
