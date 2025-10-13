# GitHub

## Aliases

```sh
alias gpc="gh pr create" # Create a PR of the current branch
alias gpv="gh pr view --web" # View the existing PR of the current branch 
alias gpvc="gh pr view | egrep \"url:\" | head -n 1 | sed \"s/url://g\" | xargs echo -n | pbcopy" # Copy the link of the existing PR of the current branch
alias gpar="gh pr edit --add-reviewer" # Add a reviewer to the current PR of the existing branch
```