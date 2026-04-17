# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$HOME/.local/share/omarchy/default/bash/rc"

# Add your own exports, aliases, and functions here.

# src directory
SRC=$HOME/dots/bash/src

source "$SRC/.bash_aliases"

bind -f ~/.inputrc

source "$SRC/.bash_functions"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin/" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi
