#!/usr/bin/env bash

set -euo pipefail

target_file="$HOME/.gitconfig.local"

printf 'Type in your first and last name: '
read -r full_name

printf 'Type in your email address: '
read -r email

cat > "$target_file" <<EOF
[user]
    name = $full_name
    email = $email
    signingkey = ~/.ssh/id_ed25519.pub
EOF

printf 'Wrote %s\n' "$target_file"
