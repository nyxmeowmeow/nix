{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/codeberg.css".text = /* css */ ''
@-moz-document domain("codeberg.org") {
* { font-family: ${config.stylix.fonts.monospace.name} !important; }
'';
}
