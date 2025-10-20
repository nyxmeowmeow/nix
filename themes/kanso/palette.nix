{ lib, config, ... }:
let
  p = config.palette;
in {
  config = lib.mkIf (config.theme == "kanso_mist" || config.theme == "kanso_ink" || config.theme == "kanso_zen") {

    # p.accent = "#7FB4CA";
    # p.bg = "#090E13";
    # p.fg = "#f2f1ef";
    config.palette.accent = "#7FB4CA";
    config.palette.bg = "#090E13";
    config.palette.fg = "#f2f1ef";
  };
}
