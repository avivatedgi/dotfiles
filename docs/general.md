# General

## Aliases

```sh
alias vim="nvim"                 # Use neovim as vim
alias sftp="with-readline sftp"  # SFTP with readline support
alias ll="eza -alF --icons"      # Enhanced ls with icons
alias file="magika"              # Use magika for file type detection
alias j="jira"                   # Shorthand for jira CLI
```

## Clipboard Utilities

```sh
alias pwdc='pwd | tr -d "\n" | toclip'       # Copy current directory path to clipboard
alias pwdcd='echo "cd \"$(pwd)\"" | toclip'  # Copy "cd <path>" command to clipboard
```

