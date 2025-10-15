#!/usr/bin/env bash

attempt=1
delay=5

while [ true ]
do
    ~/.config/kanata/hyprkan -d 
    if [ $? -eq 0 ]; then
        echo "hyprkan started successfully"
        break
    fi
    echo "Download failed. Retrying in $delay seconds..."
    attempt=$((attempt + 1))
    sleep $delay
done
