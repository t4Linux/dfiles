# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Dscr: ZSH configuration - aliases         2023-02-17     \___)=(___// | #
# +------------------------------------------ 2023-03-01 ------------------+ #
. ~/config_env
dep=(exa bat ranger alacritty)

if ! command -v $i $>/dev/null; then
for i in ${dep[@]}; do
   echo "You have to install " $i" for all aliases to work." 
done
fi

[[ ! -f $MY_FILES/aliases/my_aliases ]] || . $MY_FILES/aliases/my_aliases
[[ ! -f $MY_FILES/aliases/my_kubectl ]] || . $MY_FILES/aliases/my_kubectl
[[ ! -f $MY_FILES/aliases/aliases_execon ]] || . $MY_FILES/aliases/aliases_execon
