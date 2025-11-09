{
  config,
  lib,
  theme,
  ...
}:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (lib.hasPrefix "kanso" theme) {

    services.dunst.settings.urgency_normal = {
      background = col.zen_bg0;
      foreground = col.fg;
      frame_color = col.blue;
    };
  };
}
