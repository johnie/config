function ghopen {
  if [[ -n "$1" ]]; then
    gh repo view "$1" --web
  else
    gh repo view --web
  fi
}

function ghd {
  gh repo view --web 2>/dev/null || open -a 'Google Chrome' "https://github.com/johnie/${PWD##*/}"
}

function ghu {
  [[ -n "$1" && -n "$2" ]] || {
    echo "Usage: ghu <owner> <repo>"
    return 1
  }

  gh repo view "$1/$2" --web 2>/dev/null || open -a 'Google Chrome' "https://github.com/$1/$2"
}
