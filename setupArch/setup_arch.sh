#!/bin/bash

sudo ./root_setup.sh

# Install AUR apps by setting up and using yay
git clone https://aur.archlinux.org/yay.git "$HOME"
cd "$HOME/yay" || exit
makepkg -si
cd || exit
rm -rf "$HOME/yay"

# Hyprland apps
yay -Sy \
  catppuccin-gtk-theme-mocha \
  hyprshot \
  hypridle \
  hyprpaper \
  starship \
  tofi \
  ttf-cascadia-code-nerd

# User apps
yay -Sy \
  brave-bin \
  joplin-desktop \
  zoom

# Get and set up dotfiles
stow "$HOME/dots/backgrounds/"
stow "$HOME/dots/bash/"
stow "$HOME/dots/hyprland/"
stow "$HOME/dots/kitty/"
stow "$HOME/dots/kvantum/"
stow "$HOME/dots/kwallet/"
stow "$HOME/dots/nvim/"
stow "$HOME/dots/starship/"
stow "$HOME/dots/tofi/"
stow "$HOME/dots/vim"
stow "$HOME/dots/waybar/"
stow "$HOME/dots/zoom/"

# Set up local bin for non package manager installs such as .Appimage files
mkdir "$HOME/bin/"

# Set up python debugger
mkdir -p "$HOME/.virtualenvs"
python -m venv "$HOME/.virtualenvs/debugpy/" || python3 -m venv "$HOME/.virtualenvs/debugpy/"

# Downloads files from backup to this PC
./backup_drive_get.sh
