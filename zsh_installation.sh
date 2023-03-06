#!/bin/env bash
# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Version     : 1.0                         2023-02-21     \___)=(___// | #
# +------------------------------------------ 2023-03-06 ------------------+ #
# |  Description : ZSH configuration setup                                 | # 
# +------------------------------------------------------------------------+ #
#
# |---------------------  checking for script args  -----------------------| #
if [ ${#} -eq 0 ]; then
  echo "Please enter the location you want to install zsh configuration"
else

# |------------------------ setting dir location --------------------------| #
  MY_FILES="$HOME/$1"
  if [[ ! -d $MY_FILES ]]; then
    mkdir -p $MY_FILES
# |------------------------ copy repo files to dir ------------------------| #
  REPO=$(pwd)
  cp -r $REPO/zsh $MY_FILES
  fi

# |------------------------ zsh plugin installer --------------------------| #
  zsh_plug(){
    git -C $MY_FILES clone https://github.com/$1.git
  }

# |------------------------ plugins installation -------------------------| #
  if ! [[ -d $MY_FILES/fzf ]]; then
    a=prefix=\'~/.fzf\'
    b=prefix=
    c=$MY_FILES/fzf
    zsh_plug "junegunn/fzf"
    sed -ie "s@$a@$b$c@g" $MY_FILES/fzf/install 
    $MY_FILES/fzf/install --all --completion --no-fish --no-bash
    mv ~/.fzf.zsh $MY_FILES/settings/fzf.zsh
  fi

  if ! [[ -d $MY_FILES/fzf-tab ]]; then
    zsh_plug "Aloxaf/fzf-tab"
  fi

  if ! [[ -d $MY_FILES/zsh-autosuggestions ]]; then
    zsh_plug "zsh-users/zsh-autosuggestions"
  fi

  if ! [[ -d $MY_FILES/zsh-completions ]]; then
    zsh_plug "zsh-users/zsh-completions"
  fi

  if ! [[ -d $MY_FILES/zsh-syntax-highlighting ]]; then
    zsh_plug "zsh-users/zsh-syntax-highlighting"
  fi

  if ! [[ -d $MY_FILES/powerlevel10k ]]; then
    zsh_plug "romkatv/powerlevel10k"
  fi

  if ! [[ -d $MY_FILES/git-fuzzy ]]; then
    zsh_plug "bigH/git-fuzzy"
  fi

  if ! [[ -d $MY_FILES/zsh-history-substring-search ]]; then
    zsh_plug "zsh-users/zsh-history-substring-search"
  fi

  if [[ -f $HOME/.zshrc ]]; then
    rm ~/.zshrc && ln -s $MY_FILES/zshrc $HOME/.zshrc 
  fi

  if ! [[ -L $HOME/.config/zsh ]]; then
    ln -s $HOME/t4Linux/dotfiles/zsh/ $HOME/.config/zsh
  fi
fi
