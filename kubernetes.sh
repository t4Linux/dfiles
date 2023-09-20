#!/bin/env bash

. ~/config_env
# krew plugin for kubectl
ln -s $MY_FILES/krew/ $HOME/.krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# color output for command
sudo apt update && sudo apt install nala -y
sudo nala install kubecolor

