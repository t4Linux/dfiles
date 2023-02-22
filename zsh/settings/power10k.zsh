# +-- created by: achmur -------------- time4Linux ------+ #
# |     __  __ __  __    _                           __  | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /  | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /   | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /    | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/     | #
# |                                       /_/            | #
# |  Description: ZSH configuration          2023-02-17  | #
# +---------------------------------------- 2023-02-17 --+ #
#
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] &&
. "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#   To customize prompt, run `p10k configure` or edit p10k.zsh 
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || . ~/.config/zsh/.p10k.zsh
. ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

