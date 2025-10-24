{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/wikipedia.css".text = /* css */ ''
@-moz-document domain("wikipedia.org") {
root: {
  --font: ${config.stylix.fonts.monospace.name};
  --bg-color: transparent !important;
  --background-color-base: transparent !important;
}

body {
  background: transparent !important;
  background-color: transparent !important;
  font-family: ${config.stylix.fonts.monospace.name};

}

@media screen {
  html.skin-theme-clientpref-night {
    color-scheme: dark;
    --background-color-base: transparent !important;
    --color-base: ${col.fg};
    --color-base--hover: ${col.fg};
    --color-emphasized: ${col.fg};
    --color-inverted: transparent !important;
  }
}




}
'';
}
