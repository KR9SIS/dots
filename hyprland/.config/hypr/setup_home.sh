#! /bin/bash

while ! (hyprctl clients | grep "initialClass: brave-browser") && (hyprctl clients | grep "initialClass: kitty") && (hyprctl clients | grep "initialClass: discord") && (hyprctl clients | grep "initialClass: Spotify"); do
  sleep 0.2
done

sleep 5

if hyprctl monitors | grep "description: ASR PG34WQ15R2B"; then
  hyprctl dispatch moveworkspacetomonitor "2 eDP-1"
  hyprctl dispatch moveworkspacetomonitor "1 DP-1"
fi

hyprctl dispatch workspace 1
