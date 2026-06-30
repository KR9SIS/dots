#!/bin/env bash

mako_list=$(makoctl list)

# Arguments 1, 2 and 3 or defaults
warn_notif="${1:-⚡ Time to recharge!}"
crit_notif="${2:-⚡ RECHARGE NOW!}"
tmp_file="/tmp/${3:-pcPluggedIn}"

if grep -q -e "$warn_notif" -e "${crit_notif}" <<<"$mako_list"; then
  id=$(echo "$mako_list" | grep -oP 'Notification \K\d+')
  makoctl dismiss "$id"
fi

if [[ ! -f "$tmp_file" ]]; then
  touch "$tmp_file"
  notify-send '⚡ AC Connected!' 'Charging ' -u normal -t 2500
fi
