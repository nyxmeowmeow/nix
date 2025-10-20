#!/usr/bin/env bash

themeline="$(cat ~/nix/modules/nixos/options.nix | grep 'config.theme = ')"

if [[ $themeline == *"kanso"* ]]; then
  wallname="$(cat ~/nix/themes/wallpaper.json | jq '.kanso')"
  wallnamestripped=$(echo "$wallname" | tr -d '"')
  swww img -t none ~/nix/stuff/wallpapers/$wallnamestripped
fi
if [[ $themeline == *"kantsi"* ]]; then
  wallname="$(cat ~/nix/themes/wallpaper.json | jq '.kantsi')"
  wallnamestripped=$(echo "$wallname" | tr -d '"')
  swww img -t none ~/nix/stuff/wallpapers/$wallnamestripped
fi
if [[ $themeline == *"lix"* ]]; then
  wallname="$(cat ~/nix/themes/wallpaper.json | jq '.lix')"
  wallnamestripped=$(echo "$wallname" | tr -d '"')
  swww img -t none ~/nix/stuff/wallpapers/$wallnamestripped
fi
if [[ $themeline == *"macchiato"* ]]; then
  wallname="$(cat ~/nix/themes/wallpaper.json | jq '.macchiato')"
  wallnamestripped=$(echo "$wallname" | tr -d '"')
  swww img -t none ~/nix/stuff/wallpapers/$wallnamestripped
fi
if [[ $themeline == *"blacchiato"* ]]; then
  wallname="$(cat ~/nix/themes/wallpaper.json | jq '.blacchiato')"
  wallnamestripped=$(echo "$wallname" | tr -d '"')
  swww img -t none ~/nix/stuff/wallpapers/$wallnamestripped
fi
if [[ $themeline == *"everforest"* ]]; then
  wallname="$(cat ~/nix/themes/wallpaper.json | jq '.everforest')"
  wallnamestripped=$(echo "$wallname" | tr -d '"')
  swww img -t none ~/nix/stuff/wallpapers/$wallnamestripped
fi
