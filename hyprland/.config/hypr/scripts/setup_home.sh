#!/bin/env bash

setup_app() {
  local workspace=$1
  local monitor=$2
  local class=$3
  local title=$4

  s_len=1

  while ! window=$(hyprctl clients -j | jq -r --arg c "$class" --arg t "$title" \
    '.[]|select(.class==$c and (.title | test($t; "i")))|.address' | head -1) || [[ -z "$window" ]]; do
    sleep "$s_len"
    s_len=$((s_len * 2))
  done

  hyprctl dispatch movetoworkspacesilent "$workspace", "address:$window"

  if hyprctl monitors | grep -q "(ID 1)"; then
    hyprctl dispatch moveworkspacetomonitor "$workspace" "$monitor"
  fi
}

setup_app 1 1 "brave-browser" "New tab - Brave"
hyprctl dispatch workspace 2
setup_app 2 0 "kitty" "~"
hyprctl dispatch workspace 1
setup_app 3 0 "vesktop" "Discord | Friends"

hyprctl dispatch workspace 1
