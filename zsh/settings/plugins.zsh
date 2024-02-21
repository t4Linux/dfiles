# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Description: ZSH configuration: plugins   2022-12-13     \___)=(___// | #
# +------------------------------------------ 2023-03-01 ------------------+ #

[[ ! -f $MY_FILES/zsh/settings/fzf.zsh ]] || \
source $MY_FILES/zsh/settings/fzf.zsh

export FZF_DEFAULT_OPTS="--height 50% --layout reverse --info inline --border=double \
    --bind 'ctrl-/:change-preview-window(50%|hidden|)'"
#   --preview 'file {}' --preview-window up,1,border-horizontal \
#   --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header /'Press CTRL-Y to copy command into clipboard'"

# CTRL + T Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# ALT + C Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

#----------------------------------------------
zstyle ':autocomplete:tab:*' fzf-completion yes
zstyle ':completion:*' fzf-search-display true


[[ ! -d $MY_FILES/zsh/plugins ]] || \
# informs you in given comand has an alias
source $MY_FILES/zsh/plugins/zsh-alias-finder.plugin.zsh && \
# 2 times ESC puts sudo infront of command
source $MY_FILES/zsh/plugins/systemd.plugin.zsh && \
# Ctrl+w puts last ommand on watch -d
source $MY_FILES/zsh/plugins/watch.plugin.zsh && \
# 2x ESC ads sudo in front 
source $MY_FILES/zsh/plugins/sudo.plugin.zsh                      

#-----------------FZF-TAB---------------------
[[ ! -d $MY_FILES/zsh/fzf-tab ]] || \
source $MY_FILES/zsh/fzf-tab/fzf-tab.plugin.zsh
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
#---------------------------------------------

[[ ! -d $MY_FILES/zsh/fzf ]] || \
source $MY_FILES/zsh/fzf/shell/key-bindings.zsh
[[ ! -d $MY_FILES/zsh/zsh-z ]] || \
source $MY_FILES/zsh/zsh-z/zsh-z.plugin.zsh
[[ ! -d $MY_FILES/zsh/zsh-autosuggestions ]] || \
source $MY_FILES/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
[[ ! -d $MY_FILES/zsh/zsh-syntax-highlighting ]] || \
source $MY_FILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
[[ ! -d $MY_FILES/zsh/zsh-completions/ ]] || \
source $MY_FILES/zsh/zsh-completions/zsh-completions.plugin.zsh
[[ ! -d $MY_FILES/zsh/fzf-zsh-completions/ ]] || \
source $MY_FILES/zsh/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh

