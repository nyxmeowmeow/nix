#!/usr/bin/env bash
themeline="$(cat ~/nix/modules/nixos/options.nix | grep 'config.theme = ')"

for name in {kanso,kantsi,macchiato,blacchiato,lix,everforest}; do
    if [[ $themeline == *"$name"* ]]; then 
        wallname=$(cat ~/nix/themes/wallpaper.json | jq ".$name")
        wallnamestripped=$(echo "$wallname" | tr -d '"') 
        swww img -t none ~/nix/stuff/wallpapers/$wallnamestripped
    fi
done
