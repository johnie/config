#!/usr/bin/env bash

set -euo pipefail

printf 'Input your email address (the one used for your GitHub account): '
read -r email

echo "Generating a new SSH key for GitHub..."

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [[ ! -f "$HOME/.ssh/id_ed25519" ]]; then
  ssh-keygen -t ed25519 -C "$email" -f "$HOME/.ssh/id_ed25519"
fi

eval "$(ssh-agent -s)"

touch "$HOME/.ssh/config"

if ! grep -q 'IdentityFile ~/.ssh/id_ed25519' "$HOME/.ssh/config"; then
  cat >> "$HOME/.ssh/config" <<'EOF'
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF
fi

if ssh-add --apple-use-keychain "$HOME/.ssh/id_ed25519" >/dev/null 2>&1; then
  :
else
  ssh-add "$HOME/.ssh/id_ed25519"
fi

echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"
