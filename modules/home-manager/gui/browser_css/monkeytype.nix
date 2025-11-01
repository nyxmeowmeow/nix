{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/monkeytype.css".text = /* css */ ''
@-moz-document domain("monkeytype.com") {
html {
  --font: ${config.stylix.fonts.monospace.name} !important;
  --bg-color: transparent !important;
  --sub-alt-color: transparent !important;

  --correct-letter-color: ${col.gray} !important;
  --untyped-letter-color: ${col.fg} !important;
  --sub-color: ${col.gray} !important;
  --sub-alt-color: transparent !important;
  --error-color: ${col.red} !important;
  --error-extra-color: ${col.red} !important;
}

body {
  background: transparent !important;
  font-family: ${config.stylix.fonts.monospace.name} !important;
}


#restartTestButton {
  opacity: 0 !important; /* needs to still exist */
}



.levelAndBar, /* level num on profile */
#testConfig .puncAndNum, /* left side of top middle */
header #logo, /* monkeytype logo */
/* stuff at the bottom */
#contactPopupButton, supportMeButton,
footer .leftright .left .textButton, footer .leftright .right .textButton[aria-label="discord"],
footer .leftright .left .textButton, footer .leftright .right .textButton {
  display: none !important;
}



}
'';
}
