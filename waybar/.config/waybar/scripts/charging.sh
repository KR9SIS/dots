#!/bin/env bash

if grep -q -e "${1}" -e "${2}" <(makoctl list); then
  makoctl dismiss
fi

notify-send '⚡ AC Connected!' 'Charging ' -u normal -t 2500
