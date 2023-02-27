#!/bin/env bash
#  # +---------------------------------------------+ #
#  # | created by: achmur          __  __ __  __   | #
#  # |                            / /_/ // / / /   | #
#  # | created on: 2022-12-13    / __/ // /_/ /    | #
#  # | updated on: 2023-02-05   / /_/__  __/ /___  | #
#  # |                          \__/  /_/ /_____/  | #
#  # | KUBERNETES configuration         time4Linux | #
#  # +---------------------------------------------+ #
if command -v kubectl &> /dev/null; then
  autoload -Uz +X compinit && compinit
  source <(kubectl completion zsh | sed 's#${requestComp} 2>/dev/null#${requestComp} 2>/dev/null | head -n -1 | fzf  --multi=0 #g')
  alias kubectl=kubecolor 1>/dev/null
  compdef __start_kubectl k
  compdef kubecolor=kubectl
fi

