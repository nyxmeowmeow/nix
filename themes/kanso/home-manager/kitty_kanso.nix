{ lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kanso_zen") {
  home.file.".config/kitty/theme.conf".text = /* toml */ ''
# vim:ft=kitty

# The basic colors
foreground              ${col.fg}
background              ${col.bg}
selection_foreground    ${col.bg}
selection_background    ${col.blue}

# Cursor colors
cursor                  ${col.fg}
cursor_text_color       ${col.bg}

# URL underline color when hovering with mouse
url_color               ${col.blue_sat}

# Kitty window border colors
active_border_color     #000000
inactive_border_color   #000000
bell_border_color       #000000

# OS Window titlebar colors
wayland_titlebar_color system
macos_titlebar_color system

# Tab bar colors
active_tab_foreground   #181926
active_tab_background   #C6A0F6
inactive_tab_foreground #CAD3F5
inactive_tab_background #1E2030
tab_bar_background      #181926

# Colors for marks (marked text in the terminal)
mark1_foreground ${col.bg}
mark1_background ${col.blue}
mark2_foreground ${col.bg}
mark2_background ${col.purple}
mark3_foreground ${col.bg}
mark3_background ${col.yellow}

# The 16 terminal colors

# black
color0 ${col.bg}
color8 ${col.bg}

# red
color1 ${col.red}
color9 ${col.red}

# green
color2  ${col.green}
color10 ${col.green}

# yellow
color3  ${col.yellow}
color11 ${col.yellow}

# blue
color4  ${col.blue}
color12 ${col.blue}

# magenta
color5  ${col.violet}
color13 ${col.violet}

# cyan
color6  ${col.blue4}
color14 ${col.blue4}

# white
color7  ${col.fg2}
color15 ${col.fg2}
'';
  };
}
