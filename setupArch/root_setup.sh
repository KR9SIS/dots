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
  git \
  bluez \
  bluez-util \
  blueman \
  unzip \
  npm \
  networkmanager \
  network-manager-applet \
  pacman-contrib \
  kvantum \
  kvantum-qt5 \
  libnotify \
  swaync \
  man-db \
  man-pages \
  pavucontrol \
  waybar \
  timeshift \
  ttf-font-awesome \
  noto-fonts-emoji \
  hyprlock

# User apps
pacman -S \
  stow \
  discord \
  fastfetch \
  nwg-displays \
  feh \
  lazygit \
  jdk-openjdk \
  qbittorrent \
  signal-desktop \
  spotify-launcher \
  steam \
  vlc

# Enable file system trimming for SSD drive maintenance
systemctl enable fstrim.timer

# Change network manager from iwd to NetworkManager
systemctl disable iwd.service
systemctl stop iwd.service
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
