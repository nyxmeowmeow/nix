{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/monkeytype.css".text = /* css */ ''
@-moz-document domain("monkeytype.com") {
element {
  --font: ${config.stylix.fonts.monospace.name} !important;
  --bg-color: transparent !important;
  --sub-alt-color: transparent !important;

  --correct-letter-color: ${col.gray} !important;
  --untyped-letter-color: ${col.fg} !important;
  --sub-color: ${col.gray} !important;
  --sub-alt-color: ${col.gray}aa !important;
  --error-color: ${col.red} !important;
  --error-extra-color: ${col.red} !important;
}

body {
  background: transparent !important;
  font-family: ${config.stylix.fonts.monospace.name} !important;

}


#restartTestButton {
  /*font-size: 0rem;*/
  opacity: 0 !important;
}
#contactPopupButton {
  display: none !important;
}
#supportMeButton {
  display: none !important;
}



footer .leftright .left .textButton, footer .leftright .right .textButton[aria-label="discord"] {
  display: none !important;
}

footer .leftright .left .textButton, footer .leftright .right .textButton {
  display: none !important;
}

footer .leftright {
  display: none !important;
}



#testConfig .puncAndNum {
  display: none !important;
}

header #logo {
  display: none !important;
}



}
'';
}
