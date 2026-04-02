if [[ -n "${PREVIEW:-}" ]]; then
  alias preview="open -a '$PREVIEW'"
fi

alias safari="open -a Safari"
alias firefox="open -a Firefox"
alias chrome="open -a 'Google Chrome'"
alias cognito="open -a 'Google Chrome' --args --incognito"
alias imessage="open -a Messages"

if [[ -f "$HOME/code/SpotifyControl/SpotifyControl.scpt" ]]; then
  alias spotify="osascript '$HOME/code/SpotifyControl/SpotifyControl.scpt'"
fi
