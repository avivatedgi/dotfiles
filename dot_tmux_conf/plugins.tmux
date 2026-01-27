# ┌─────────────────────────────────────┐
# │   TMUX Plugins (macOS)             │
# └─────────────────────────────────────┘
#
# Install TPM first: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Then press: prefix + I (Shift+i) to install plugins

############################
##### PLUGINS SETTINGS #####
############################

# Session restore/save
set -g @continuum-restore 'on'
set -g @continuum-save-interval '1'
set -g @resurrect-processes 'false'     # Don't restore programs

# Mouse mode
set -g @emulate-scroll-for-no-mouse-alternate-buffer "on"

# Notifications
set -g @tnotify-verbose 'on'
set -g @tnotify-verbose-msg '#S: #I #W is done!'
set -g @tnotify-sleep-duration '2'

# URL picker
set -g @fzf-url-fzf-options '--reverse'

# Fuzzback (fuzzy search in scrollback)
set -g @fuzzback-fzf-layout 'default'
set -g @fuzzback-popup 1
set -g @fuzzback-popup-size '70%'

# Command capture
set -g @command-capture-prompt-pattern ' $ '

# Thumbs (quick copy)
set -g @thumbs-command 'echo -n {} | pbcopy; tmux display-message "Copied {}"'

# Window naming
set -g @tmux_window_name_ignored_programs "['sqlite3']"
set -g @tmux_window_name_dir_programs "['nvim', 'git', 'fugitive', 'git_tree', 'kv']"

# Text macros
set -g @ttm-load-default-macros off
set -g @ttm-window-mode 'vertical'

# Browser integration
set -g @new_browser_window 'open -a "Safari"'

# Extrakto (copy text from terminal)
set -g @extrakto_split_direction 'p'
set -g @extrakto_clip_tool 'pbcopy'
set -g @extrakto_popup_size '50%'
set -g @extrakto_grab_area 'window full'
set -g @extrakto_copy_key 'tab'
set -g @extrakto_insert_key 'enter'

# ─────────────────────────────────────
#         PLUGINS BINDS
# ─────────────────────────────────────

##### TMUX-SUSPEND #####
# Focus on nested ssh session (Alt+Enter)
set -g @suspend_key 'M-Enter'

##### TMUX-OPEN #####
# Open text in google search
set -g @open-s 'https://www.google.com/search?q='

##### TMUX-FZF-URL #####
set -g @fzf-url-bind 'u'

##### TMUX-FUZZBACK #####
set -g @fuzzback-bind f

##### TMUX_CAPTURE_LAST_COMMAND_OUTPUT #####
set -g @command-capture-key l

###################
##### PLUGINS #####
###################
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'ofirgall/tmux-window-name'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'nhdaly/tmux-better-mouse-mode'
set -g @plugin 'MunifTanjim/tmux-suspend'
set -g @plugin 'ofirgall/tmux-notify'
set -g @plugin 'wfxr/tmux-fzf-url'
set -g @plugin 'roosta/tmux-fuzzback'
set -g @plugin 'ofirgall/tmux_capture_last_command_output'
set -g @plugin 'fcsonline/tmux-thumbs'
set -g @plugin 'schasse/tmux-jump'
set -g @plugin 'Neo-Oli/tmux-text-macros'
set -g @plugin 'sainnhe/tmux-fzf'
set -g @plugin 'laktak/extrakto'

###########
# RUN TPM #
###########
run '$HOME/.tmux/plugins/tpm/tpm'
