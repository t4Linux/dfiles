# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Description: ZSH configuration            2022-12-13     \___)=(___// | #
# +------------------------------------------ 2023-02-23 ------------------+ #
# | Shelscript :  ZSH configuration file                                   | # 
# | Version    :  1.3                                                      | #
# +------------------------------------------------------------------------+ #
. $MY_FILES/zsh/settings/path.zsh && \
. $MY_FILES/zsh/settings/power10k.zsh && \
. $MY_FILES/zsh/settings/history.zsh && \
. $MY_FILES/zsh/settings/aliases.zsh && \
. $MY_FILES/zsh/settings/plugins.zsh && \
. $MY_FILES/zsh/settings/basic.zsh && \
. $MY_FILES/zsh/settings/manjaro-zsh-config
. $MY_FILES/zsh/settings/kubectl.zsh && \
. $MY_FILES/zsh/settings/lazygit.zsh && \

[ ! -f $MY_FILES/zsh/setting/fzf.zsh ] || source $MY_FILES/settings/fzf/fzf.zsh

