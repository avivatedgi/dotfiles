# ┌─────────────────────────────────────┐
# │   TMUX Key Bindings (macOS)        │
# │   Updated to avoid AeroSpace       │
# │   conflicts                        │
# └─────────────────────────────────────┘

#################
##### UTILS #####
#################
is_nvim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|nvim?x?)(diff)?$'"
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|vim?x?)(diff)?$'"
is_fzf="ps -o state= -o comm= -t '#{pane_tty}' | grep -q 'S fzf'"
is_less="tmux capture-pane -p -t '#{pane_id}' | tail -n 1 | grep '^:$'"

##### MISC #####
# Force Vi mode for keyboard users
set -g status-keys vi
set -g mode-keys vi

# Reload tmux config
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# Fix end/home for xterm-256color
bind -n End send-key C-e
bind -n Home send-key C-a

# ─────────────────────────────────────
#         SPLIT PANES
# ─────────────────────────────────────
# NOTE: Changed from Alt+e/o to avoid AeroSpace conflicts
# Splits windows with ALT+\ (vertical) / ALT+- (horizontal)
bind -n M-'\' if-shell "$is_nvim" "send-keys M-\\\\" 'split-window -h -c "#{pane_current_path}"'
bind -n M-'-' if-shell "$is_nvim" "send-keys M--" 'split-window -v -c "#{pane_current_path}"'

# Alternative: Use prefix for splits (always works)
bind -T prefix '\' split-window -h -c "#{pane_current_path}"
bind -T prefix '-' split-window -v -c "#{pane_current_path}"
bind -T prefix '|' split-window -h -c "#{pane_current_path}"
bind -T prefix '_' split-window -v -c "#{pane_current_path}"

# Close pane with ALT+x (changed from Alt+w to avoid AeroSpace conflict)
bind -n M-x if-shell "$is_nvim" "send-keys M-x" "kill-pane"
bind -n M-X kill-window

# ─────────────────────────────────────
#         PANE NAVIGATION
# ─────────────────────────────────────
# NOTE: Using only Ctrl+hjkl to avoid AeroSpace Alt+hjkl conflicts
# Move around panes with Ctrl+hjkl (vim-style)
bind -n C-h if-shell "$is_nvim" 'send-keys C-h' 'select-pane -L'
bind -n C-j if-shell "$is_nvim || $is_fzf" 'send-keys C-j' 'select-pane -D'
bind -n C-k if-shell "$is_nvim || $is_fzf" 'send-keys C-k' 'select-pane -U'
bind -n C-l if-shell "$is_nvim" 'send-keys C-l' 'select-pane -R'

# Prefix + hjkl also works for navigation (always available)
bind -T prefix h select-pane -L
bind -T prefix j select-pane -D
bind -T prefix k select-pane -U
bind -T prefix l select-pane -R

# Copy-mode navigation
bind -T copy-mode-vi C-h select-pane -L
bind -T copy-mode-vi C-l select-pane -R
bind -T copy-mode-vi C-k select-pane -U
bind -T copy-mode-vi C-j select-pane -D

# ─────────────────────────────────────
#         PANE MANAGEMENT
# ─────────────────────────────────────
# Resize pane with ctrl+arrow in prefix
bind -r -T prefix C-Left resize-pane -L 1
bind -r -T prefix C-Down resize-pane -D 1
bind -r -T prefix C-Up resize-pane -U 1
bind -r -T prefix C-Right resize-pane -R 1

bind -r -T prefix C-h resize-pane -L 1
bind -r -T prefix C-j resize-pane -D 1
bind -r -T prefix C-k resize-pane -U 1
bind -r -T prefix C-l resize-pane -R 1

# Swap panes in prefix mode
bind -r -T prefix H swap-pane -s \{left-of\}
bind -r -T prefix J swap-pane -s \{down-of\}
bind -r -T prefix K swap-pane -s \{up-of\}
bind -r -T prefix L swap-pane -s \{right-of\}

# Move panes in prefix mode
bind -r -T prefix M-H move-pane -t '.{left-of}'
bind -r -T prefix M-J move-pane -h -t '.{down-of}'
bind -r -T prefix M-K move-pane -h -t '.{up-of}'
bind -r -T prefix M-L move-pane -t '.{right-of}'

# Zoom/Unzoom pane with Alt+z (no conflict with AeroSpace)
bind -n M-z resize-pane -Z

# Layout presets in prefix mode
bind -T prefix = select-layout even-horizontal
bind -T prefix + select-layout even-vertical
bind -T prefix Space select-layout tiled

# ─────────────────────────────────────
#         WINDOWS
# ─────────────────────────────────────
# New window ALT+t (no conflict with AeroSpace)
bind -n M-t new-window -c "#{pane_current_path}"
bind -n M-T new-window -c "#{pane_current_path}"

# ─────────────────────────────────────
#         WINDOW SELECTION
# ─────────────────────────────────────
# NOTE: Alt+1-5 conflict with AeroSpace workspace sets
# Using Alt+6-9,0 for tmux windows + prefix mode for all

# Alt+6-9,0 for windows (no AeroSpace conflict)
bind -n M-6 select-window -t :=6
bind -n M-7 select-window -t :=7
bind -n M-8 select-window -t :=8
bind -n M-9 select-window -t :=9
bind -n M-0 select-window -t :=10

# Prefix + number for ALL windows (always works)
bind -T prefix 1 select-window -t :=1
bind -T prefix 2 select-window -t :=2
bind -T prefix 3 select-window -t :=3
bind -T prefix 4 select-window -t :=4
bind -T prefix 5 select-window -t :=5
bind -T prefix 6 select-window -t :=6
bind -T prefix 7 select-window -t :=7
bind -T prefix 8 select-window -t :=8
bind -T prefix 9 select-window -t :=9
bind -T prefix 0 select-window -t :=10

# Last window with Ctrl+Tab or Alt+` (no AeroSpace conflict)
bind -n C-Tab last-window
bind -n M-` last-window

# Copy-mode window selection
bind -T copy-mode-vi M-6 select-window -t :=6
bind -T copy-mode-vi M-7 select-window -t :=7
bind -T copy-mode-vi M-8 select-window -t :=8
bind -T copy-mode-vi M-9 select-window -t :=9
bind -T copy-mode-vi M-0 select-window -t :=10
bind -T copy-mode-vi C-Tab last-window

# Swap windows (prefix mode only to avoid conflicts)
bind -T prefix ! swap-window -d -t :=1
bind -T prefix @ swap-window -d -t :=2
bind -T prefix '#' swap-window -d -t :=3
bind -T prefix '$' swap-window -d -t :=4
bind -T prefix % swap-window -d -t :=5

# ─────────────────────────────────────
#         WINDOW NAVIGATION
# ─────────────────────────────────────
# NOTE: Changed Alt+, to Alt+[ to avoid AeroSpace conflict
# Alt+[/] - move between windows
bind -n M-'[' select-window -p
bind -n M-']' select-window -n

# Alt+Shift+[/] - drag/reorder windows
bind -n M-'{' swap-window -d -t -1
bind -n M-'}' swap-window -d -t +1

# Alt+u/i for prev/next window (no AeroSpace conflict)
bind -n M-u select-window -p
bind -n M-i select-window -n
bind -n M-U swap-window -d -t -1
bind -n M-I swap-window -d -t +1

# Choose paste buffer
bind -T prefix '"' choose-buffer

bind -T copy-mode-vi M-'[' select-window -p
bind -T copy-mode-vi M-']' select-window -n

# ─────────────────────────────────────
#         COPY MODE
# ─────────────────────────────────────
# Start copy mode with Alt+c (no AeroSpace conflict)
bind -n M-c if-shell "$is_less" 'copy-mode; send-keys -X top-line' 'copy-mode'

# Start copy with Space
bind -T copy-mode-vi Space send-keys -X begin-selection

# Clear copy with c (stay in place)
bind -T copy-mode-vi c send-keys -X clear-selection

# Cancel copy with Escape
bind -T copy-mode-vi Escape send-keys -X cancel

# Finish copy with Enter
bind -T copy-mode-vi Enter send-keys -X copy-selection-and-cancel

# Copy with C-c
bind -T copy-mode-vi C-c send-keys -X copy-selection

# Yank (without closing copy-mode) with y - uses pbcopy for macOS
bind -T copy-mode-vi y run-shell "tmux send-keys -X copy-pipe 'pbcopy'; true"

# Enter copy mode + scroll from root mode, Ignored when in nvim/less
bind -n C-u if-shell "$is_nvim || $is_vim || $is_less" "send-keys C-u" 'copy-mode; send-keys -X halfpage-up'

# ─────────────────────────────────────
#         MOUSE COPY MODE
# ─────────────────────────────────────
# Copy word with double click
bind -n DoubleClick1Pane if-shell "$is_nvim" "" 'copy-mode -M; send-keys -X select-word; run-shell "sleep 0.2"; send-keys -X copy-pipe-and-cancel'

# Don't finish copy when mouse drag ends
unbind -T copy-mode-vi MouseDragEnd1Pane

# ─────────────────────────────────────
#         MISC BINDS
# ─────────────────────────────────────
# Toggle type on all panes (synchronize)
bind -n F12 if-shell "$is_nvim" "send-keys F12" 'setw synchronize-panes'

# ─────────────────────────────────────
#         PLUGINS BINDS
# ─────────────────────────────────────
##### TMUX-THUMBS #####
# NOTE: Changed from Alt+s to Alt+y to avoid AeroSpace conflict
# Copy fast with Alt+y
bind -n M-y if-shell "$is_nvim" "send-keys M-y" 'thumbs-pick'

##### TMUX-JUMP #####
# Tmux jump (like vimium) with ALT+shift+y
bind -n M-Y run-shell -b $HOME/.tmux/plugins/tmux-jump/scripts/tmux-jump.sh

##### tmux-text-macros #####
open_macros="tmux split-window -v \"PANE='#{pane_id}' $HOME/.tmux/plugins/tmux-text-macros/tmux-text-macros.tmux -r\""
# Open macros menu with Alt+m (no AeroSpace conflict)
bind -n M-m if-shell "$is_nvim" "send-keys M-m" 'run-shell $open_macros'

# Open macros menu with Alt+shift+m anywhere
bind -n M-M run-shell $open_macros

bind -n M-p run-shell -b "TMUX_FZF_OPTIONS='-p -w 80% -h 80% -m' $HOME/.tmux/plugins/tmux-fzf/scripts/clipboard.sh buffer"

bind -n C-Space if-shell "$is_nvim" "send-keys C-Space" 'run-shell "$HOME/.tmux/plugins/extrakto/scripts/open.sh #{pane_id}"'

# Fuzzback - fuzzy search in scrollback
# NOTE: Using only Alt+/ to avoid AeroSpace Alt+f conflict
bind -n M-'/' if-shell "$is_nvim" "send-keys M-/" 'run-shell -b $HOME/.tmux/plugins/tmux-fuzzback/scripts/fuzzback.sh'

# Also available via prefix
bind -T prefix f run-shell -b $HOME/.tmux/plugins/tmux-fuzzback/scripts/fuzzback.sh

# Alt+Enter for suspend (nested sessions) - no AeroSpace conflict
bind -n M-Enter if-shell "[ -n \"$TMUX\" ]" 'send-keys M-Enter' ''

# ─────────────────────────────────────
#         SESH (Session Manager)
# ─────────────────────────────────────
# Open sesh session picker with Ctrl+b, T (or Alt+o which doesn't conflict)
# --print-query allows creating new sessions by typing a path
bind -T prefix T display-popup -E -w 60% -h 60% "sesh connect \"$(
  sesh list -i | fzf --ansi --no-sort --border-label ' sesh ' --prompt '⚡ ' \
    --header '  ^a all  ^t tmux  ^g config  ^x zoxide  ^d kill  ^f find  (type path to create new)' \
    --print-query \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-a:change-prompt(⚡ )+reload(sesh list -i)' \
    --bind 'ctrl-t:change-prompt(🪟 )+reload(sesh list -it)' \
    --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -ic)' \
    --bind 'ctrl-x:change-prompt(📁 )+reload(sesh list -iz)' \
    --bind 'ctrl-f:change-prompt(🔎 )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
    --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡ )+reload(sesh list -i)' \
  | tail -n 1
)\""

# Quick session picker with Alt+o (no AeroSpace conflict)
bind -n M-o display-popup -E -w 60% -h 60% "sesh connect \"$(
  sesh list -i | fzf --ansi --no-sort --border-label ' sesh ' --prompt '⚡ ' \
    --header '  ^a all  ^t tmux  ^g config  ^x zoxide  ^d kill  ^f find  (type path to create new)' \
    --print-query \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-a:change-prompt(⚡ )+reload(sesh list -i)' \
    --bind 'ctrl-t:change-prompt(🪟 )+reload(sesh list -it)' \
    --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -ic)' \
    --bind 'ctrl-x:change-prompt(📁 )+reload(sesh list -iz)' \
    --bind 'ctrl-f:change-prompt(🔎 )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
    --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡ )+reload(sesh list -i)' \
  | tail -n 1
)\""

# Quick switch to last session with Prefix+L
bind -T prefix L run-shell "sesh last"

# Rename current session with Prefix+R (Shift+r)
bind -T prefix R command-prompt -I "#S" "rename-session -- '%%'"

# Kill pane without confirmation (sesh recommendation)
bind -T prefix x kill-pane
