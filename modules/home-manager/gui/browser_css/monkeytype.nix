{ config, lib, theme, ... }:
let
  col_kanso = import ../../../../themes/kanso/colors.nix;
in
{
  home.file.".config/usercontent/monkeytype.css".text = /* css */ ''
@-moz-document domain("monkeytype.com") {
root: {
  --font: ${config.stylix.fonts.monospace.name};
  --bg-color: transparent !important;
  --sub-alt-color: transparent !important;
}

body {
    background: transparent !important;
}


#restartTestButton {
    /*font-size: 0rem;*/
    opacity: 0;
}
#contactPopupButton {
    display: none;
}
#supportMeButton {
    display: none;
}



footer .leftright .left .textButton, footer .leftright .right .textButton[aria-label="discord"] {
    display: none;
}

footer .leftright .left .textButton, footer .leftright .right .textButton {
    display: none;
}

#testConfig .puncAndNum {
    display: none;
}

header #logo {
  display: none;
}



}
'';
# ++ lib.mkIf (theme == "kanso_zen" || theme == "kanso_ink" || theme == "kanso_mist" || theme == "kantsi") ''
#   --untyped-letter-color: ${col_kanso.fg} !important;
#   --sub-color: ${col_kanso.gray5} !important;
#   --error-color: ${col_kanso.red2} !important;
#   --error-extra-color: ${col_kanso.red} !important;
#   ''
#   ;
}
