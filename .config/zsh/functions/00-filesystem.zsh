function mdn {
  if [[ -z "$1" ]]; then
    echo "Enter a directory name"
  elif [[ -d "$1" ]]; then
    echo "\`$1' already exists"
  else
    mkdir -p -- "$1" && cd -- "$1"
  fi
}

function cdf {
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

function fs {
  local arg

  if du -b /dev/null >/dev/null 2>&1; then
    arg='-sbh'
  else
    arg='-sh'
  fi

  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* ./*
  fi
}

function cp_p {
  rsync -WavP --human-readable --progress -- "$1" "$2"
}

function prunedir {
  find "${@:-.}" -type d -empty -print0 | xargs -0r rmdir -p
}

function gitexport {
  local dest="$1"
  local ref="${2:-HEAD}"

  [[ -n "$dest" ]] || {
    echo "Usage: gitexport <destination> [ref]"
    return 1
  }

  mkdir -p -- "$dest" && git archive "$ref" | tar -x -C "$dest"
}
