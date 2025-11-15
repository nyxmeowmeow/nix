#!/usr/bin/env bash

themeline="$(cat ~/nix/mod/os/config.nix | grep 'theme = ')"

for name in {kanso,kantsi,macchiato,blacchiato,lix,everforest}; do
  if [[ $themeline == *"$name"* ]]; then 
    wallname=$(cat ~/nix/theme/wallpaper.json | jq ".$name")
    wallnamestripped=$(echo "$wallname" | tr -d '"') 
  fi
done


if mode=$(swww query | grep "000000") ; then
  swww img ~/nix/stuff/wallpapers/$wallnamestripped -t grow --transition-duration 1 --transition-fps 165
else
  swww clear
fi


