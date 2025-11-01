{
  config,
  lib,
  theme,
  flake_dir,
  ...
}:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../themes/${theme_trimmed}/colors.nix;
in
{

  programs.ghostty = {
    enable = true;
    settings = {
      font-family = config.stylix.fonts.monospace.name;
      font-size = 22;
      gtk-single-instance = true;

      window-padding-x = 6;
      window-padding-y = 0;
      window-padding-balance = true;

      adjust-cursor-thickness = 2;
      confirm-close-surface = false;

      foreground = lib.mkDefault col.fg;
      background = lib.mkDefault col.bg;
      background-opacity = lib.mkDefault 0.8;
      cursor-color = lib.mkDefault col.fg;
      cursor-text = lib.mkDefault col.bg;
      selection-background = lib.mkDefault col.blue;
      selection-foreground = lib.mkDefault col.bg;

      palette = lib.mkDefault [
        "0=${col.black}"
        "1=${col.red}"
        "2=${col.green}"
        "3=${col.yellow}"
        "4=${col.blue}"
        "5=${col.violet}"
        "6=${col.aqua}"
        "7=${col.white}"
        "8=${col.black}"
        "9=${col.red}"
        "10=${col.green}"
        "11=${col.yellow}"
        "12=${col.blue}"
        "13=${col.violet}"
        "14=${col.aqua}"
        "15=${col.white}"
      ];



      # custom-shader = ../../../stuff/cursor_smear_fade.glsl;

      # cursor smear
          custom-shader = "${flake_dir}/stuff/cursor_smear.glsl";

    };
  };
}
