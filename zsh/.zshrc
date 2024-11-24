# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Description: ZSH configuration            2022-12-13     \___)=(___// | #
# +------------------------------------------ 2023-02-23 ------------------+ #
# | Shelscript :  ZSH configuration file      2024-11-23                   | # 
# | Version    :  2.0                                                      | #
# +------------------------------------------------------------------------+ #

quote.sh

eval "$(oh-my-posh init zsh --config ~/.t4Linux/zsh/oh_my_posh/negligble.omp.json)"

for j in $HOME/.t4Linux/zsh/settings/*.zsh; do
  source $j || echo "Failed to load $j"
done

autoload -Uz compinit
compinit

# PLUGINS
for i in $HOME/.t4Linux/zsh/plugins/*.zsh; do
  source $i || echo "Failed to load $i"
done

# zstyle :compinstall filename '/home/donald/.t4Linux/zsh/.zshrc'
