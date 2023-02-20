#  # +---------------------------------------------+ #
#  # | created by: achmur          __  __ __  __   | #
#  # |                            / /_/ // / / /   | #
#  # | created on: 2022-12-13    / __/ // /_/ /    | #
#  # | updated on: 2023-02-05   / /_/__  __/ /___  | #
#  # |                          \__/  /_/ /_____/  | #
#  # | KUBERNETES configuration         time4Linux | #
#  # +---------------------------------------------+ #
#
setopt extended_history         # Record history with timestamp.
setopt inc_append_history       # Append history to file as soon as they're entered.
setopt hist_no_store            # Don't store history commands
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt INC_APPEND_HISTORY       # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY            # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS         # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS     # Delete old recorded entry if new entry is a duplicate.
HISTFILE="$HOME/dotfiles/.config/zsh/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

