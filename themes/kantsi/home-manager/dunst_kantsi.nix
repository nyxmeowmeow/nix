{ config, lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kantsi") {

    services.dunst.settings.urgency_normal = {
      background = col.bg;
      foreground = col.fg;
      frame_color = col.blue;
    };
  };
}
