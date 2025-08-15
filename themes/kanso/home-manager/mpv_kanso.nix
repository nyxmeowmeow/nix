{ lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {
    programs.mpv.config = {
      background-color = col.zen_bg0;
      osd-back-color = col.zen_bg0;
      osd-border-color = col.zen_bg0;
      osd-color = col.fg;
      osd-shadow-color = col.zen_bg0;
    };
  };
}
