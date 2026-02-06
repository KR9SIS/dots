#!/bin/env bash

for i in $(seq 1 30); do
  printf "%s.jsonc\n\n" "${i}"
  fastfetch --config examples/"${i}".jsonc
  printf "\n\n-------------------------------------------------------------------\n\n"
done
