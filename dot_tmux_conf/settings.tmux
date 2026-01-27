# ┌─────────────────────────────────────┐
# │   TMUX Settings (macOS)            │
# └─────────────────────────────────────┘

setw -g xterm-keys on
set -s escape-time 1                    # Faster escape time (important for vim)
set -sg repeat-time 600                 # Increase repeat timeout
set -s focus-events on                  # Enable focus events

# Disable activity events "{SESSION} is ready!"
set -g monitor-activity off
set -g monitor-bell off

set -g history-limit 10000              # Increase scrollback buffer

# Terminal Settings - enable true color support
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ',*:RGB'                                           # Enable 24 bit true colors
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'                            # Enable undercurl
set -sa terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m' # undercurl colors

# Faster status bar refresh
set-option -g status-interval 10

# Enable OSC 52 clipboard (works in SSH sessions too)
set -g set-clipboard on

# Scroll with Mouse
set -g mouse on

# Use zsh as default shell on macOS
set -g default-shell /bin/zsh

# ─────────────────────────────────────
#         SESH RECOMMENDED SETTINGS
# ─────────────────────────────────────
# Don't exit tmux when closing a session (sesh will switch to another)
set -g detach-on-destroy off
