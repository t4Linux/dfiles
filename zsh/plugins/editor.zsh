#!/bin/env bash
#
#  # created by: achmur
#  #             time4Linux
#  # created on: 2023-02-01
#  #  Description: 
#  #        EDITOR setting 
. my_colors

my_editors=(lvim nvim vim)
new_editor="export EDITOR="
new_visual="export VISUAL="

set_editor(){
  echo $new_editor$i > $HOME/dotfiles/.config/zsh/plugins/run_editor
  echo $new_visual$i >> $HOME/dotfiles/.config/zsh/plugins/run_editor
  exit 0
}

program_check(){
  if command -v $i &>/dev/null; then
    if [[ $i == lvim ]]; then
      set_editor
    elif [[ $i == nvim ]]; then
      set_editor
    elif [[ $i == vim ]]; then
      set_editor
    fi
  else
    echo -e "Please install "$IGreen" vim | neovim | lunarvim "$Color_Off"to set your "$IGreen"EDITOR"$Color_Off
    exit 0
  fi
  }

for i in ${my_editors[@]}; do
  program_check
done
