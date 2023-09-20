. ~/config_env

lazygit(){
  if ! command -v lazygit &>/dev/null; then
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo mv lazygit /usr/local/bin
rm lazygit.tar.gz
cp 
else
  local lver=$(lazygit --version)
  echo "Your version of lazygit is $lver latest is $LAZYGIT_VERSION"
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


