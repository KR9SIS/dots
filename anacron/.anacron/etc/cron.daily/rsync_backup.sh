#!/bin/bash

SECONDS=0

LOGFILE=$(date '+/home/kr9sis/.anacron/etc/cron.daily/logs/%m_%Y.log')

(
  printf '=%.0s' {1..70}
  printf '\n'
) >>"$LOGFILE"

printf "Start time: %s\n" "$(date '+%F %H:%M')" >>"$LOGFILE"

if ! RSYNCOUT=$(rsync -a --stats --delete --exclude=node_modules -e "ssh -i /home/kr9sis/.ssh/id_ed25519_server" ~/drive/ server@192.168.1.9:/home/server/drive/); then
  printf "Exit Code: %d\nOutput: %s\n" $? "$RSYNCOUT" >>"$LOGFILE"
fi

DURATION=$SECONDS
(
  printf "Duration: %s min %s sec\n" "$((DURATION / 60))" "$((DURATION % 60))"
  printf '=%.0s' {1..70}
  printf '\n\n'
) >>"$LOGFILE"
