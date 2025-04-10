#!/bin/bash

# Directory containing the images
IMAGE_DIR="/home/rain/.config/dunst/icons/hyprpicker"

# Create a temporary directory for symlinks
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

# Generate symlinks to image files for Rofi
for img in "$IMAGE_DIR"/*.png; do
    base_name=$(basename "$img")
    ln -s "$img" "$TMP_DIR/$base_name"
done

# Generate Rofi menu options with images
selected=$(ls "$TMP_DIR"/*.png | while read -r img; do
    base_name=$(basename "$img")
    echo "$base_name"
done | 

# Clean up the temporary directory
rm -rf "$TMP_DIR"

# Check if a valid selection was made
if [ -n "$selected" ]; then
    # Copy the selected filename (without .png) to clipboard using wl-copy
    filename=$(basename "$selected" .png)
    echo "$filename" | wl-copy
    echo "Copied $filename to clipboard"
fi
