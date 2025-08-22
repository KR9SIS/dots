#!/bin/bash

# Localisation
if sudo grep -q '^is_IS.UTF-8 UTF-8' /etc/locale.gen && sudo grep -q '^en_US.UTF-8' /etc/locale.gen; then
  locale-gen

  if [ ! -e '/etc/locale.conf' ]; then
    echo "LANG=en_us.UTF-8" >/etc/locale.conf
  else
    echo '/etc/locale.conf already exists. Overwrite cmd not run'
  fi
  export LANG='en_us.UTF-8'
  export LC_ALL='is_IS.UTF-8'

  if sudo grep -q '^KEYMAP=is-latin1-us' /etc/locale.gen && sudo grep -q '^KEYMAP=dk-latin1' /etc/locale.gen; then
    echo 'KEYMAP=is-latin1-us' >>/etc/vconsole.conf
    echo 'KEYMAP=dk-latin1' >>/etc/vconsole.conf
  fi
else
  echo "Edit /etc/locale.gen and uncomment is_IS.UTF-8 UTF-8 and en_US.UTF-8"
fi

# System stuff
pacman -Sy \
  blueman \
  bluez \
  bluez-util \
  git \
  hyprlock \
  kvantum \
  kvantum-qt5 \
  libnotify \
  man-db \
  man-pages \
  network-manager-applet \
  networkmanager \
  noto-fonts-emoji \
  pacman-contrib \
  pavucontrol \
  swaync \
  timeshift \
  ttf-font-awesome \
  waybar

# nvim dependencies
pacman -S \
  jdk-openjdk \
  lazygit \
  npm \
  unzip

# User apps
pacman -S \
  discord \
  fastfetch \
  feh \
  nwg-displays \
  qbittorrent \
  signal-desktop \
  spotify-launcher \
  steam \
  stow \
  vlc

# Enable file system trimming for SSD drive maintenance
systemctl enable fstrim.timer

# Change network manager from iwd to NetworkManager
systemctl disable iwd.service
systemctl stop iwd.service
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
