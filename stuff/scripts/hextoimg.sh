#!/usr/bin/env dash

COLOR_CODE=$(hyprpicker -a)
COLOR_CODE=$(echo "$COLOR_CODE" | xargs)
PYTHON_SCRIPT="/home/meow/nix/stuff/scripts/hextoimg.py"
IMAGE_PATH="/home/meow/.config/dunst/icons/hyprpicker/color_image.ppm"
python3 "$PYTHON_SCRIPT" "$COLOR_CODE"
notify-send -a "t2" -i "$IMAGE_PATH" "$COLOR_CODE"
