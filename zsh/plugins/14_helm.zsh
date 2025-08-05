if (( ! $+commands[helm] )); then
  return
fi

if command -v helm &> /dev/null; then
  source <(helm completion zsh)
fi
