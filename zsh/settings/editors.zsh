# +-- created by: achmur -------------- time4Linux ------+ #
# |     __  __ __  __    _                           __  | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /  | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /   | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /    | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/     | #
# |                                       /_/            | #
# |  Description: ZSH configuration          2023-02-17  | #
# +---------------------------------------- 2023-02-23 --+ #

MY_FILES="$HOME/dotfiles/zsh/plugins"
#------------------- BAT --------------------------#
export BAT_THEME="Coldark-Dark"
export BAT_STYLE="header-filename,header-filesize,grid"
#------------------ EDITOR ------------------------#
[[ ! -d $MY_FILES ]] || \
(source $MY_FILES/editor.zsh && \
 source $MY_FILES/run_editor)
