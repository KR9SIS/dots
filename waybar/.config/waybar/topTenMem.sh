#!/usr/bin/env bash
# set -euo pipefail

declare -A process_memory

# 1) Accumulate RSS per command (KB)
while read -r rss comm; do
  : "${process_memory["$comm"]:=0}" # set to 0 if unset
  ((process_memory["$comm"] += rss))
done < <(ps -eo rss=,comm=)

# 2) Emit "KB<TAB>proc" into an array
mapfile -t emitted < <(
  for proc in "${!process_memory[@]}"; do
    printf "%d\t%s\n" "${process_memory[$proc]}" "$proc"
  done
)

# 3) Sort and keep top 10 into an array
mapfile -t top10 < <(
  printf '%s\n' "${emitted[@]}" | sort -nr -k1,1 | head -n 10
)

# 4) Format and print
for line in "${top10[@]}"; do
  IFS=$'\t' read -r kb proc <<<"$line"
  if ((kb >= 1024 * 1024)); then
    # GiB with 2 decimals (float via awk)
    awk -v kb="$kb" -v proc="$proc" 'BEGIN{printf "%5.2f GiB %-20s\n", kb/1048576, proc}'
  else
    # MiB as integer
    printf "%5d MiB %-20s\n" "$((kb / 1024))" "$proc"
  fi
done
