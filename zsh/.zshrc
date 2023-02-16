#  # +---------------------------------------------+ #
#  # | created by: achmur          __  __ __  __   | #
#  # |                            / /_/ // / / /   | #
#  # | created on: 2022-12-13    / __/ // /_/ /    | #
#  # | updated on: 2023-02-17   / /_/__  __/ /___  | #
#  # |                          \__/  /_/ /_____/  | #
#  # | KUBERNETES configuration         time4Linux | #
#  # +---------------------------------------------+ #
dotfiles="$HOME/dotfiles"
# 
#  # +--------------+ #
#  # |     PATH     | #
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$dotfiles/.krew" ]] && PATH="${KREW_ROOT:-$dotfiles/.krew}/bin:$PATH"
[[ -d "$dotfiles/.config/zsh/git-fuzzy" ]] \
  && PATH="$dotfiles/.config/zsh/git-fuzzy/bin:$PATH"
fpath=($dotfiles/.config/zsh/zsh-completions/src $fpath)
[[ -d "/usr/local/go" ]] && PATH="/usr/local/go/bin:$PATH"
#
#  # +---------------------------------------+ #
#  # |    EDITOR                             | #
[[ -e $dotfiles/.config/zsh/plugins/editor.zsh ]]  \
  && . $dotfiles/.config/zsh/plugins/editor.zsh \
  && . $dotfiles/.config/zsh/plugins/run_editor
#
#  # +---------------------------------------+ #
#  # |    BAT                                | #
export BAT_THEME="Coldark-Dark"
export BAT_STYLE="header-filename,header-filesize,grid"
#
#  # +---------------------------------------+ #
#  # |    KUBERNETES: color & autocomplete   | #
! command -v kubectl &> /dev/null || . $dotfiles/.config/zsh/settings/kubectl.zsh

#  # +---------------------------------------+ #
#  # |    HISTORY settings                   | #
. $dotfiles/.config/zsh/settings/history.zsh

#  # +---------------------------------------+ #
#  # |    p10k settings                      | #
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] &&
. "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# 
#  # +---------------------------------------+ #
#  # |    To customize prompt, run           | #
#  # |    `p10k configure` or edit p10k.zsh  | #
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
source ~/.config/zsh/p10k/powerlevel10k.zsh-theme
#
#  # +---------------+ #
#  # |    ALIASES    | #
[[ -e $dotfiles/aliases/my_aliases ]] && source $dotfiles/aliases/my_aliases
[[ -e $dotfiles/aliases/my_kubectl ]] && source $dotfiles/aliases/my_kubectl
[[ -e $dotfiles/aliases/aliases_execon ]] && source $dotfiles/aliases/aliases_execon
[[ -e $dotfiles/aliases/funk ]] && source $dotfiles/aliases/funk
#	          _   _   _                 
#	 ___  ___| |_| |_(_)_ __   __ _ ___ 
#	/ __|/ _ \ __| __| | '_ \ / _` / __|
#	\__ \  __/ |_| |_| | | | | (_| \__ \
#	|___/\___|\__|\__|_|_| |_|\__, |___/
#	                          |___/    
#
setopt autocd notify
unsetopt beep
bindkey -v
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
# Auto complete with case insensitivity
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Source manjaro-zsh-configuration
[[ -e ~/.config/zsh/plugins/manjaro-zsh-config ]] && source ~/.config/zsh/plugins/manjaro-zsh-config
#$dotfiles/.config/zsh/info.zsh
