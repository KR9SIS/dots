create-url() {
  if [[ "$#" -ne 2 ]]; then
    echo "Usage: create-url <url-name> <url>"
  else
    printf "<meta http-equiv=\"refresh\" content=\"0; url=%s\"/>" "$2" >"./$1.html"
  fi
}

# Write iso file to sd card
iso2sd() {
  if [ $# -ne 2 ]; then
    echo "Usage: iso2sd <input_file> <output_device>"
    echo "Example: iso2sd ~/Downloads/ubuntu-25.04-desktop-amd64.iso /dev/sda"
    echo -e "\nAvailable SD cards:"
    lsblk -d -o NAME,VENDOR,MODEL | grep -E '^sd[a-z]' | awk '{print "/dev/"$1" "$2" "$3}'
  else
    sudo dd bs=4M status=progress oflag=sync if="$1" of="$2"
    sudo eject $2
  fi
}

ls_apps() {
  pacman -Qetq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
}
