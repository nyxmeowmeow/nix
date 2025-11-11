{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/gitlab.css".text = /* css */ ''
@-moz-document domain("gitlab.com") {
  * {
    font-family: ${config.stylix.fonts.monospace.name} !important; 
  }

  :root {
    --gl-background-color-default: transparent !important;
    --gl-background-color-subtle: transparent !important;
  }
}
  '';
}
