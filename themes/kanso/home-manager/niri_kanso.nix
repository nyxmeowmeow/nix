{ lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (lib.hasPrefix "kan" theme) {

    programs.niri.settings.layout = {



    # background-color = "#000000";
    background-color = "transparent";
      focus-ring = {
        active.color = col.blue;
        # active.gradient = {
        #   angle = 45;
        #   # relative-to = "workspace-view";
        #   from = col.blue;
        #   to = col.violet_sat;
        # };
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
