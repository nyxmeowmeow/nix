{ config, lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {
''
@-moz-document domain("monkeytype.com") {
root: {
  --font: ${config.stylix.fonts.monospace.name};
  --untyped-letter-color: ${col.fg} !important;
  --sub-color: ${col.gray5} !important;
  --error-color: ${col.red2} !important;
  --error-extra-color: ${col.red} !important;
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
''
};
}
