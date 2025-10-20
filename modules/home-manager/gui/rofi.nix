{ theme, ... }:
let
  accent = if (theme == "kanso_zen" || theme == "kanso_ink" || theme == "kanso_mist" || theme == "kantsi") then "#7FB4CA" else if 
  (theme == "macchiato" || theme == "blacchiato") then "#b7bdf8" else if
  (theme == "lix") then "#DBBFEF" else if
  (theme == "everforest_hard" || theme == "everforest_medium" || theme == "everforest_soft") then "#9DA9A0"
  else "#ff0000";
in
{
  home.file.".config/rofi/bgselector.rasi".text = /* rasi */ ''
configuration {
    show-icons: true;
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
    background-color: rgba(0,0,0,0.5);
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
    border-radius: 10px;
}
element.selected {
    border: 3px;
    border-color: ${accent};
}
element-icon {
    size: 229px 720px;
    horizontal-align: 0;
}
  '';
}
