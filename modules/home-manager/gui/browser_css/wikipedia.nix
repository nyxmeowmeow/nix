{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/github.css".text = /* css */ ''
@-moz-document domain("github.com") {





  }
  '';
}
