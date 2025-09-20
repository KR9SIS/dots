#!/bin/bash

# Localisation
if sudo grep -q '^is_IS.UTF-8 UTF-8' /etc/locale.gen && sudo grep -q '^en_US.UTF-8' /etc/locale.gen; then
  locale-gen

  if [ ! -e '/etc/locale.conf' ]; then
    printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" \
      'LANGUAGE="en_us.UTF-8"' \
      'LANG=en_US.UTF-8' \
      'LANG=is_IS.UTF-8' \
      'LC_CTYPE="is_IS.UTF-8"' \
      'LC_NUMERIC="is_IS.UTF-8"' \
      'LC_TIME="is_IS.UTF-8"' \
      'LC_COLLATE="is_IS.UTF-8"' \
      'LC_MONETARY="is_IS.UTF-8"' \
      'LC_MESSAGES="is_IS.UTF-8"' \
      'LC_PAPER="is_IS.UTF-8"' \
      'LC_NAME="is_IS.UTF-8"' \
      'LC_ADDRESS="is_IS.UTF-8"' \
      'LC_TELEPHONE="is_IS.UTF-8"' \
      'LC_MEASUREMENT="is_IS.UTF-8"' \
      'LC_IDENTIFICATION="is_IS.UTF-8"' \
      'LC_ALL="is_IS.UTF-8"' \
      >/etc/locale.conf
  else
    echo '/etc/locale.conf already exists. Overwrite cmd not run'
  fi

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
  brightnessctl \
  git \
  hyprlock \
  iptables-nft \
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
  ufw \
  waybar \
  zip

# nvim dependencies
pacman -S \
  jdk-openjdk \
  lazygit \
  npm \
  unzip

# Virtual Machine setup
pacman -S \
  dnsmasq \
  libvirt \
  qemu-full \
  virt-manager

# User apps
pacman -S \
  discord \
  fastfetch \
  feh \
  nmap \
  nwg-displays \
  qbittorrent \
  signal-desktop \
  spotify-launcher \
  steam \
  stow \
  vlc \
  wireshark-qt

# Enable file system trimming for SSD drive maintenance
systemctl enable fstrim.timer

# Change network manager from iwd to NetworkManager
systemctl disable iwd.service
systemctl stop iwd.service
systemctl enable NetworkManager.service
systemctl start NetworkManager.service

# Enable firewall on startup
systemctl enable ufw.service

# Enable virtual machine systemctl
systemctl enable libvirtd.service
systemctl enable libvirtd.socket
