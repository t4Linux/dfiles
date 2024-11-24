# +-- created by: achmur -------------- time4Linux ------------------------+ #
# |     __  __ __  __    _                           __           .--.     | #
# |    / /_/ // / / /   (_)___  __  ___  __   ____  / /          |ö_ö |    | #
# |   / __/ // /_/ /   / / __ \/ / / / |/_/  / __ \/ /           |\ü/ |    | #
# |  / /_/__  __/ /___/ / / / / /_/ />  < _ / /_/ / /           //   \ \   | #
# |  \__/  /_/ /_____/_/_/ /_/\__,_/_/|_/(_) .___/_/           (|     | )  | #
# |                                       /_/                 /'\_   _/`\\ | #
# |  Dscr: ZSH configuration - basics          2023-02-17     \___)=(___// | #
# +------------------------------------------ 2023-02-17 ------------------+ #
#

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# autoload -Uz compinit
# compinit
# autoload -Uz zmodload
# zmodload zsh/zle
# zmodload zsh/complist

setopt autocd notify                       # if only directory path is entered, cd there.
setopt correct                             # Auto correct mistakes
setopt extendedglob                        # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                          # Case insensitive globbing
setopt rcexpandparam                       # Array expension with parameters
setopt nocheckjobs                         # Don't warn about running processes when exiting
setopt numericglobsort                     # Sort filenames numerically when it makes sense
setopt nobeep                              # No beep
setopt appendhistory                       # Immediately append history instead of overwriting

bindkey -v
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
# Auto complete with case insensitivity
zstyle ':completion:*' menu select
# Case insensitive tab completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         
# automatically find new executables in path 
zstyle ':completion:*' rehash true                              
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $MY_FILES/zsh/cache

# Offer to install missing package if command is not found
if [[ -r /usr/share/zsh/functions/command-not-found.zsh ]]; then
    source /usr/share/zsh/functions/command-not-found.zsh
    export PKGFILE_PROMPT_INSTALL_MISSING=1
fi

