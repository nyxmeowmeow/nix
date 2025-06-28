import sys
import os
import subprocess

def hex_to_rgb(hex_code):
    hex_code = hex_code.lstrip('#')
    return tuple(int(hex_code[i:i+2], 16) for i in (0, 2, 4))

def create_ppm_from_hex(hex_code, width, height, output_file):
    rgb = hex_to_rgb(hex_code)
    try:
        os.makedirs(os.path.dirname(output_file), exist_ok=True)
        with open(output_file, 'wb') as f:
            f.write(f'P6\n{width} {height}\n255\n'.encode())
            f.write(bytes(rgb) * width * height)
        print(f"PPM image saved as {output_file}")
    except Exception as e:
        print(f"Error: {e}")

def copy_to_clipboard(hex_code):
    try:
        subprocess.run(['wl-copy'], input=hex_code.encode(), check=True)
        print(f"Hex code {hex_code} copied to clipboard.")
    except subprocess.CalledProcessError as e:
        print(f"Error copying to clipboard: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 hextoimg.py <hex_color_code>")
        sys.exit(1)

    hex_code = sys.argv[1]
    width = 100
    height = 100
    output_file = '/home/meow/.config/dunst/icons/hyprpicker/color_image.ppm'

    create_ppm_from_hex(hex_code, width, height, output_file)
    copy_to_clipboard(hex_code)
