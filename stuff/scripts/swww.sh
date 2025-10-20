#!/usr/bin/env bash

themeline="cat ~/nix/modules/nixos/options.nix | grep 'config.theme = '"

if [[ $themeline == *"kanso"* ]]; then
  wallname="$(cat ~/nix/themes/wallpaper.json | jq '.kanso')"
  wallnamestripped=$(echo "$wallname" | tr -d '"')
  swww img -t none ~/nix/stuff/wallpapers/$wallnamestripped
fi
