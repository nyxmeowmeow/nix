{
  config,
  lib,
  theme,
  ...
}:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/sourcehut.css".text = /* css */ ''
@-moz-document domain("sr.ht") {

body {
  font-family: ${config.stylix.fonts.monospace.name} !important;
  font-size: 20px !important;
}

@media (prefers-color-scheme: dark) {
  body {
    background: transparent !important;
    color: ${col.fg} !important;
  }
  a {
    color: ${col.blue} !important;
  }
}
}
'';
}
