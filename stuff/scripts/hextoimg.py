from PIL import Image
import sys
import os
import subprocess

def hex_to_rgb(hex_code):
    """Convert a hex color code to an RGB tuple."""
    hex_code = hex_code.lstrip('#')
    return tuple(int(hex_code[i:i+2], 16) for i in (0, 2, 4))

def create_image_from_hex(hex_code, width, height, output_file):
    """Create an image with a single color from a hex code."""
    try:
        # Convert hex code to RGB
        rgb_color = hex_to_rgb(hex_code)
        
        # Create a new image with RGB mode
        image = Image.new('RGB', (width, height), rgb_color)
        
        # Create directories if they do not exist
        os.makedirs(os.path.dirname(output_file), exist_ok=True)
        
        # Save the image
        image.save(output_file)
        print(f"Image saved as {output_file}")
    except Exception as e:
        print(f"Error: {e}")

def copy_to_clipboard(hex_code):
    """Copy the hex code to the clipboard using wl-copy."""
    try:
        # Use subprocess to execute wl-copy
        subprocess.run(['wl-copy'], input=hex_code.encode(), check=True)
        print(f"Hex code {hex_code} copied to clipboard.")
    except subprocess.CalledProcessError as e:
        print(f"Error copying to clipboard: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 hextoimg.py <hex_color_code>")
        sys.exit(1)

    hex_code = sys.argv[1]
    width = 100  # Width of the image
    height = 100  # Height of the image
    output_file = '/home/rain/.config/dunst/icons/hyprpicker/color_image.png'  # Output image file path

    # Create the image
    create_image_from_hex(hex_code, width, height, output_file)
    
    # Copy the hex code to clipboard
    copy_to_clipboard(hex_code)
