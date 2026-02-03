#!/bin/env bash

mako_list=$(makoctl list)

# Arguments 1 and 2 or defaults
arg1="${1:-⚡ Time to recharge!}"
arg2="${2:-⚡ RECHARGE NOW!}"

if grep -q -e "$arg1" -e "${arg2}" <<<"$mako_list"; then
  id=$(echo "$mako_list" | grep -oP 'Notification \K\d+')
  makoctl dismiss "$id"
fi

notify-send '⚡ AC Connected!' 'Charging ' -u normal -t 2500
