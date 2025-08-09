#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alhF'

export EDITOR=$(which nvim)
export SYSTEM_EDITOR=$EDITOR
export VISUAL=$EDITOR
export ELECTRON_OZONE_PLATFORM_HINT=auto

eval "$(starship init bash)"
