#!/bin/env bash

bVersion="bash $(echo "$BASH_VERSION" | grep -Eo '^[0-9]+\.[0-9]+\.[0-9]+')"
kVersion=$(kitty --version | grep -Eo '^[a-z]+ [0-9]+\.[0-9]+\.[0-9]+')

echo "$kVersion / $bVersion"
