# Git

## Aliases

```zsh
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcd='cd $(git rev-parse --show-toplevel)' # CDs into the git root
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gs='git status'
alias gst='git status'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias ghi='git hist'
alias gdiff='git diff'
alias gshow='git show'
alias grim='git rebase -i origin/master'
alias groot='cd $(git rev-parse --show-toplevel)' # CDs into the git root (same as gcd)
alias gbn="git rev-parse --abbrev-ref HEAD" # Shows the git branch name
alias cgbn="git rev-parse --abbrev-ref HEAD | pbcopy" # Copies the git branch name
alias gsu="git submodule update --init --recursive --remote" # Update git submodules
```