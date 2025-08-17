{ lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {

    programs.niri.settings.layout = {
      focus-ring = {
        active.color = col.blue;
        # inactive.color = col.blue;
        inactive.color = "#00000000";
      };
      tab-indicator = {
        active.color = col.blue;
        inactive.color = col.gray5;
      };
    };
  };
}
