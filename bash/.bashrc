#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -alhF'
alias rvk='cd ~/drive/School/RVK_UNI/'

export EDITOR=$(which nvim)
export SYSTEM_EDITOR=$EDITOR
export VISUAL=$EDITOR
export ELECTRON_OZONE_PLATFORM_HINT=auto

fortune -ace
eval "$(starship init bash)"
eval "$(ssh-agent -s)" >/dev/null 2>&1

# isGitRepo() {
#   if command -v git >/dev/null 2>&1 && git rev-parse --git-dir >/dev/null 2>&1; then
#     # git repo!
#     printf "\n"
#     git status
#   else
#     # NOT a git repo!
#     return
#   fi
# }
