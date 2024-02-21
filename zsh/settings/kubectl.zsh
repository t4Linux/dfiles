#!/bin/env bash
# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Dscr: ZSH configuration - KUBERNETES      2022-12-13     \___)=(___// | #
# +------------------------------------------ 2023-03-01 ------------------+ #
#
# if command -v kubectl &> /dev/null; then
#   source <(kubectl completion zsh | sed 's#${requestComp} 2>/dev/null#${requestComp} 2>/dev/null | head -n -1 | fzf  --multi=0 #g')
#   alias kubectl=kubecolor 1>/dev/null
#   compdef __start_kubectl k
#   compdef kubecolor=kubectl
# fi


[[ ! -e $MY_FILES/zsh/plugins/_kubectx.zsh ]] || \
  source $MY_FILES/zsh/plugins/_kubectx.zsh

[[ ! -f $MY_FILES/zsh/plugins/_kubens.zsh ]] || \
  source $MY_FILES/zsh/plugins/_kubens.zsh

# This function implements `kubectl view-serviceaccount-kubeconfig **`
# Function name must be _fzf_complete_(command)_(subcommand)
_fzf_complete_kubectl_view-serviceaccount-kubeconfig() {
    # Call preprocessors
    _fzf_complete_kubectl_parse_resource_and_name 2
    _fzf_complete_kubectl_parse_completing_option
    _fzf_complete_kubectl_parse_kubectl_arguments

    # Return status code other than 0 to fall back to default
    if [[ -n $completing_option ]]; then
        return 1
    fi

    # Call any one of completion functions; see source code as to their usage
    resource=serviceaccounts
    _fzf_complete_kubectl-resource-names '' "$@"
}
