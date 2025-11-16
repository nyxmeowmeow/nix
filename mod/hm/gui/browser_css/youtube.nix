{
  config,
  lib,
  theme,
  ...
}:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../theme/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/youtube.css".text = /* css */ ''
@-moz-document domain("youtube.com") {
#center.ytd-masthead {
  display: none !important;
}
'';
}
