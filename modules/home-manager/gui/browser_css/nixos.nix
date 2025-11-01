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
  --bg-color: transparent !important;
  --background-color-base: transparent !important;
}

body {
  background: transparent !important;
  background-color: transparent !important;
}

@media screen {
  html {
    color-scheme: dark;
       --background-color-base: transparent !important;
    --color-base: ${col.fg} !important;
    --color-base--hover:${col.fg} !important;
    --color-emphasized:${col.fg} !important;
    --color-inverted: transparent !important;
    }
    }




  }
  '';
}
