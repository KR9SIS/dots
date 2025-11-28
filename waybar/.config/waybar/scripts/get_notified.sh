#!/bin/env bash

0 > /tmp/notify_count.txt

dbus-monitor "interface='org.freedesktop.Notifications',member='Notify'" | \
while read -r line; do
  if echo "$line" | grep -q "member=Notify"; then
      string_count=0
      strings=()
  fi

  if [[ "$line" =~ ^[[:space:]]*string[[:space:]]+\"(.*)\" ]]; then
      string_value="${BASH_REMATCH[1]}"
      strings[$string_count]="$string_value"
      ((string_count++))
  fi

  if [[ "$line" =~ ^[[:space:]]*array[[:space:]]*\[ ]] && [ $string_count -ge 4 ]; then
      app_name="${strings[0]}"
      icon="${strings[1]}"
      summary="${strings[2]}"
      body="${strings[3]}"

      printf "app_name: $app_name\n"
      printf "summary: $summary\n"
      printf "body: $body\n"

      if [[ "$app_name" == "Discord" || "$app_name" == "signal" ]]; then
        num=("$cat /tmp/notify_count.txt") 
        num=("$num"+1)
        echo "$num" >> /tmp/notify_count.txt
        pkill -RTMIN+9 waybar
      fi

      # TODO: This is where you should handle notification handling logic.
      # Get the app name, grab the respective nerdfont icon, etc.

      string_count=0
      strings=()
  fi
done
