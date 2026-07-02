#!/usr/bin/env bash

aVersion=$(alacritty --version | grep -Eo '^[a-z]+ [0-9]+\.[0-9]+\.[0-9]+')
bVersion="bash $(echo "$BASH_VERSION" | grep -Eo '^[0-9]+\.[0-9]+\.[0-9]+')"

echo "$aVersion / $bVersion"
