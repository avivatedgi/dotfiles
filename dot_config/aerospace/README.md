# AeroSpace Keybindings Cheat Sheet

> **Tip:** Press `Alt + ?` anytime to open this cheatsheet!

AeroSpace is a tiling window manager for macOS. This config supports two monitor
profiles — **office** (3 monitors) and **home** (laptop + 1 external) — that are
detected and applied automatically on startup.

## Monitor Profiles

### Office (3 monitors)

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

`Alt + 1-5` switches both the left and center monitors together.

### Home (laptop + external)

```
┌─────────────────┐  ┌─────────────────┐
│   External      │  │   Built-in      │
│   (secondary)   │  │   (laptop)      │
│                 │  │                 │
│   X-dev / X-web │  │   1-chat        │
│   (main work)   │  │   (Slack)       │
│                 │  │   ← STICKY      │
└─────────────────┘  └─────────────────┘
```

`Alt + 1-5` switches the workspace on the external monitor only.

---

## Switching Profiles

Profiles are detected **automatically** on AeroSpace startup based on the number
of connected monitors (≤2 → home, ≥3 → office).

To force a profile manually:

```bash
~/.config/aerospace/generate-config.sh home
~/.config/aerospace/generate-config.sh office
```

---

## Window Focus (Vim-style)

Focus crosses monitors at edges and wraps around!

| Shortcut | Action |
|----------|--------|
| `Alt + h` | Focus left (crosses monitors, wraps around) |
| `Alt + j` | Focus down (crosses monitors, wraps around) |
| `Alt + k` | Focus up (crosses monitors, wraps around) |
| `Alt + l` | Focus right (crosses monitors, wraps around) |

## Move Windows (Within Workspace)

| Shortcut | Action |
|----------|--------|
| `Alt + Shift + h` | Move window left |
| `Alt + Shift + j` | Move window down |
| `Alt + Shift + k` | Move window up |
| `Alt + Shift + l` | Move window right |

## Move Windows to Another Monitor

| Shortcut | Action |
|----------|--------|
| `Alt + Ctrl + h` | Move window to monitor left (wraps) |
| `Alt + Ctrl + j` | Move window to monitor down (wraps) |
| `Alt + Ctrl + k` | Move window to monitor up (wraps) |
| `Alt + Ctrl + l` | Move window to monitor right (wraps) |

## Workspaces

| Shortcut | Action |
|----------|--------|
| `Alt + 1` | Switch to workspace set 1 |
| `Alt + 2` | Switch to workspace set 2 |
| `Alt + 3` | Switch to workspace set 3 |
| `Alt + 4` | Switch to workspace set 4 |
| `Alt + 5` | Switch to workspace set 5 |
| `Ctrl + Alt + 1-5` | Move window to workspace 1-5 (dev) |
| `Alt + Tab` | Toggle last workspace |

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

| App | Workspace |
|-----|-----------|
| Chrome | 1-web |
| Cursor | 1-dev |
| Slack | 1-chat |

The actual monitor depends on the active profile.

---

## Quick Tips

1. **Focus across monitors** with `Alt + h/j/k/l` — wraps around at edges!
2. **Switch workspace sets** with `Alt + 1-5`
3. **Move windows within workspace** with `Alt + Shift + h/j/k/l`
4. **Move windows to another monitor** with `Alt + Ctrl + h/j/k/l`
5. **Resize windows** by entering resize mode with `Alt + r`
6. **Launch apps** quickly with `Alt + Space` then the app key
7. **Reload config** after editing: `Alt + Shift + ;` then `r`
8. **Switch profile manually**: `~/.config/aerospace/generate-config.sh home|office`

---

## Config Files

```
~/.config/aerospace/
  aerospace.toml              ← generated (do not edit)
  aerospace-base.toml         ← shared config (edit this)
  profiles/
    home/
      monitors.toml           ← home monitor assignments
      workspace-bindings.toml ← home Alt+N bindings
    office/
      monitors.toml           ← office monitor assignments
      workspace-bindings.toml ← office Alt+N bindings
  generate-config.sh          ← assembles base + profile → aerospace.toml
```

## Useful Commands

```bash
# Reload config
aerospace reload-config

# Regenerate config for current monitor setup
~/.config/aerospace/generate-config.sh

# Force a specific profile
~/.config/aerospace/generate-config.sh home
~/.config/aerospace/generate-config.sh office

# List all apps (to find bundle IDs)
aerospace list-apps

# List all windows
aerospace list-windows --all
```
