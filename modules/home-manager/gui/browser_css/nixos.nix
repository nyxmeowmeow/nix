{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/nixos.css".text = /* css */ ''
@-moz-document domain("wiki.nixos.org") {
* {
  font-family: ${config.stylix.fonts.monospace.name} !important;
}

root: {
	--font-size-medium: 20px !important;
}

body {
  background: transparent !important;
  background-color: transparent !important;
}

@media screen {
  body {
    --background-color: transparent !important;
    --color: ${col.fg} !important;
  }
}




}
  '';
}
