# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Dscr: ZSH configuration - env    setting  2023-02-01     \___)=(___// | #
# +------------------------------------------ 2023-03-02 ------------------+ #
# |  USED      - variables
# +------------------------------------------------------------------------+ #
. ~/config_env
# FUNDAMENTALS
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"


export KUBECONFIG="$XDG_CONFIG_HOME/kube"
export MINIKUBE_HOME="$XDG_DATA_HOME"/minikube
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export W3M_DIR="$XDG_STATE_HOME/w3m"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

export BAT_THEME="Coldark-Dark"
export BAT_STYLE="header-filename,header-filesize,grid"

[[ ! -d $MY_FILES ]] || \
 source $MY_FILES/zsh/settings/run_editor
