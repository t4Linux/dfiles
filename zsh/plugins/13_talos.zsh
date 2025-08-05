if (( ! $+commands[talosctl] )); then
  return
fi

if command -v talosctl &> /dev/null; then
  source <(talosctl completion zsh)
fi
