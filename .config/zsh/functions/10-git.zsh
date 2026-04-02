function groot {
  cd "$(git rev-parse --show-toplevel 2>/dev/null)" || return 1
}

function undopush {
  local remote="${1:-origin}"
  local branch="${2:-$(git branch --show-current)}"

  [[ -n "$branch" ]] || {
    echo "Usage: undopush [remote] <branch>"
    return 1
  }

  git push --force-with-lease "$remote" "HEAD^:$branch"
}

function gcm {
  git checkout main 2>/dev/null || git checkout master 2>/dev/null || {
    echo "Neither 'main' nor 'master' branch exists in this repository."
    return 1
  }
}

function clone {
  git clone "$1" || return 1

  local repo_name
  repo_name=$(basename "$1")
  repo_name=${repo_name%.git}
  cd "$repo_name" || return 1
}

function gdated {
  local prefix="${1:-feature/updates}"

  git checkout -b "${prefix}-$(date +%Y-%m-%d)"
}
