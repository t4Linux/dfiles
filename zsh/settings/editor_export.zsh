#!/bin/env bash
# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Dscr: ZSH configuration - editor setting  2023-02-01     \___)=(___// | #
# +------------------------------------------ 2023-02-01 ------------------+ #
#
MY_FILES="$HOME/t4Linux/dotfiles/zsh"

my_editors=(lvim nvim vim)
new_editor="export EDITOR="
new_visual="export VISUAL="

set_editor(){
  echo $new_editor$i > $MY_FILES/settings/run_editor
  echo $new_visual$i >> $MY_FILES/plugins/run_editor
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
    echo "You can use program to install it"
    exit 0
  fi
  }

for i in ${my_editors[@]}; do
  program_check
done
