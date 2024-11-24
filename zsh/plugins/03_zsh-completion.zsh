# zsh-completions
for n in $(ls $MY_FILES/zsh/completion); do
  if [[ -L $MY_GIT_LOK/zsh-completions/src/$n ]]; then
    return
  else
    ln -s $MY_FILES/zsh/completion/$n $MY_GIT_LOK/zsh-completions/src/$n
  fi
done
fpath=($MY_GIT_LOK/zsh-completions/src $fpath)
