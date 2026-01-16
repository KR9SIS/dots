# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# File system
if command -v eza &>/dev/null; then
  alias ls='eza --group-directories-first --icons=auto'
  alias l='eza -lhF --group-directories-first --icons=auto'
  alias la='eza -lahF --group-directories-first --icons=auto'
fi

bind -f ~/.inputrc

create-url() {
  if [[ "$#" -ne 2 ]]; then
    echo "Usage: create-url <url-name> <url>"
  else
    printf "<meta http-equiv=\"refresh\" content=\"0; url=%s\"/>" "$2" >"./$1.html"
  fi
}

ls_apps() {
  pacman -Qetq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
}
