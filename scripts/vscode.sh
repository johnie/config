#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VSCODE_DIRECTORY="$HOME/Library/Application Support/Code/User"
SETTINGS_SOURCE="$ROOT_DIR/bootstrap/vscode/settings.json"
KEYBINDINGS_SOURCE="$ROOT_DIR/bootstrap/vscode/keybindings.json"
EXTENSIONS_SOURCE="$ROOT_DIR/bootstrap/vscode/extensions.txt"

while IFS= read -r extension; do
  [[ -z "$extension" ]] && continue
  echo "Installing $extension"
  code --install-extension "$extension"
done < "$EXTENSIONS_SOURCE"

mkdir -p "$VSCODE_DIRECTORY"

if [[ -e "$VSCODE_DIRECTORY/settings.json" && ! -L "$VSCODE_DIRECTORY/settings.json" ]]; then
  mv "$VSCODE_DIRECTORY/settings.json" "$VSCODE_DIRECTORY/settings.json.backup.$(date +%Y%m%d-%H%M%S)"
fi

if [[ -e "$VSCODE_DIRECTORY/keybindings.json" && ! -L "$VSCODE_DIRECTORY/keybindings.json" ]]; then
  mv "$VSCODE_DIRECTORY/keybindings.json" "$VSCODE_DIRECTORY/keybindings.json.backup.$(date +%Y%m%d-%H%M%S)"
fi

ln -sfn "$SETTINGS_SOURCE" "$VSCODE_DIRECTORY/settings.json"
ln -sfn "$KEYBINDINGS_SOURCE" "$VSCODE_DIRECTORY/keybindings.json"
