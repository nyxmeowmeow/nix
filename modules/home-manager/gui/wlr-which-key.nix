{
  config,
  flake_dir,
  ...
}:
let
  # quit = if (config.wm == "niri") then "niri msg action quit"
  # else if (config.wm == "hyprland") then "hyprctl dispatch exit"
  #   else "error";
  # TODO: float, screenshot, kill window, center
in
{
  home.file.".config/wlr-which-key/config.yaml".text = /* yaml */ ''
font: none
background: "#00000000"
color: "#cad3f500"
border: "#b7bdf800"

# Permits key bindings that conflict with compositor key bindings.
# Default is `false`.
inhibit_compositor_keyboard_shortcuts: true

menu:
  - key: [ "q", "Mod4+q" ]
    desc: float active
    cmd: niri msg action quit

  - key: [ "s", "Mod4+s" ]
    desc: float active
    cmd: niri msg action screenshot -p false

  - key: [ "o", "Mod4+o" ]
    desc: kill window
    cmd: niri msg --json pick-window | jq '.pid' | xargs kill

  # - key: [ "p", "Mod4+p" ]
  #   desc: float active
  #   cmd: hex=$(niri msg pick-color | grep -o '#.*') && echo -n "$hex" | wl-copy && notify-send "$hex"

  - key: [ "p", "Mod4+p" ]
    desc: pick colour
    cmd: ~/nix/stuff/scripts/hextoimg.sh

  - key: [ "k", "Mod4+k" ]
    desc: float active
    cmd: systemctl restart kanata-lily-58

  - key: [ "f", "Mod4+f" ]
    desc: float active
    cmd: niri msg action toggle-window-floating

  - key: [ "c", "Mod4+c" ]
    desc: center column
    cmd: niri msg action center-column

  - key: [ "x", "Mod4+x" ]
    desc: expand column
    cmd: ${flake_dir}/stuff/scripts/clear.sh

  - key: [ "m", "Mod4+m" ]
    desc: maximise column
    cmd: niri msg action maximize-column

  - key: [ "h", "Mod4+h" ]
    desc: first col
    cmd: niri msg action move-column-left

  - key: [ "i", "Mod4+i" ]
    desc: first col
    cmd: niri msg action move-column-right

  - key: [ "a", "Mod4+a" ]
    desc: first col
    cmd: niri msg action focus-column-first

  - key: [ "e", "Mod4+e" ]
    desc: last col
    cmd: niri msg action focus-column-last

  - key: [ "t", "Mod4+t" ]
    desc: last col
    cmd: niri msg action toggle-column-tabbed-display

  - key: [ "z", "Mod4+z" ]
    desc: eep
    cmd: ${flake_dir}/stuff/scripts/eep.sh

  - key: [ "enter", "Mod4+enter" ]
    desc: float active
    cmd: ${flake_dir}/stuff/scripts/projectopen.nu

  '';
}
