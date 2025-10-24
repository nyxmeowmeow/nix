{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in
{
  home.file.".config/usercontent/monkeytype.css".text = /* css */ ''
@-moz-document domain("monkeytype.com") {
root: {
  --font: ${config.stylix.fonts.monospace.name};
  --bg-color: transparent !important;
  --sub-alt-color: transparent !important;

  --untyped-letter-color: ${col.fg} !important;
  --sub-color: ${col.gray5} !important;
  --error-color: ${col.red2} !important;
  --error-extra-color: ${col.red} !important;
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
}
