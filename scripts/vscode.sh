while read p; do
  echo Installing $p
  code --install-extension $p
done < ../init/vscode_extensions.json
