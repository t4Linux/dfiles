#!/bin/env bash
# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Version     : 0.1                         2023-03-12     \___)=(___// | #
# +------------------------------------------ 2023-03-12 ------------------+ #
# |  Description :                                                         | # 
# |                                                                        | #
# +------------------------------------------------------------------------+ #
. my_colors
DFILES=$HOME/dotfiles
CFILES=$HOME/.config/
my_dfiles_for_progs=(mc ranger vifm terminator)
# ========================================================================== #
#                             FUNCTIONS                                      #
# ========================================================================== #
lg(){
  if [[ ! -e /usr/local/bin/lazygit ]]; then
    if ! command -v git $>/dev/null; then
      echo "Installing git..."
      sudo apt install -y git
    fi
    echo "Installing lazygit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit.tar.gz
    echo "Lazygit installation successful"
  else
    echo "Lazygit already installed"
  fi
}
ln_dfiles(){
  if ! command -v $i &>/dev/null; then
    echo "Installing $i..."
    sudo apt install -y $i
    if [[ -d $CFILES/$i ]]; then
      rm -fr $CFILES/$i
    fi
  else
    if [[ -d $CFILES/$i ]]; then
      mv $CFILES/$i $CFILES/$i.bak
    fi
  fi
  ln -s $(pwd)/$i $CFILES/$i
}
delta(){
  if ! command -v delta &>/dev/null; then
    # checking for latest version of delta
    local ver=$(curl -s https://lib.rs/crates/git-delta | grep -A 4 "versions" | awk 'END{print}')
    # setting latest download file and installation
    dfile=git-delta-musl_"$ver"_amd64.deb

    echo -e "Installing delta with version "$ver
    cd $HOME/tmp
    wget -q https://github.com/dandavison/delta/releases/download/"$ver"/$dfile
    sudo apt install -y ./$HOME/tmp/$dfile
    rm $HOME/tmp/$dfile
  else 
    echo "Delta already installed"
  fi
}
bat(){
  if ! command -v bat &>/dev/null; then
    # checking for latest version of bat
    local ver=$(curl -s https://github.com/sharkdp/bat/releases | grep -m 1 -A 4 wb-break-all | awk 'END{print}' | awk -F "\"" '{print $2}' | awk -F "/" '{print $NF}' | sed -e '1s/^.//')
    # setting latest download file and installation
    bfile=bat-musl_"$ver"_amd64.deb

    echo -e "Latest version of "$IGreen"bat $ver $Color_Off"
    sleep 1
    cd $HOME/tmp
    wget -q https://github.com/sharkdp/bat/releases/download/v"$ver"/$bfile
    sudo apt install -y ./$HOME/tmp/$bfile
    rm $HOME/tmp/$bfile
  else
    echo "Bat already installed"
  fi
}
neovim(){
  if command -v nvim &>/dev/null; then 
    # checking for current version of nvim
    local ver=$(nvim -version | head -n1 | awk '{print $2}' | awk -F . '{print $2$3}')
    # if version is less then 0.8.1 then installing newer
    if (( $ver <= "81" )); then
      sudo apt remove -y neovim
      sudo apt autoremove -y && sudo apt clean
      echo "Removing older version of neovim"
      echo "Downloading and installing newe version of neovim"
      mkdir -p $HOME/tmp
      wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -P $HOME/tmp
      sudo apt install -y $HOME/tmp/nvim-linux64.deb
      echo "Cleaning up"
      rm $HOME/tmp/nvim-linux64.deb
      echo -e "\nThe newest nvim "$IGreen"v0."${ver:0:1}.${ver:1}$Color_Off" installed"
    elif  (( $ver > "81" )); then
      echo -e "\nInstalled neovim "$IGreen"v0."${ver:0:1}.${ver:1}$Color_Off" is proper version"
    fi
  else
    cd $HOME/tmp
    echo "Downloading and installing newe version of neovim"
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
    sudo apt autoremove -y && sudo apt clean
    sudo apt install -y $HOME/tmp/nvim-linux64.deb
    rm nvim-linux64.deb
    echo -e "\nZainstalowano neovim"
    fi
  }
  rust(){
    if command -v rustc &>/dev/null; then 
      # checking for rust version installed
      ver=$(rustc --version | awk '{print $2}' | awk -F . '{print $1$2}')
      if (( $ver <= "164" )); then
        sudo apt remove -y rustc
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        echo -e "\nZainstalowano najnowszą wersję "$IGreen"rust "${ver:0:1}.${ver:1}".0"$Color_Off
      elif (( $ver > "164" )); then
        echo -e "\nZainstalowana wersja rust jest wystarczająca."
      fi
    else
      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
      echo -e "\nZainstalowano "$IGreen"rust "${ver:0:1}.${ver:1}".0"$Color_Off
    fi
  }
  golang(){
    if ! [[ -d /usr/local/go ]]; then
      cd $HOME/tmp
      wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
      sudo tar -C /usr/local -xvf $HOME/tmp/go1.20.2.linux-amd64.tar.gz
      export PATH=$PATH:/usr/local/go/bin
      rm $HOME/tmp/go1.20.2.linux-amd64.tar.gz
      echo "Zainstalowano Golang"
    else 
      echo "Golang zainstalowany, instalacja pominięta"
    fi
  }
  neovim(){
    if command -v nvim &>/dev/null; then 
      # checking for current version of nvim
      local ver=$(nvim -version | head -n1 | awk '{print $2}' | awk -F . '{print $2$3}')
      # if version is less then 0.8.1 then installing newer
      if (( $ver <= "82" )); then
        sudo apt remove -y neovim
        sudo apt autoremove -y && sudo apt clean
        echo "Removing older version of neovim"
        echo "Downloading and installing newe version of neovim"
        mkdir -p $HOME/tmp
        wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -P $HOME/tmp
        sudo apt install -y $HOME/tmp/nvim-linux64.deb
        echo "Cleaning up"
        rm $HOME/tmp/nvim-linux64.deb
        echo -e "\nThe newest nvim "$IGreen"v0."${ver:0:1}.${ver:1}$Color_Off" installed"
      elif  (( $ver > "81" )); then
        echo -e "\nInstalled neovim "$IGreen"v0."${ver:0:1}.${ver:1}$Color_Off" is proper version"
      fi
    else
      cd $HOME/tmp
      echo "Downloading and installing newe version of neovim"
      wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
      sudo apt autoremove -y && sudo apt clean
      sudo apt install -y $HOME/tmp/nvim-linux64.deb
      rm nvim-linux64.deb
      echo -e "\nZainstalowano neovim"
      fi
    }
    # lunarvim dependencies
    lvim_dep(){
      if command -v nala &>/dev/null; then
        sudo nala update && sudo nala install -y npm pip ripgrep cargo git make python3 nodejs fd-find
      else
        sudo apt update && sudo apt install -y npm pip ripgrep cargo git make python3 nodejs fd-find
      fi
    }
    lunarvim(){
      echo -e "Lunarvim installation is build on neovim program
      so first we have to deal with neovim"
      sleep 2

      neovim
      lvim_dep
      npm i tree-sitter-cli
      pip install pynvim

  # lunarvim testing and installation 
  if [[ -d $HOME/.config/lvim ]]; then
    echo "LunarVim already installed" 
  else
    LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
    echo "LunarVim installed successfuly"
  fi
}
# ========================================================================== #
#                          other symlinks                                    #
# ========================================================================== #
# creating basic folder
if [[ -d $DFILES ]]; then
  mv $DFILES $DFILES.bak 
else
  mkdir -p $DFILES
fi
lg
delta
bat
rust
golang
lunarvim
# symlinks other then in .config
ln -s $(pwd)/aliases $DFILES/aliases
ln -s $(pwd)/lazygit $CFILES/lazygit
ln -s $(pwd)/.gitconfig $HOME/.gitconfig

# ========================================================================== #
#                        symlinks for programs                               #
# ========================================================================== #
for i in ${my_dfiles_for_progs[@]}; do
  ln_dfiles
done
