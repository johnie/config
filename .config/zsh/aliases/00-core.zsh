alias e="$EDITOR"
alias cl='claude '
alias oc='opencode'
alias reload='source "$HOME/.zshrc" && echo "Reloaded ~/.zshrc"'
alias v='nvim'
alias pbc='pbcopy'
alias pbp='pbpaste'
alias week='date +%V'
alias doh='sudo $(history -p !-1)'

if command -v tre >/dev/null 2>&1; then
  alias tree='tre'
fi

if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
elif command -v batcat >/dev/null 2>&1; then
  alias cat='batcat'
fi

if command -v eza >/dev/null 2>&1; then
  alias l='eza -1A --group-directories-first --color=always --git-ignore'
  alias ls='l'
  alias la='l -l --time-style="+%Y-%m-%d %H:%M" --no-permissions --octal-permissions'
fi
