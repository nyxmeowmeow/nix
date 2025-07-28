{ lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {

    programs.niri.settings.layout = {
      focus-ring = {
        enable = true;
        width = 2;
        active.color = col.blue;
      };
      tab-indicator = {
        enable = true;
        active.color = col.blue;
        inactive.color = col.gray5;
        hide-when-single-tab = false;
      };
    };
  };
}
