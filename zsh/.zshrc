#  # +---------------------------------------------+ #
#  # | created by: achmur           time4Linux     | #
#  # | ------------------          __  __ __  __   | #
#  # |                            / /_/ // / / /   | #
#  # | created on: 2022-12-13    / __/ // /_/ /    | #
#  # | updated on: 2023-02-05   / /_/__  __/ /___  | #
#  # |                          \__/  /_/ /_____/  | #
#  # | Description:                                | #
#  # |       my zsh configuration file             | #
#  # +---------------------------------------------+ #
dotfiles="$HOME/dotfiles"
#
# 
#  # +--------------+ #
#  # |     PATH     | #
#  
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$dotfiles/.krew" ]] && PATH="${KREW_ROOT:-$dotfiles/.krew}/bin:$PATH"
[[ -d "$dotfiles/.config/zsh/git-fuzzy" ]] && PATH="$dotfiles/.config/zsh/git-fuzzy/bin:$PATH"
fpath=($dotfiles/.config/zsh/zsh-completions/src $fpath)
[[ -d "/usr/local/go" ]] && PATH="/usr/local/go/bin:$PATH"
#
#
#  # +--------------+ #
#  # |    EDITOR    | #
# 
[[ -e $dotfiles/.config/zsh/plugins/editor.zsh ]]  && $dotfiles/.config/zsh/plugins/editor.zsh && source $dotfiles/.config/zsh/plugins/run_editor
#
#
#  # +-----------+ #
#  # |    BAT    | #
#  # +-----------+ #
#
export BAT_THEME="Coldark-Dark"
export BAT_STYLE="header-filename,header-filesize,grid"
#
#
#  # +----------------------------------------+ #
#  # |    KUBERNETES: color & autocomplete    | #
#  # +----------------------------------------+ #
#
! command -v kubectl &> /dev/null || source $dotfiles/.config/zsh/kubectl
#autoload -Uz +X compinit && compinit
#source <(kubectl completion zsh | sed 's#${requestComp} 2>/dev/null#${requestComp} 2>/dev/null | head -n -1 | fzf  --multi=0 #g') 2>/dev/null;
#alias kubectl=kubecolor 
#compdef __start_kubectl k
#compdef kubecolor=kubectl
#  Make all kubectl completion fzf
# command -v fzf >/dev/null 2>&1 && { 
#  source <(kubectl completion zsh | sed 's#${requestComp} 2>/dev/null#${requestComp} 2>/dev/null | head -n -1 | fzf  --multi=0 #g')
# }
#
#
#  # +------------------------+ #
#  # |    HISTORY settings    | #
#  # +------------------------+ #
#
setopt extended_history         # Record history with timestamp.
setopt inc_append_history       # Append history to file as soon as they're entered.
setopt hist_no_store            # Don't store history commands
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
HISTFILE="$HOME/dotfiles/.config/zsh/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
#
#
#  # +---------------------+ #
#  # |    p10k settings    | #
#  # +---------------------+ #
#
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] &&
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# 
#  #  To customize prompt, run `p10k configure` or edit p10k.zsh  #
#  #--------------------------------------------------------------#
#
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
source ~/.config/zsh/p10k/powerlevel10k.zsh-theme
#  
#
#  # +---------------+ #
#  # |    ALIASES    | #
#  # +---------------# #
#
[[ -e $dotfiles/aliases/my_aliases ]] && source $dotfiles/aliases/my_aliases
[[ -e $dotfiles/aliases/my_kubectl ]] && source $dotfiles/aliases/my_kubectl
[[ -e $dotfiles/aliases/aliases_execon ]] && source $dotfiles/aliases/aliases_execon
[[ -e $dotfiles/aliases/funk ]] && source $dotfiles/aliases/funk
#    
#
#  # +-------------------+ #
#  # |    ZSH PLUGINS    | #
#  # +-------------------+ #
#
#          #  FZF  #
#          #-------#
#
[[ -f ~/.config/zsh/.fzf.zsh ]] && source ~/.config/zsh/.fzf.zsh
# 
export FZF_DEFAULT_OPTS="--height 50% --layout reverse --info inline --border=double \
    --bind 'ctrl-/:change-preview-window(50%|hidden|)'"
#    --preview 'file {}' --preview-window up,1,border-horizontal \
#    --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"
# CTRL + R
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# CTRL + T Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# ALT + C Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
#
#
#        #  FZF-TAB  #
#        #-----------#
#
[[ -e ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh ]] && source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
[[ -f ~/.config/zsh/fzf/shell/key-bindings.zsh ]] && source ~/.config/zsh/fzf/shell/key-bindings.zsh
#
source ~/.config/zsh/plugins/zsh-alias-finder.plugin.zsh                        # informs you in given comand has an alias
source ~/.config/zsh/plugins/systemd.plugin.zsh                                 # 2 times ESC puts sudo infront of command
source ~/.config/zsh/plugins/watch.plugin.zsh                                   # Ctrl+w puts last ommand on watch -d
source ~/.config/zsh/plugins/sudo.plugin.zsh
source ~/.config/zsh/zsh-z/zsh-z.plugin.zsh                                     # jumps to folder
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
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
#-----------------FZF-TAB---------------------
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
#----------------------------------------------
zstyle ':autocomplete:tab:*' fzf-completion yes
zstyle ':completion:*' fzf-search-display true
# Source manjaro-zsh-configuration
[[ -e ~/.config/zsh/plugins/manjaro-zsh-config ]] && source ~/.config/zsh/plugins/manjaro-zsh-config
#$dotfiles/.config/zsh/info.zsh
