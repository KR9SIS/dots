# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias l='ls -lahF'
alias rvk='cd ~/drive/School/RVK_UNI/'

bind -f ~/.inputrc

create-url() {
  if [[ "$#" -ne 2 ]]; then
    echo "Usage: create-url <url-name> <url>"
  else
    printf "<meta http-equiv=\"refresh\" content=\"0; url=%s\"/>" "$2" > "./$1.html"
  fi
}
