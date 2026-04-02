#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
  cat <<'EOF'
Usage: ./install.sh [command]

Commands:
  link       Create/update symlinks into $HOME
  doctor     Check packages, links, and local setup
  bootstrap  Run link, then print next-step guidance
  macos      Run macOS defaults script
  vscode     Install VS Code settings/extensions
  git        Create ~/.gitconfig.local
  ssh        Create ~/.ssh/id_ed25519 and basic ssh config
  packages   Install packages from Brewfile

If no command is provided, `link` is used.
EOF
}

command_name="${1:-link}"

case "$command_name" in
  link)
    exec "$ROOT_DIR/scripts/link.sh" link
    ;;
  doctor)
    exec "$ROOT_DIR/scripts/doctor.sh"
    ;;
  bootstrap)
    "$ROOT_DIR/scripts/link.sh" link
    cat <<'EOF'

Bootstrap complete.

Suggested next steps:
  1. ./install.sh packages
  2. ./install.sh macos
  3. ./install.sh ssh
  4. ./install.sh git
  5. ./install.sh vscode

Private/local templates live in ./examples.
EOF
    ;;
  macos)
    exec "$ROOT_DIR/scripts/macos.sh"
    ;;
  vscode)
    exec "$ROOT_DIR/scripts/vscode.sh"
    ;;
  git)
    exec "$ROOT_DIR/scripts/git_config.sh"
    ;;
  ssh)
    exec "$ROOT_DIR/scripts/ssh.sh"
    ;;
  packages)
    exec "$ROOT_DIR/scripts/fresh.sh"
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    printf 'Unknown command: %s\n\n' "$command_name" >&2
    usage >&2
    exit 1
    ;;
esac
