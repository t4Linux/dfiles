#  #!/bin/env bash
#  # +---------------------------------------------+ #
#  # | created by: achmur          __  __ __  __   | #
#  # |                            / /_/ // / / /   | #
#  # | created on: 2022-12-13    / __/ // /_/ /    | #
#  # | updated on: 2023-02-05   / /_/__  __/ /___  | #
#  # |                          \__/  /_/ /_____/  | #
#  # | KUBERNETES configuration         time4Linux | #
#  # +---------------------------------------------+ #
# 
source zsh_plug
MY_FILES="$HOME/t4Linux/dotfiles/zsh"

if ! [[ -d $MY_FILES/fzf ]]; then
  a=prefix=\'~/.fzf\'
  b=prefix=
  c=$MY_FILES/fzf
  bash  zsh_plug "junegunn/fzf"
  sed -ie "s@$a@$b$c@g" $MY_FILES/fzf/install 
  bash  $MY_FILES/fzf/install --all --completion --no-fish --no-bash
  mv ~/.fzf.zsh $MY_FILES/settings/fzf.zsh
  rm ~/.zshrc && ln -s $MY_FILES/zshrc $HOME/.zshrc 
  . $MY_FILES/fzf.zsh
else
  . $MY_FILES/fzf.zsh
fi

zsh_plug "Aloxaf/fzf-tab"
zsh_plug "bigH/git-fuzzy"
zsh_plug "romkatv/powerlevel10k"
zsh_plug "zsh-users/zsh-completions"
zsh_plug "zsh-users/zsh-history-substring-search"
zsh_plug "zsh-users/zsh-syntax-highlighting"

if [[ -f ~/.config/zsh/.fzf.zsh ]]; then
  source ~/.config/zsh/.fzf.zsh
else

export FZF_DEFAULT_OPTS="--height 50% --layout reverse --info inline --border=double \
    --bind 'ctrl-/:change-preview-window(50%|hidden|)'"
#   --preview 'file {}' --preview-window up,1,border-horizontal \
#   --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"
#
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header /'Press CTRL-Y to copy command into clipboard'"
#
# CTRL + T Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
#
# ALT + C Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
#
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

[[ -f ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh ]] \
  && source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
[[ -f ~/.config/zsh/fzf/shell/key-bindings.zsh ]] \
  && source ~/.config/zsh/fzf/shell/key-bindings.zsh
[[ -d ~/.config/zsh/plugins ]] \
  && source ~/.config/zsh/plugins/zsh-alias-finder.plugin.zsh \  # informs you in given comand has an alias
  && source ~/.config/zsh/plugins/systemd.plugin.zsh \           # 2 times ESC puts sudo infront of command
  && source ~/.config/zsh/plugins/watch.plugin.zsh \             # Ctrl+w puts last ommand on watch -d
  && source ~/.config/zsh/plugins/sudo.plugin.zsh                # 2x ESC ads sudo in front 
[[ -f ~/.config/zsh/zsh-z/zsh-z.plugin.zsh ]] \
  && source ~/.config/zsh/zsh-z/zsh-z.plugin.zsh
[[ -f ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]] \
  && source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
[[ -f ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]] \
  && source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

