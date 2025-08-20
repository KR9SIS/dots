#!/bin/bash

# Localisation
# Edit /etc/locale.gen and uncomment is_IS.UTF-8 UTF-8 and en_US.UTF-8
locale-gen
echo "LANG=en_us.UTF-8" >/etc/locale.conf
export LANG=en_us.UTF-8
echo "KEYMAP=is-latin1-us" >>/etc/vconsole.conf
echo "KEYMAP=dk-latin1" >>/etc/vconsole.conf

# Install apps
sudo pacman -Sy \
  bluez bluez-util blueman \
  discord \
  fastfetch \
  feh \
  jdk-openjdk \
  joplin-desktop \
  kvantum kvantum-qt5 \
  libnotify swaync \
  man-db man-pages \
  nwg-displays \
  pacman-contrib \
  pavucontrol \
  qbittorrent \
  signal-desktop \
  spotify-launcher \
  steam \
  stow \
  timeshift \
  ttf-font-awesome \
  vlc \
  waybar

git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si

yay -S \
  brave-bin \
  catppuccin-gtk-theme-mocha \
  hyprshot hyprlock hypridle hyprpaper \
  joplin-desktop \
  starship \
  tofi \
  ttf-cascadia-code-nerd \
  zoom

# Get and set up dotfiles
stow "$HOME/dotfiles/backgrounds/"
stow "$HOME/dotfiles/bash/"
stow "$HOME/dotfiles/hyprland/"
stow "$HOME/dotfiles/kitty/"
stow "$HOME/dotfiles/kvantum/"
stow "$HOME/dotfiles/nvim/"
stow "$HOME/dotfiles/starship/"
stow "$HOME/dotfiles/tofi/"
stow "$HOME/dotfiles/vim"
stow "$HOME/dotfiles/waybar/"

mkdir "$HOME/bin/"

mkdir -p "$HOME/.virtualenvs"
python -m venv "$HOME/.virtualenvs/debugpy/" || python3 -m venv "$HOME/.virtualenvs/debugpy/"

systemctl enable fstrim.timer
systemctl disable iwd.service
systemctl stop iwd.service
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
reboot

rsync -avP server@192.168.1.9:/home/server/drive "$HOME"
