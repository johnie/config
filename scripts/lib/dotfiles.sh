#!/usr/bin/env bash

managed_links() {
  printf '%s\n' \
    "$ROOT_DIR/setup/aliases:$HOME/.aliases" \
    "$ROOT_DIR/setup/bashrc:$HOME/.bashrc" \
    "$ROOT_DIR/setup/colors:$HOME/.colors" \
    "$ROOT_DIR/setup/editorconfig:$HOME/.editorconfig" \
    "$ROOT_DIR/setup/exports:$HOME/.exports" \
    "$ROOT_DIR/setup/extra:$HOME/.extra" \
    "$ROOT_DIR/setup/functions:$HOME/.functions" \
    "$ROOT_DIR/setup/gitconfig:$HOME/.gitconfig" \
    "$ROOT_DIR/setup/gitignore:$HOME/.gitignore" \
    "$ROOT_DIR/setup/gittemplate:$HOME/.gittemplate" \
    "$ROOT_DIR/setup/profile:$HOME/.profile" \
    "$ROOT_DIR/setup/zprofile:$HOME/.zprofile" \
    "$ROOT_DIR/setup/zshenv:$HOME/.zshenv" \
    "$ROOT_DIR/setup/zshrc:$HOME/.zshrc" \
    "$ROOT_DIR/.config/aerospace:$HOME/.config/aerospace" \
    "$ROOT_DIR/.config/atuin:$HOME/.config/atuin" \
    "$ROOT_DIR/.config/gh/config.yml:$HOME/.config/gh/config.yml" \
    "$ROOT_DIR/.config/karabiner/karabiner.json:$HOME/.config/karabiner/karabiner.json" \
    "$ROOT_DIR/.config/nvim:$HOME/.config/nvim" \
    "$ROOT_DIR/.config/sheldon:$HOME/.config/sheldon" \
    "$ROOT_DIR/.config/starship.toml:$HOME/.config/starship.toml" \
    "$ROOT_DIR/.config/wezterm:$HOME/.config/wezterm" \
    "$ROOT_DIR/.config/zsh:$HOME/.config/zsh"
}

required_commands() {
  printf '%s\n' \
    git \
    nvim \
    gh \
    jq \
    starship \
    sheldon \
    zoxide
}

optional_commands() {
  printf '%s\n' \
    atuin \
    aws \
    bat \
    bun \
    docker \
    eza \
    fzf \
    helm \
    http \
    k9s \
    kubectl \
    ngrep \
    peco \
    pnpm \
    rg \
    tre \
    tree-sitter \
    wget \
    yq
}

required_local_files() {
  printf '%s\n' \
    "$HOME/.gitconfig.local"
}

optional_local_files() {
  printf '%s\n' \
    "$HOME/.functions.private" \
    "$HOME/.zshrc.local" \
    "$HOME/.exports.local" \
    "$HOME/.npmrc" \
    "$HOME/.ssh/id_ed25519" \
    "$HOME/.config/gh/hosts.yml"
}
