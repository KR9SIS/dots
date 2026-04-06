#!/bin/env bash

timeout 10 bash -c '
  while ! hostname -i | grep -q -E "192\.168\.[0-9]{1,3}\.[0-9]{1,3}"; do
    sleep 1
  done
'

connection=$(iwctl station wlan0 show)
ssid=$(echo "$connection" | grep 'Connected network' | awk '{print $3}')
security=$(echo "$connection" | grep 'Security' | awk '{print $2}')
rssi=$(echo "$connection" | grep ' RSSI' | awk '{print $2}')

sigStrength=$((2 * (rssi + 100)))

printf "%s (%s%%) %s" "$ssid" "$sigStrength" "$security"

# echo "$connection"
# echo "$ssid"
# echo "rssi:   $rssi"
# echo "signal: ($sigStrength)"
# echo "sec:    $security"

# ip=$(echo "$connection" | awk -F': ' '/IPv4 address/ {print $2}')
