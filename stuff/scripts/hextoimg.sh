#!/usr/bin/env bash

# Get the hex color code from hyprpicker
COLOR_CODE=$(hyprpicker -a)

# Remove any leading or trailing whitespace from COLOR_CODE
COLOR_CODE=$(echo "$COLOR_CODE" | xargs)

# Path to the Python script
PYTHON_SCRIPT="/home/meow/nix/stuff/scripts/hextoimg.py"

# Path to the output image
IMAGE_PATH="/home/meow/.config/dunst/icons/hyprpicker/color_image.png"

# Call the Python script with the color code
python3 "$PYTHON_SCRIPT" "$COLOR_CODE"

# Send a notification with the output image
notify-send -a "t2" -i "$IMAGE_PATH" "$COLOR_CODE"
