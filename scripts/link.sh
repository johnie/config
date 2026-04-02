#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib/dotfiles.sh"

BACKUP_ROOT="${DOTFILES_BACKUP_DIR:-$HOME/.dotfiles-backups}"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$BACKUP_ROOT/$TIMESTAMP"

backup_target() {
  local target="$1"
  local relative_path

  relative_path="${target#$HOME/}"
  mkdir -p "$BACKUP_DIR/$(dirname "$relative_path")"
  mv "$target" "$BACKUP_DIR/$relative_path"
  printf 'backed up %s -> %s\n' "$target" "$BACKUP_DIR/$relative_path"
}

link_one() {
  local source_path="$1"
  local target_path="$2"

  mkdir -p "$(dirname "$target_path")"

  if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
    printf 'ok %s\n' "$target_path"
    return
  fi

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    backup_target "$target_path"
  fi

  ln -s "$source_path" "$target_path"
  printf 'linked %s -> %s\n' "$target_path" "$source_path"
}

doctor_one() {
  local source_path="$1"
  local target_path="$2"

  if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
    printf 'linked  %s\n' "$target_path"
  elif [ -L "$target_path" ]; then
    printf 'other   %s -> %s\n' "$target_path" "$(readlink "$target_path")"
  elif [ -e "$target_path" ]; then
    printf 'file    %s\n' "$target_path"
  else
    printf 'missing %s\n' "$target_path"
  fi
}

run_link() {
  local entry source_path target_path

  while IFS= read -r entry; do
    [[ -n "$entry" ]] || continue
    source_path="${entry%%:*}"
    target_path="${entry#*:}"
    link_one "$source_path" "$target_path"
  done < <(managed_links)

  if [ -d "$BACKUP_DIR" ]; then
    printf '\nbackup directory: %s\n' "$BACKUP_DIR"
  fi
}

run_doctor() {
  local entry source_path target_path

  while IFS= read -r entry; do
    [[ -n "$entry" ]] || continue
    source_path="${entry%%:*}"
    target_path="${entry#*:}"
    doctor_one "$source_path" "$target_path"
  done < <(managed_links)
}

case "${1:-link}" in
  link)
    run_link
    ;;
  doctor)
    run_doctor
    ;;
  *)
    printf 'Usage: %s [link|doctor]\n' "$0" >&2
    exit 1
    ;;
esac
