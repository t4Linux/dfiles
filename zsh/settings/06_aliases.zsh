#    ____            __          _    
#   / __/_  ______  / /_______  (_)__ 
#  / /_/ / / / __ \/ //_/ ___/ / / _ \
# / __/ /_/ / / / / ,< / /__  / /  __/
#/_/  \__,_/_/ /_/_/|_|\___/_/ /\___/ 
#                         /___/       
napis() {
  figlet $1 -f slant
}
#                    __
#   _______  _______/ /____  ____ ___ 
#  / ___/ / / / ___/ __/ _ \/ __ `__ \
# (__  ) /_/ (__  ) /_/  __/ / / / / /
#/____/\__, /____/\__/\___/_/ /_/ /_/ 
#     /____/                          
#
#    #  NALA  #
alias list='apt list --upgradable'
alias nu='sudo nala full-upgrade -y && flatpak update -y && sudo nala autoremove -y'
alias ni='sudo nala install -y'
alias nr='sudo nala remove'
alias ns='nala search'

alias psd='pactl set-default-sink '
alias psc='pactl set-card-pprofile '

# config
alias s='source ~/.zshrc'
alias vs='nvim ~/.zshrc'
alias h='history -i -n 100 | bat -pl log'
alias e='exit'
alias t='tmux'

alias r='ranger'
alias cat='bat -f'
alias ym='bat --language=yaml'
alias v='nvim'
alias vk='NVIM_APPNAME="vk" nvim'
alias sv='sudo nvim'
alias napis='figlet'

# herbstlusftwm
alias hc='herbstclient' 

# IP
alias ip='ip -c'
alias ipb='ip -br -c a'
alias eip='curl icanhazip.com'

# directories
alias ..='cd ..'
alias ...='cd ../..'
alias cdc='cd ~/.config'
alias cdb='cd ~/.local/bin'

alias cp='cp -iv -p'
alias mv='mv -iv'
alias rm='rm -v'
alias free='free -m'
alias ncdu='ncdu --color dark'

alias ping='ping -c 3'
alias tree='tree -C'
alias nface='sudo nmcli conn'

alias ll='exa -lg --group-directories-first --icons --color-scale --time-style=long-iso'
alias la='exa -lga --group-directories-first --icons --color-scale --time-style=long-iso'

alias m='minikube'
alias d='docker'

# alias orphan='sudo pacman -Rs $(pacman -Qqtd)'
