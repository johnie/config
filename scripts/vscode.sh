while read p; do
  echo Installing $p
  code --install-extension $p
done < ../init/vscode_extensions.json

$vscodeDirectory = "$HOME/Library/Application Support/Code/User"

echo "Backup VSCode settings..."

mv "$vscodeDirectory/settings.json" "$vscodeDirectory/settings.json.backup"

echo "Symlinking VSCode settings..."

ln -sf "../init/vscode_settings.json" "$vscodeDirectory/settings.json"
