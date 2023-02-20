#!/bin/env bash
# +-- created by: achmur -------------- time4Linux ------+ #
# |     __  __ __  __    _                           __  | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /  | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /   | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /    | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/     | #
# |                                       /_/            | #
# |  Description: ZSH configuration          2023-02-17  | #
# +---------------------------------------- 2023-02-17 --+ #
MY_FILES="$HOME/t4Linux/dotfiles/zsh"

[[ -d "$MY_FILES/aliases" ]]
 && . $MY_FILES/aliases/my_aliases
 && . $MY_FILES/aliases/my_kubectl
 && . $MY_FILES/aliases/aliases_execon
 && . $MY_FILES/aliases/funk

