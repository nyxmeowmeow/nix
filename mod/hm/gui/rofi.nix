{
  theme,
  lib,
  rounding,
  ...
}:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../theme/${theme_trimmed}/colors.nix;
  radius = if rounding then "10px" else "0px";
in
{
  home.file.".config/rofi/bgselector.rasi".text = /* rasi */ ''
configuration {
    show-icons: true;
    kb-row-left: "h";
    kb-row-right: "i";
    kb-row-down: "a";
    kb-row-up: "e";
}

@theme "bgselector2.rasi"
  '';



  home.file.".config/rofi/bgselector2.rasi".text = /* rasi */ ''
// Global
* {
    background-color: transparent;
}

// Window
window {
    background-color: ${col.bgtrans};
    fullscreen: true;    
}

// Main Box
mainbox {
    children: [listview];
    padding: 25% 0%;
}

// Listview
listview {
    padding: 0px 10px;
    spacing: 10px;
    columns: 7;
    flow: horizontal;
    children: [element-icon];
}
element {
    border-radius: ${radius};
}
element.selected {
    border: 3px;
    border-color: ${col.accent};
}
element-icon {
    size: 229px 720px;
    horizontal-align: 0;
}
  '';
}
