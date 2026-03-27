#! /bin/env bash

setup_app() {
  local workspace=$1
  local class=$2
  local title=$3

  while ! (
    hyprctl clients -j | jq -r --arg c "$class" --arg t "$title" '
      .[]|select(.class==$c)|.title==$t '
  ); do       # checking floating for vesktop
    sleep 0.2 # simple and semi inefficient busy waiting loop
  done

  sleep 1
  hyprctl dispatch movetoworkspacesilent "$workspace", "class:$class"
}

setup_app 1 "brave-browser" "New tab - Brave"
setup_app 2 "kitty" "~"
setup_app 3 "vesktop" "Discord | Friends"

hyprctl dispatch workspace 1

if hyprctl monitors | grep -q "(ID 1)"; then
  hyprctl dispatch moveworkspacetomonitor "2 0" # Move workspace 2 aka kitty to monitor 0 aka built in
  hyprctl dispatch moveworkspacetomonitor "1 1" # Move workspace 1 aka brave-browser to monitor 1 aka second monitor
fi
