#!/bin/env bash

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

open() {
  for file in "$@"; do
    xdg-open "$file" >/dev/null 2>&1 &
    disown $!
  done
}
