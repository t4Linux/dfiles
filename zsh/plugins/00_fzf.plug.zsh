# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

if [[ -d $MY_GIT_LOK/fzf ]]; then
  source $MY_GIT_LOK/fzf/shell/completion.zsh
  source $MY_GIT_LOK/fzf/shell/key-bindings.zsh
else
  echo "FZF not not cloned here"
fi

export FZF_COMPLETION_TRIGGER='``'

# CTRL-T runs $FZF_CTRL_T_COMMAND to get a list of files and directories

# export FZF_DEFAULT_COMMAND="fzf --print0 | xargs -0 -o vim"

export FZF_DEFAULT_OPTS="
  --height 50% --layout reverse --info inline --border=double --border=rounded --margin=1% \
  --bind 'ctrl-/:change-preview-window(30%|hidden|)'
  --info=inline"
  # CTRL-/ to toggle small preview window to see the full command

# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'
  --color header:italic
  --header /'Press CTRL-Y to copy command into clipboard'"

# CTRL + T Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# ALT + C Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

#------------- FZF-TAB ----------------

if [[ -d $MY_GIT_LOK/fzf-tab ]]; then
  source $MY_GIT_LOK/fzf-tab/fzf-tab.zsh
  source $MY_GIT_LOK/fzf-tab/fzf-tab.plugin.zsh
else
  echo "FZF-TAB not cloned and not sourced"
fi

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:4,fg+:7 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

#------------- FZF-COMPLETION ----------------

if [[ -d $MY_GIT_LOK/fzf-zsh-completions ]]; then
  source $MY_GIT_LOK/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh
else
  echo "No FZF-COMPLETION"
fi

zstyle ':autocomplete:tab:*' fzf-completion yes
zstyle ':completion:*' fzf-search-display true
