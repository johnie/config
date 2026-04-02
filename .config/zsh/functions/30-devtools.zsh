function c {
  code "${1:-.}"
}

function mcpc7 {
  claude mcp add --transport http context7 https://mcp.context7.com/mcp
}

function pj {
  if [[ $# -eq 0 ]]; then
    pbpaste | jq '.'
  else
    pbpaste | jq "$@"
  fi
}

function pubkey {
  local public_key="$HOME/.ssh/id_ed25519.pub"

  [[ -f "$public_key" ]] || {
    echo "Missing $public_key"
    return 1
  }

  pbcopy < "$public_key"
  echo '=> Public key copied to pasteboard.'
}
