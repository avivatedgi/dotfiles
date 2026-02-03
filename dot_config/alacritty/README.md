# Alacritty & Tmux Guide for macOS

A comprehensive guide for your terminal setup, adapted to work alongside AeroSpace window manager.

---

## Table of Contents

1. [Installation](#installation)
2. [Alacritty Basics](#alacritty-basics)
3. [Tmux Basics](#tmux-basics)
4. [Key Bindings Reference](#key-bindings-reference)
5. [AeroSpace + Tmux Harmony](#aerospace--tmux-harmony)
6. [Tips & Tricks](#tips--tricks)
7. [Troubleshooting](#troubleshooting)

---

## Installation

### 1. Install Prerequisites

```bash
# Install Homebrew if you haven't
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Alacritty
brew install --cask alacritty

# Install tmux
brew install tmux

# Install the font (JetBrains Mono Nerd Font)
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# Install fzf (needed for some tmux plugins)
brew install fzf

# Install tmux plugin manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 2. Start Using

1. Open Alacritty (from Applications or Spotlight: ⌘+Space, type "Alacritty")
2. Start tmux:

   ```bash
   tmux
   ```

3. Install tmux plugins: Press `Ctrl+b` then `Shift+i`

---

## Alacritty Basics

Alacritty is a GPU-accelerated terminal emulator. It's fast, minimal, and highly configurable.

### Configuration Location

```
~/.config/alacritty/alacritty.toml
```

### macOS-Specific Shortcuts

| Shortcut | Action |
|----------|--------|
| `⌘ + V` | Paste |
| `⌘ + C` | Copy |
| `⌘ + N` | New window |
| `⌘ + Q` | Quit |
| `⌘ + H` | Hide window |
| `⌘ + M` | Minimize |
| `⌘ + +` | Increase font size |
| `⌘ + -` | Decrease font size |
| `⌘ + 0` | Reset font size |
| `⌘ + Ctrl + F` | Toggle fullscreen |
| `⌘ + F` | Search forward |

### Customizing Colors

Edit `~/.config/alacritty/alacritty.toml` and modify the `[colors]` section. The config automatically reloads on save!

---

## Tmux Basics

Tmux (Terminal Multiplexer) lets you:

- Split your terminal into multiple panes
- Create multiple windows (like tabs)
- Create multiple sessions
- Detach and reattach to sessions (your work continues even if you close the terminal!)

### Core Concepts

```
Session
└── Window 1 (like a tab)
│   ├── Pane 1
│   └── Pane 2
└── Window 2
    ├── Pane 1
    ├── Pane 2
    └── Pane 3
```

### The Prefix Key

Most tmux commands start with a **prefix key**: `Ctrl + b`

After pressing the prefix, release it, then press the next key.

Example: To create a new window:

1. Press `Ctrl + b`
2. Release
3. Press `c`

### Essential Tmux Commands

#### Starting and Managing Sessions

```bash
# Start a new session
tmux

# Start a named session
tmux new -s myproject

# List sessions
tmux ls

# Attach to a session
tmux attach -t myproject

# Detach from session (keeps it running)
# Press: Ctrl+b then d

# Kill a session
tmux kill-session -t myproject
```

---

## Key Bindings Reference

> **Note:** These bindings are designed to work alongside AeroSpace.
> Alt+hjkl and Alt+1-5 are reserved for AeroSpace window management.

### Pane Management (No Prefix Needed!)

| Shortcut | Action |
|----------|--------|
| `Alt + \` | Split pane vertically (left/right) |
| `Alt + -` | Split pane horizontally (top/bottom) |
| `Alt + x` | Close current pane |
| `Alt + X` | Close current window |
| `Alt + z` | Zoom/unzoom pane (fullscreen toggle) |

### Pane Navigation

| Shortcut | Action |
|----------|--------|
| `Ctrl + h` | Move to left pane |
| `Ctrl + j` | Move to down pane |
| `Ctrl + k` | Move to up pane |
| `Ctrl + l` | Move to right pane |

Or use prefix mode:

| Shortcut | Action |
|----------|--------|
| `Prefix, h` | Move to left pane |
| `Prefix, j` | Move to down pane |
| `Prefix, k` | Move to up pane |
| `Prefix, l` | Move to right pane |

### Window (Tab) Management

| Shortcut | Action |
|----------|--------|
| `Alt + t` | New window (tab) |
| `Alt + 6-9, 0` | Switch to window 6-10 |
| `Prefix, 1-9, 0` | Switch to any window |
| `Alt + `` ` | Switch to last window |
| `Alt + [` | Previous window |
| `Alt + ]` | Next window |
| `Alt + {` | Move window left |
| `Alt + }` | Move window right |
| `Ctrl + Tab` | Next window |
| `Ctrl + Shift + Tab` | Previous window |
| `Ctrl + 1-9` | Switch to window 1-9 |

### Window Navigation (Alternatives)

| Shortcut | Action |
|----------|--------|
| `Alt + u` | Previous window |
| `Alt + i` | Next window |
| `Alt + U` | Move window left |
| `Alt + I` | Move window right |

### Prefix Commands (Ctrl+b, then...)

| Key | Action |
|-----|--------|
| `r` | Reload tmux config |
| `\` or `|` | Split vertically |
| `-` or `_` | Split horizontally |
| `1-9, 0` | Select window 1-10 |
| `=` | Even horizontal layout |
| `+` | Even vertical layout |
| `Space` | Tiled layout |
| `"` | Choose paste buffer |
| `d` | Detach from session |
| `:` | Command prompt |
| `?` | List all key bindings |
| `Shift + i` | Install/update plugins |

### Pane Resizing (Prefix + ...)

| Key | Action |
|-----|--------|
| `Ctrl + h` | Resize pane left |
| `Ctrl + l` | Resize pane right |
| `Ctrl + k` | Resize pane up |
| `Ctrl + j` | Resize pane down |

### Copy Mode

| Shortcut | Action |
|----------|--------|
| `Alt + c` | Enter copy mode |
| `Space` | Start selection (in copy mode) |
| `Enter` | Copy and exit copy mode |
| `y` | Copy without exiting |
| `Escape` | Exit copy mode |
| `c` | Clear selection |
| `Ctrl + u` | Scroll up half page |
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next search match |
| `N` | Previous search match |

In copy mode, use vim-style navigation:

- `h/j/k/l` - move cursor
- `w/b` - word forward/backward
- `0/$` - line start/end
- `g/G` - top/bottom of buffer

### Plugin Shortcuts

| Shortcut | Action |
|----------|--------|
| `Alt + y` | Thumbs: Quick copy visible text |
| `Alt + Y` | Jump: Vimium-like jump to position |
| `Alt + /` | Fuzzback: Fuzzy search scrollback |
| `Prefix, f` | Fuzzback (alternative) |
| `Alt + m` | Text macros menu |
| `Alt + p` | FZF clipboard history |
| `Ctrl + Space` | Extrakto: Extract & copy text |

### Mouse Support

- **Scroll**: Mouse wheel to scroll
- **Select**: Click and drag to select text
- **Double-click**: Select word
- **Copy**: Selection is automatically copied to clipboard

---

## AeroSpace + Tmux Harmony

Your keybindings are designed to work together:

### AeroSpace Controls (Window Manager)

| Keys | Action |
|------|--------|
| `Alt + h/j/k/l` | Focus window in direction |
| `Alt + Shift + h/j/k/l` | Move window in direction |
| `Alt + 1-5` | Switch workspace set |
| `Alt + w/e/s` | Jump to web/dev/chat workspace |
| `Alt + f` | Fullscreen window |
| `Alt + q` | Close window |

### Tmux Controls (Inside Terminal)

| Keys | Action |
|------|--------|
| `Ctrl + h/j/k/l` | Navigate tmux panes |
| `Alt + \` / `Alt + -` | Split tmux panes |
| `Alt + x` | Close tmux pane |
| `Alt + t` | New tmux window |
| `Alt + [/]` or `Alt + u/i` | Navigate tmux windows |
| `Alt + z` | Zoom tmux pane |

### Mental Model

```
┌─────────────────────────────────────────────────────────┐
│  AeroSpace (Alt + h/j/k/l)  manages macOS windows       │
│  ┌───────────────────────────────────────────────────┐  │
│  │  Alacritty Terminal                               │  │
│  │  ┌─────────────────────────────────────────────┐  │  │
│  │  │  Tmux (Ctrl + h/j/k/l) manages panes        │  │  │
│  │  │  ┌─────────────┐  ┌─────────────┐           │  │  │
│  │  │  │   Pane 1    │  │   Pane 2    │           │  │  │
│  │  │  │   (nvim)    │  │   (shell)   │           │  │  │
│  │  │  └─────────────┘  └─────────────┘           │  │  │
│  │  └─────────────────────────────────────────────┘  │  │
│  └───────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

---

## Tips & Tricks

### 1. Session Management with Sesh

[Sesh](https://github.com/joshmedeski/sesh) is your smart session manager. Use it to:

| Shortcut | Action |
|----------|--------|
| `Alt + o` | Open session picker (fuzzy search) |
| `Prefix, T` | Open session picker (alternative) |
| `Prefix, L` | Switch to last session |

**In the session picker:**

- `Ctrl + a` - Show all sessions
- `Ctrl + t` - Show only tmux sessions
- `Ctrl + g` - Show configured sessions
- `Ctrl + x` - Show zoxide directories
- `Ctrl + f` - Find directories in home
- `Ctrl + d` - Kill selected session

**Create sessions for your projects:**

```bash
# Just cd to a directory and sesh will remember it
cd ~/Projects/myapp
sesh connect .

# Or connect to any path
sesh connect ~/Projects/another-app
```

**Configure permanent sessions** in `~/.config/sesh/sesh.toml`

### 2. Session Persistence

Your sessions are automatically saved! Thanks to `tmux-resurrect` and `tmux-continuum`:

- Sessions are saved every minute
- When you restart your computer, just run `tmux` and your sessions restore automatically
- Windows, panes, and their directories are all preserved

### 3. Quick Splits

Remember the visual mnemonics:

- `Alt + \` splits like a vertical line `|` (left/right panes)
- `Alt + -` splits like a horizontal line `—` (top/bottom panes)

### 4. Synchronized Panes

Type the same command in all panes:

1. Press `F12` to enable synchronized input
2. Type your commands
3. Press `F12` again to disable

### 5. Zoom Mode

When you need to focus on one pane:

1. Press `Alt + z` to zoom in
2. Work on your task
3. Press `Alt + z` again to zoom out

### 6. Status Bar Indicators

Look at your status bar:

- **PREFIX**: Shows when prefix key is active
- **ZOOMED**: Shows when a pane is zoomed
- **SYNCED**: Shows when panes are synchronized

---

## Troubleshooting

### Alacritty won't start

```bash
# Check if configuration is valid
alacritty --print-events
```

### Font not rendering correctly

```bash
# Verify font is installed
fc-list | grep -i "JetBrains"
```

### Tmux colors look wrong

Add this to your shell's rc file (`~/.zshrc`):

```bash
export TERM=xterm-256color
```

### Plugins not working

```bash
# Reinstall TPM
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Then in tmux, press: Ctrl+b, Shift+i
```

### Alt key not working on macOS

Make sure "option_as_alt = Both" is set in your alacritty config (already configured).

If using iTerm2 instead, go to:
Preferences → Profiles → Keys → Left/Right Option key → Esc+

---

## Quick Reference Card

```
╔═══════════════════════════════════════════════════════════╗
║           TMUX QUICK REFERENCE (AeroSpace Compatible)     ║
╠═══════════════════════════════════════════════════════════╣
║  PANES                       WINDOWS                      ║
║  ─────                       ───────                      ║
║  Alt+\     Split vert        Alt+t      New window        ║
║  Alt+-     Split horz        Alt+6-9,0  Go to window      ║
║  Alt+x     Close pane        Prefix,1-9 Go to any window  ║
║  Alt+z     Zoom pane         Alt+[/]    Prev/Next         ║
║  C-hjkl    Navigate          Alt+{/}    Move window       ║
║                                                           ║
║  SESSIONS (sesh)             COPY MODE                    ║
║  ───────────────             ─────────                    ║
║  Alt+o     Session picker    Alt+c      Enter copy mode   ║
║  Prefix,T  Session picker    Space      Start selection   ║
║  Prefix,L  Last session      Enter      Copy & exit       ║
║  C-d       Kill session      y          Copy (stay)       ║
║                                                           ║
║  PLUGINS                     PREFIX (Ctrl+b)              ║
║  ───────                     ────────────────             ║
║  Alt+y     Thumbs copy       r          Reload config     ║
║  Alt+/     Fuzzy search      Shift+i    Install plugins   ║
║  Alt+m     Macros            d          Detach            ║
║  C-Space   Extrakto          ?          Show all bindings ║
╚═══════════════════════════════════════════════════════════╝
```

---

## Need Help?

- Tmux manual: `man tmux`
- Alacritty docs: <https://alacritty.org/config-alacritty.html>
- List all tmux bindings: `tmux list-keys`
- Show tmux options: `tmux show-options -g`

Happy terminal-ing! 🖥️
