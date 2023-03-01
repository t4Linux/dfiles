# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Description: ZSH configuration: paths     2023-02-17     \___)=(___// | #
# +------------------------------------------ 2023-03-01 ------------------+ #
#
MY_FILES="$HOME/dotfiles"
[[ ! -d "$HOME/bin" ]] || PATH="$HOME/bin:$PATH"
[[ ! -d "$HOME/.local/bin" ]] || PATH="$HOME/.local/bin:$PATH"
[[ ! -d "$MY_FILES/.krew" ]] || \
PATH="${KREW_ROOT:-$MY_FILES/.krew}/bin:$PATH"
[[ ! -d "$MY_FILES/.config/zsh/git-fuzzy" ]] || \
PATH="$MY_FILES/.config/zsh/git-fuzzy/bin:$PATH"
[[ ! -d "$MY_FILES/.config/zsh/zsh-completions" ]] || \
PATH="$MY_FILES/.config/zsh/zsh-completions/src:$PATH"
[[ ! -d "/usr/local/go" ]] || PATH="/usr/local/go/bin:$PATH"

