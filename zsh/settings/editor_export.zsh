#!/bin/env bash
# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Dscr: ZSH configuration - editor setting  2023-02-01     \___)=(___// | #
# +------------------------------------------ 2023-03-02 ------------------+ #
# |  USED      - variables
# |            - functions
# |            - FOR look with 2 variables
# +------------------------------------------------------------------------+ #
. ~/config_env

my_editors=(lvim nvim vim)
my_viewers=(bat cat)

new_editor="export EDITOR="
new_visual="export VISUAL="
new_pager="export PAGER="

set_editor(){
  . ~/config_env
  touch $MY_FILES/zsh/settings/run_editor
  echo $new_editor$i > $MY_FILES/zsh/settings/run_editor
  echo $new_visual$i >> $MY_FILES/zsh/settings/run_editor
  exit 0
}
set_viewer(){
  echo $new_pager$j >> $MY_FILES/zsh/settings/run_editor
}

editor_check(){
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
  if command -v $j &>/dev/null; then
    if [[ $j == bat ]]; then
      j='bat --paging=always --pager="less -Rc"'
      set_viewer
    elif [[ $j == cat ]]; then
      set_viewer
    fi
  fi
  }

if [[ ! -f $MY_FILES/zsh/settings/run_editor ]]; then
for i in ${my_editors[@]}, j in ${my_viewers[@]}; do
  editor_check
done
else
  source $MY_FILES/zsh/settings/run_editor
fi
