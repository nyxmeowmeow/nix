{ config, lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "macchiato") {

    services.dunst.settings.urgency_normal = {
      background = col.base;
      foreground = col.text;
      frame_color = col.lavender;
    };
  };
}
