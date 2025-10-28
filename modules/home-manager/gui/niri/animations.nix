{ lib, wm, ... }: {
  config = lib.mkIf (wm == "niri") {
    programs.niri.settings.animations = {
      enable = false;
      workspace-switch = {
        enable = false;
# kind = "easing";
# easing = {
#   curve = "linear";
#   duration-ms = 150;
# };
      };
    };
  };
}
