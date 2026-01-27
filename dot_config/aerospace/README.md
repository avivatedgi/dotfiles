# AeroSpace Keybindings Cheat Sheet

> **Tip:** Press `Alt + ?` anytime to open this cheatsheet!

AeroSpace is a tiling window manager for macOS. This config uses a 3-monitor setup with workspace sets.

## Monitor Layout

```
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│   Monitor 1     │  │   Monitor 2     │  │   Monitor 3     │
│   (Left)        │  │   (Center)      │  │   (Right)       │
│                 │  │                 │  │                 │
│   X-web         │  │   X-dev         │  │   1-chat        │
│   (Chrome)      │  │   (Cursor)      │  │   (Slack)       │
│                 │  │                 │  │   ← STICKY      │
└─────────────────┘  └─────────────────┘  └─────────────────┘
```

**Note:** Right monitor stays on `1-chat` (Slack is sticky there)

---

## Window Focus (Vim-style)

| Shortcut | Action |
|----------|--------|
| `Alt + h` | Focus window left |
| `Alt + j` | Focus window down |
| `Alt + k` | Focus window up |
| `Alt + l` | Focus window right |

## Move Windows

| Shortcut | Action |
|----------|--------|
| `Alt + Shift + h` | Move window left |
| `Alt + Shift + j` | Move window down |
| `Alt + Shift + k` | Move window up |
| `Alt + Shift + l` | Move window right |

## Workspaces

| Shortcut | Action |
|----------|--------|
| `Alt + 1` | Switch to workspace set 1 |
| `Alt + 2` | Switch to workspace set 2 |
| `Alt + 3` | Switch to workspace set 3 |
| `Alt + 4` | Switch to workspace set 4 |
| `Alt + 5` | Switch to workspace set 5 |
| `Ctrl + Alt + 1-5` | Move window to workspace 1-5 |
| `Alt + Tab` | Toggle last workspace |

## Monitors

| Shortcut | Action |
|----------|--------|
| `Alt + Ctrl + h` | Focus monitor left |
| `Alt + Ctrl + l` | Focus monitor right |
| `Alt + Ctrl + j` | Focus monitor down |
| `Alt + Ctrl + k` | Focus monitor up |
| `Alt + Ctrl + Shift + h/j/k/l` | Move window to monitor |

## Layout & Window Management

| Shortcut | Action |
|----------|--------|
| `Alt + f` | Toggle fullscreen |
| `Alt + /` | Toggle tile layout (horizontal/vertical) |
| `Alt + ,` | Toggle accordion layout |
| `Alt + Shift + Space` | Toggle floating/tiling |
| `Alt + b` | Balance window sizes |
| `Alt + Shift + b` | Flatten workspace tree |
| `Alt + q` | Close window |
| `Alt + ?` | Show this cheatsheet |

## Modes

| Shortcut | Action |
|----------|--------|
| `Alt + r` | Enter **Resize Mode** |
| `Alt + Space` | Enter **Launch Mode** |
| `Alt + Shift + ;` | Enter **Service Mode** |

---

## Resize Mode (`Alt + r`)

| Key | Action |
|-----|--------|
| `h` | Resize width -50 |
| `l` | Resize width +50 |
| `j` | Resize height +50 |
| `k` | Resize height -50 |
| `Shift + h/l` | Resize width ±100 |
| `Shift + j/k` | Resize height ±100 |
| `Esc` / `Enter` | Exit resize mode |

---

## Launch Mode (`Alt + Space`)

| Key | Action |
|-----|--------|
| `b` | Open Chrome (→ 1-web) |
| `c` | Open Cursor (→ 1-dev) |
| `s` | Open Slack (→ 1-chat) |
| `t` | Open Alacritty (→ 1-dev) |
| `Esc` / `Enter` | Exit launch mode |

---

## Service Mode (`Alt + Shift + ;`)

| Key | Action |
|-----|--------|
| `r` | Reload config |
| `t` | Toggle AeroSpace on/off |
| `Esc` / `Enter` | Exit service mode |

---

## Auto Window Placement

When these apps open, they automatically move to:

| App | Workspace | Monitor |
|-----|-----------|---------|
| Chrome | 1-web | Left |
| Cursor | 1-dev | Center |
| Slack | 1-chat | Right |

---

## Quick Tips

1. **Switch workspace sets** with `Alt + 1-5` (left & center monitors change, right stays on Slack)
2. **Move windows** with `Alt + Shift + h/j/k/l`
3. **Resize windows** by entering resize mode with `Alt + r`
4. **Launch apps** quickly with `Alt + Space` then the app key
5. **Reload config** after editing: `Alt + Shift + ;` then `r`

---

## Config Location

```
~/.config/aerospace/aerospace.toml
```

## Useful Commands

```bash
# Reload config
aerospace reload-config

# List all apps (to find bundle IDs)
aerospace list-apps

# List all windows
aerospace list-windows --all
```
