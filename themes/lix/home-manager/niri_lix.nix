{ lib, theme, ... }:
let
col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "lix") {
    programs.niri.settings.layout = {
      background-color = "transparent";
      focus-ring = {
        active.color = col.pink;
        # active.gradient = {
        #   angle = 45;
        #   # relative-to = "workspace-view";
        #   from = col.pink;
        #   to = col.;
        # };
        inactive.color = "#00000000";
      };
      tab-indicator = {
        active.color = col.pink;
        inactive.color = col.bg_fade;
      };
    };
  };
}
