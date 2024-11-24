# zsh-completions
for n in $(ls $HOME/.t4Linux/zsh/completion); do
  if [[ -L $HOME/t4Linux/github/zsh-completions/src/$n ]]; then
    return
  else
    ln -s $HOME/.t4Linux/zsh/completion/$n $HOME/t4Linux/github/zsh-completions/src/$n
  fi
done
fpath=($HOME/t4Linux/github/zsh-completions/src $fpath)
