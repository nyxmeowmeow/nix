{ lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {

    programs.niri.settings.layout = {
    background-color = "#000000";
      focus-ring = {
        # active.color = col.blue;
        active.gradient = {
          angle = 45;
          # relative-to = "workspace-view";
          from = col.blue;
          to = col.violet_sat;
        };
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
