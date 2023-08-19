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
REPO=$(pwd)
if [ ${#} -eq 0 ]; then
  echo "Please enter the location of your all DOTFILES folder"
else
location="export MY_FILES"
echo $location"="$HOME/$1 > ~/config_env
. ~/config_env
# |------------------------ setting dir location --------------------------| #
if [[ ! -d $HOME/$1 ]]; then
  mkdir -p $HOME/$1 
fi
# |------------------------ copy repo files to dir ------------------------| #
if [[ ! -d $MY_FILES/zsh ]]; then 
  mkdir -p $MY_FILES/zsh
  cp -r $REPO/zsh/* $MY_FILES/zsh
else 
  mv $MY_FILES/zsh $MY_FILES/zsh.bak
  REPO=$(pwd)
  cp -r $REPO/zsh/* $MY_FILES/zsh
fi

# |------------------------ zsh plugin installer --------------------------| #
zsh_plug(){
  git -C $MY_FILES/zsh/ clone https://github.com/$1.git
}

# |------------------------ plugins installation -------------------------| #
if [[ ! -d $MY_FILES/zsh/fzf ]]; then
    a=prefix=\'~/.fzf\'
    b=prefix=
    c=$MY_FILES/fzf
    zsh_plug "junegunn/fzf"
    sed -ie "s@$a@$b$c@g" $MY_FILES/zsh/fzf/install 
    $MY_FILES/zsh/fzf/install --all --completion --no-fish --no-bash
    mv ~/.fzf.zsh $MY_FILES/zsh/settings/fzf.zsh
  fi

  if [[ ! -d $MY_FILES/zsh/fzf-tab ]]; then
    zsh_plug "Aloxaf/fzf-tab"
  fi

  if [[ ! -d $MY_FILES/zsh/zsh-autosuggestions ]]; then
    zsh_plug "zsh-users/zsh-autosuggestions"
  fi

  if [[ ! -d $MY_FILES/zsh/zsh-completions ]]; then
    zsh_plug "zsh-users/zsh-completions"
  fi

  if [[ ! -d $MY_FILES/zsh/zsh-syntax-highlighting ]]; then
    zsh_plug "zsh-users/zsh-syntax-highlighting"
  fi

  if [[ ! -d $MY_FILES/zsh/powerlevel10k ]]; then
    zsh_plug "romkatv/powerlevel10k"
  fi

  if [[ ! -d $MY_FILES/zsh/git-fuzzy ]]; then
    zsh_plug "bigH/git-fuzzy"
  fi

  if [[ ! -d $MY_FILES/zsh/zsh-history-substring-search ]]; then
    zsh_plug "zsh-users/zsh-history-substring-search"
  fi

  if [[ -f $HOME/.zshrc ]]; then
    rm ~/.zshrc && ln -s $MY_FILES/zsh/zshrc $HOME/.zshrc 
  fi

  if [[ ! -L $HOME/.config/zsh ]]; then
    ln -s $MY_FILES/zsh/ $HOME/.config/zsh
  fi
  if [[ ! -d $MY_FILES/aliases ]]; then
    cp -r $REPO/aliases $MY_FILES
  fi
fi
