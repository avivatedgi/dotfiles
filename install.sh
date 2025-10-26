#!/usr/bin/env bash
set -euo pipefail

# ----------------------------------------
# CONFIGURATION
# ----------------------------------------
DOTFILES_REPO="https://github.com/avivatedgi/dotfiles.git"
DOTFILES_DIR="$HOME/.local/share/chezmoi"

# ----------------------------------------
# Helper functions
# ----------------------------------------
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

info() {
  echo -e "\033[1;32m[INFO]\033[0m $*"
}

warn() {
  echo -e "\033[1;33m[WARN]\033[0m $*"
}

# ----------------------------------------
# Install xcode-select
# ----------------------------------------
xcode-select --install &>/dev/null || true

# ----------------------------------------
# Install Homebrew
# ----------------------------------------
if ! command_exists brew; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Ensure brew is in PATH
  if [[ -d /opt/homebrew/bin ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -d /usr/local/bin ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  info "Homebrew already installed."
fi

# ----------------------------------------
# Install chezmoi
# ----------------------------------------
if ! command_exists chezmoi; then
  info "Installing chezmoi..."
  brew install chezmoi
else
  info "chezmoi already installed."
fi

# ----------------------------------------
# Initialize chezmoi
# ----------------------------------------
if [[ ! -d "$DOTFILES_DIR" ]]; then
  info "Initializing chezmoi with repository $DOTFILES_REPO..."
  chezmoi init --apply "$DOTFILES_REPO"
else
  info "chezmoi repo already exists, pulling latest changes..."
  chezmoi update
fi

# ----------------------------------------
# Apply dotfiles
# ----------------------------------------
info "Applying chezmoi configuration..."
chezmoi apply -v

# ----------------------------------------
# Install Brewfile (if it exists)
# ----------------------------------------
if [[ -f "$HOME/.Brewfile" ]]; then
  info "Installing brew packages from Brewfile..."
  brew bundle --global
  brew cleanup
elif [[ -f "$DOTFILES_DIR/dot_Brewfile" ]]; then
  info "Installing brew packages from chezmoi-managed Brewfile..."
  brew bundle --file="$DOTFILES_DIR/dot_Brewfile"
  brew cleanup
else
  warn "No Brewfile found; skipping brew package installation."
fi

# ---------------------------------------
# Install Rust
# ---------------------------------------
if ! command_exists rustc; then
  info "Installing rust..."
  rustup-init
else
  info "rust is already installed."
fi

# --------------------------------------
# Installing Python Dependencies
# --------------------------------------
info "Installing python dependencies..."
python3 -m pip install --break-system-packages ipython pipx
python3 -m pipx install black

# --------------------------------------
# Installing npm Dependencies
# --------------------------------------
info "Installing npm dependencies..."
npm install -g npm@latest
npm install -g npx -f
npm install -g n -f
sudo n stable

# --------------------------------------
# Install Other Dependencies
# --------------------------------------
info "Installing magika"
curl -LsSf https://securityresearch.google/magika/install.sh | sh

# --------------------------------------
# Fix Git Config File
# --------------------------------------
info "Updating .gitconfig file to current user"
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s|/Users/aviv|${HOME}|g" "$HOME/.gitconfig"
else
  sed -i "s|/Users/aviv|${HOME}|g" "$HOME/.gitconfig"
fi

info "✅ Setup complete!"
