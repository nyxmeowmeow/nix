{ lib, config, ... }:
with lib;
{
  options.blackbg.enable = mkEnableOption "Use black background";

  config = let
    base00col = if config.blackbg.enable then "#000000" else "#24273a";
  in {
    theme = {
      base00 = base00col;
      base01 = "#cad3f5"; # text
      base02 = "#181926"; # crust
      base03 = "#1e2030"; # mantle
      base04 = "#363a4f"; # surface0
      base05 = "#494d64"; # surface1
      base06 = "#6e738d"; # overlay
      base07 = "#a5adcb"; # subtext
      base08 = "#b7bdf8"; # lavender
      base09 = "#8aadf4"; # blue
      base0A = "#c6a0f6"; # mauve
      base0B = "#f5bde6"; # pink
      base0C = "#ed8796"; # red
      base0D = "#f5a97f"; # peach
      base0E = "#eed49f"; # yellow
      base0F = "#a6da95"; # green
    };
  };
}

