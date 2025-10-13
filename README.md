# 🧩 Dotfiles

My personal macOS setup and configuration, managed with [chezmoi](https://www.chezmoi.io) and [Homebrew](https://brew.sh).

This repository contains all my development environment settings — shell, editor, tools, and package configuration — so I can reproduce my setup on any new machine in minutes.

---

## 🚀 Quick Install

First, fork this repository and update the following files to include your name and email:

1. `dot_gitconfig-personal.inc` - Update the name and email to your personal name and email in GitHub.
2. `dot_gitconfig-work.inc` - Update the name and email to your work name and email in GitHub.

Run this command on a new Mac to install everything automatically (change `<your_username>` to your username):

```bash
GITHUB_USERNAME=<your_username> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/$GITHUB_USERNAME/dotfiles/main/install.sh)" && rm -rf ~/.local/share/chezmoi/.git
```

---

## 🔧 Configuration

### SSH Keys

Generate two SSH-keys for your GitHub accounts (one for personal, one for work):

```
$ ssh-keygen -t rsa -f ~/.ssh/id_personal_rsa_github
$ ssh-keygen -t rsa -f ~/.ssh/id_work_rsa_github
```

Make sure to use the generated key for configurating your GitHub accounts. From now on, anything you clone under the path `~/Projects/Personal` will use your personal key, and anything you clone under the path `~/Projects/Work` will use your work key.

---

## ❓ What Is Installed?

### IDEs

- Cursor
- VS Code
- [Neovim](https://github.com/neovim/neovim) + [LazyVim](https://github.com/LazyVim/LazyVim)

### Raycast

[Raycast](https://www.raycast.com/) is an application launcher and productivity tool for macOS that acts as a powerful, extendable alternative to the built-in Spotlight search. I highly recommended to configure your own keybindings and downloading your own extensions.

Here are the extensions that I use:

- Visual Studio Code - I mostly use it for searching all recent repositories.
- Jira - For managing and listing issues.
- Base64 - For base64 easy encode/decode from clipboard.
- Spotify Player - For controlling Spotify via Raycast.
- Font Awesome - Search Font Awesome Icons.
- UUID Generator - For generating UUIDs.

Also, here are some of the built-in features you should use and configure them a keybinding:

- Clipboard History - View clipboard history.
- Window Management - Manage window resizing and moving to other monitors.

### Development Tools

- ZSH shell with [zinit](https://github.com/zdharma-continuum/zinit) as a plugin manager and [PowerLevel10k](https://github.com/romkatv/powerlevel10k) as the theme (configured in `~/.p10k.zsh`)
- [Warp](https://www.warp.dev/terminal) - a modern, AI-powered terminal emulator.
- [iTerm2](https://iterm2.com/) - terminal emulator.
- Docker & docker-compose
- [Notion](https://www.notion.com/) - Knowledge base.
- [Notion Calendar](https://www.notion.com/product/calendar) - calendar application for managing personal and work schedules.
- [lnav](https://github.com/tstack/lnav) - log file viewer for the terminal.
- [pgAdmin4](https://www.pgadmin.org/) - management tool for PostgreSQL.
- [Slack](https://slack.com/)

### Languages & Frameworks

- [Go](https://go.dev/)
- [Python](https://www.python.org/)
- [Rust](https://rust-lang.org/)

### CLI Tools

- AWS CLI
- [Jira CLI](https://github.com/ankitpokhrel/jira-cli) - A Jira CLI.
- [psql](https://www.postgresql.org/docs/current/app-psql.html) - the official postgres client.
- [pgcli](https://github.com/dbcli/pgcli) - postgres cli that does auto-completion and syntax highlighting.
- [rg](https://github.com/BurntSushi/ripgrep) - a.k.a ripgrep - super-fast, recursive, command-line search tool that finds patterns in files, similar to grep with performance and features that make it a modern alternative.
- [fd]

### Misc

- [1Password](https://1password.com) - Password Manager
- [UnnaturalScrollWheels](https://github.com/ther0n/UnnaturalScrollWheels) - Invert scroll direction for physical scroll wheels while maintaining "Natural" scrolling for trackpads on MacOS.

---

## ➕ Further Documentation

- [AWS aliases & utils](./docs/aws.md)
- [Go aliases & utils](./docs/go.md)
- [Git aliases & utils](./docs/git.md)
- [GitHub aliases & utils](./docs/github.md)