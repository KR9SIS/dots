#! /bin/env bash

setup_app() {
  local workspace=$1
  local class=$2
  local sleep_len=$3

  while ! (hyprctl clients | grep -q "class: $class"); do
    sleep 0.2 # simple and inefficient busy waiting loop
  done
  sleep "$sleep_len"
  hyprctl dispatch movetoworkspacesilent "$workspace", "class:$class"
}

setup_app 1 "brave-browser" 1
setup_app 2 "kitty" 1
setup_app 3 "vesktop" 5

hyprctl dispatch workspace 1

if hyprctl monitors | grep -q "(ID 1)"; then
  hyprctl dispatch moveworkspacetomonitor "2 eDP-1"
  hyprctl dispatch movecurrentworkspacetomonitor +1 # Move workspace 1 to second monitor
fi
