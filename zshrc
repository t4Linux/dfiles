# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Description: ZSH configuration: env       2023-11-04     \___)=(___// | #
# +------------------------------------------ 2023-11-04 ------------------+ #
#

# |------------------------   FUNDAMENTALS       --------------------------| #

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# |------------------------       BASH           --------------------------| #

if [[ ! -d $XDG_STATE_HOME/bash/.bashrc ]]; then
  mkdir -p "$XDG_STATE_HOME"/bash
fi
export HISTFILE="$XDG_STATE_HOME"/bash/history
alias bash="bash --init-file "$XDG_STATE_HOME"/bash/.bashrc"

# |------------------------       KUBE           --------------------------| #

export KUBECONFIG="$XDG_CONFIG_HOME/kube" 
export KUBECACHEDIR="$XDG_CACHE_HOME/kube"


# |------------------------       GnuPG          --------------------------| #

export GNUPGHOME="$XDG_DATA_HOME"/gnupg 
if command -v gpg2 &> /dev/null; then
  gpg2 --homedir "$XDG_DATA_HOME"/gnupg
fi

# |------------------------      GOLANG          --------------------------| #

export GOPATH=$XDG_STATE_HOME/go
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GOROOT=/usr/lib/go
export GOPATH=$XDG_STATE_HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# |------------------------        BAT           --------------------------| #

export BAT_THEME="Coldark-Dark"
export BAT_STYLE="header-filename,header-filesize,grid"

# |------------------------        OTHER         --------------------------| #

export AZURE_CONFIG_DIR=$XDG_DATA_HOME/azure
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export LESSHISTFILE="-"
export KUBECONFIG="$XDG_CONFIG_HOME/kube"
export MINIKUBE_HOME="$XDG_DATA_HOME"/minikube
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export W3M_DIR="$XDG_STATE_HOME/w3m"
export _Z_DATA="$XDG_DATA_HOME/z"
# export WGETRC="$XDG_CONFIG_HOME/wgetrc"
# alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
export RUSTUP_HOME="$XDG_CONFIG_HOME/.rustup"


# |------------------------        OTHER         --------------------------| #

export TERMINAL="kitty"

if command -v lvim &> /dev/null; then
  export EDITOR=lvim
  export VISUAL=lvim
else
  if command -v nvim &> /dev/null; then 
    export EDITOR=nvim
    export VISUAL=nvim
  else
    echo "Install NeoVim or LunarVim"
  fi
fi

# |------------------------    Distrobox conf    --------------------------| #

export DBX_CONTAINER_MANAGER="podman"

# |------------------------    Color man pages   --------------------------| #

export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

# |------------------------        PATH          --------------------------| #

[[ ! -d "$HOME/.local/bin" ]] || PATH="$HOME/.local/bin:$PATH"

# |------------------------         ZSH          --------------------------| #

if [[ ! -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION" ]]; then
  mkdir -p $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
fi
# compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

# |------------------------         ZSH          --------------------------| #

ZDOTDIR=/home/donald/.t4Linux/zsh
export MY_FILES=/home/donald/.t4Linux
. "/home/donald/.local/share/cargo/env"
