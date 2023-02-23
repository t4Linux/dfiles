#  # +---------------------------------------------+ #
#  # | created by: achmur          __  __ __  __   | #
#  # |                            / /_/ // / / /   | #
#  # | created on: 2023-02-17    / __/ // /_/ /    | #
#  # | updated on:              / /_/__  __/ /___  | #
#  # |                          \__/  /_/ /_____/  | #
#  # | Dscr.:                           time4Linux | #
#  # +---------------------------------------------+ #
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

