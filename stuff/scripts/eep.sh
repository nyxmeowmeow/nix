#!/usr/bin/env bash

themeline="$(cat ~/nix/modules/nixos/config.nix | grep 'config.theme = ')"

for name in {kanso,kantsi,macchiato,blacchiato,lix,everforest}; do
  if [[ $themeline == *"$name"* ]]; then 
    wallname=$(cat ~/nix/themes/wallpaper.json | jq ".$name")
    wallnamestripped=$(echo "$wallname" | tr -d '"') 
  fi
done


if mode=$(swww query | grep "000000") ; then
  swww img ~/nix/stuff/wallpapers/$wallnamestripped -t grow --transition-duration 1 --transition-fps 165
else
  swww clear
fi


