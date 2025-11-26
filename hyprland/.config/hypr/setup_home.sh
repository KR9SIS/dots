#! /bin/env bash

while ! \
  (hyprctl clients | grep -q "initialClass: brave-browser") && \
  (hyprctl clients | grep -q "initialClass: vesktop"); do
  sleep 0.2
done

sleep 5

hyprctl dispatch workspace 1

if hyprctl monitors | grep "description: ASR PG34WQ15R2B"; then
  hyprctl dispatch moveworkspacetomonitor "2 eDP-1"
  hyprctl dispatch movecurrentworkspacetomonitor +1 # Move workspace 1 to second monitor
fi
