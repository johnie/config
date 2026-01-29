#!/usr/bin/env bash
set -euo pipefail

# Ubuntu Setup Script for Starship + Sheldon + Rich Terminal Colors
# Run: bash scripts/install-ubuntu.sh

echo "==> Installing system dependencies..."
sudo apt update
sudo apt install -y zsh git curl wget unzip fontconfig xclip

echo "==> Installing bat (better cat)..."
sudo apt install -y bat
mkdir -p ~/.local/bin
[ ! -L ~/.local/bin/bat ] && ln -s /usr/bin/batcat ~/.local/bin/bat || true

echo "==> Installing eza (better ls)..."
if ! command -v eza &>/dev/null; then
    wget -qO- https://github.com/eza-community/eza/releases/download/v0.18.9/eza_x86_64-unknown-linux-gnu.tar.gz | tar xz -C ~/.local/bin
fi

echo "==> Installing delta (better git diff)..."
if ! command -v delta &>/dev/null; then
    DELTA_VERSION=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep tag_name | cut -d '"' -f4)
    wget -qO /tmp/delta.deb "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/git-delta_${DELTA_VERSION}_amd64.deb"
    sudo dpkg -i /tmp/delta.deb
    rm /tmp/delta.deb
fi

echo "==> Installing starship prompt..."
if ! command -v starship &>/dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo "==> Installing sheldon plugin manager..."
if ! command -v sheldon &>/dev/null; then
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
        | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
fi

echo "==> Installing JetBrainsMono Nerd Font..."
FONT_DIR=~/.local/share/fonts/JetBrainsMono
if [ ! -d "$FONT_DIR" ]; then
    mkdir -p ~/.local/share/fonts
    wget -qO /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
    unzip -qo /tmp/JetBrainsMono.zip -d "$FONT_DIR"
    rm /tmp/JetBrainsMono.zip
    fc-cache -fv
fi

echo "==> Creating config symlinks..."
CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p ~/.config/sheldon

# Starship config
ln -sf "$CONFIG_DIR/.config/starship.toml" ~/.config/starship.toml

# Sheldon config
ln -sf "$CONFIG_DIR/.config/sheldon/plugins.toml" ~/.config/sheldon/plugins.toml

# Shell config files
ln -sf "$CONFIG_DIR/setup/zshrc" ~/.zshrc
ln -sf "$CONFIG_DIR/setup/exports" ~/.exports
ln -sf "$CONFIG_DIR/setup/aliases" ~/.aliases
ln -sf "$CONFIG_DIR/setup/functions" ~/.functions
ln -sf "$CONFIG_DIR/setup/colors" ~/.colors
ln -sf "$CONFIG_DIR/setup/extra" ~/.extra

# Git config
ln -sf "$CONFIG_DIR/setup/gitconfig" ~/.gitconfig
ln -sf "$CONFIG_DIR/setup/gitignore" ~/.gitignore

echo "==> Initializing sheldon (downloading plugins)..."
~/.local/bin/sheldon lock --update

echo "==> Setting zsh as default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
fi

echo ""
echo "✓ Setup complete!"
echo ""
echo "IMPORTANT - SSH Terminal Setup:"
echo "  1. Your local terminal must use a Nerd Font (e.g., JetBrainsMono Nerd Font)"
echo "  2. Enable true color in your terminal settings"
echo "  3. Reconnect SSH session or run: exec zsh"
echo ""
echo "Test colors: printf '\\x1b[38;2;255;100;0mTRUECOLOR\\x1b[0m\\n'"
