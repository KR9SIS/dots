# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
# source "$HOME/.local/share/omarchy/default/bash/rc"

# src directory

source "$HOME/.bash/functions"

source "$HOME/.bash/aliases"

bind -f ~/.inputrc

. "$HOME/.bash/colorize_man"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin/" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# History control
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"

# Autocompletion
if [[ ! -v BASH_COMPLETION_VERSINFO && -f /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

# Ensure command hashing is off for mise
# set +h

# INFO: Inits

if exists fzf; then
  if [[ -f /usr/share/fzf/completion.bash ]]; then
    source /usr/share/fzf/completion.bash
  fi
  if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
    source /usr/share/fzf/key-bindings.bash
  fi
fi

if [[ $- == *i* ]] && [[ ${TERM:-} != "dumb" ]] && exists starship; then
  eval "$(starship init bash)"
fi

if exists zoxide; then
  eval "$(zoxide init bash)"
fi
