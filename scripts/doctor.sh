#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib/dotfiles.sh"

BREWFILE_PATH="$ROOT_DIR/Brewfile"

error_count=0
warning_count=0

print_section() {
  printf '\n== %s ==\n' "$1"
}

ok() {
  printf 'OK    %s\n' "$1"
}

warn() {
  printf 'WARN  %s\n' "$1"
  warning_count=$((warning_count + 1))
}

fail() {
  printf 'MISS  %s\n' "$1"
  error_count=$((error_count + 1))
}

check_homebrew() {
  print_section "Homebrew"

  if ! command -v brew >/dev/null 2>&1; then
    fail "Homebrew is not installed"
    return
  fi

  ok "brew available: $(command -v brew)"

  if brew bundle check --file "$BREWFILE_PATH" >/dev/null 2>&1; then
    ok "Brewfile dependencies satisfied"
  else
    warn "Brewfile has missing packages; run ./install.sh packages"
  fi
}

check_commands() {
  local command_name

  print_section "Commands"

  while IFS= read -r command_name; do
    [[ -n "$command_name" ]] || continue
    if command -v "$command_name" >/dev/null 2>&1; then
      ok "$command_name"
    else
      fail "$command_name missing from PATH"
    fi
  done < <(required_commands)

  while IFS= read -r command_name; do
    [[ -n "$command_name" ]] || continue
    if command -v "$command_name" >/dev/null 2>&1; then
      ok "$command_name"
    else
      warn "$command_name missing from PATH"
    fi
  done < <(optional_commands)
}

check_links() {
  local entry source_path target_path

  print_section "Managed Paths"

  while IFS= read -r entry; do
    [[ -n "$entry" ]] || continue
    source_path="${entry%%:*}"
    target_path="${entry#*:}"

    if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
      ok "$target_path linked"
    elif [ -L "$target_path" ]; then
      warn "$target_path points elsewhere: $(readlink "$target_path")"
    elif [ -e "$target_path" ]; then
      warn "$target_path exists but is not a symlink"
    else
      warn "$target_path is missing"
    fi
  done < <(managed_links)
}

check_local_files() {
  local file_path

  print_section "Local Files"

  while IFS= read -r file_path; do
    [[ -n "$file_path" ]] || continue
    if [ -e "$file_path" ]; then
      ok "$file_path"
    else
      fail "$file_path missing"
    fi
  done < <(required_local_files)

  while IFS= read -r file_path; do
    [[ -n "$file_path" ]] || continue
    if [ -e "$file_path" ]; then
      ok "$file_path"
    else
      warn "$file_path missing"
    fi
  done < <(optional_local_files)
}

print_summary() {
  print_section "Summary"

  if [ "$error_count" -eq 0 ]; then
    ok "doctor completed with $warning_count warning(s)"
  else
    fail "doctor found $error_count required issue(s) and $warning_count warning(s)"
  fi
}

check_homebrew
check_commands
check_links
check_local_files
print_summary

if [ "$error_count" -gt 0 ]; then
  exit 1
fi
