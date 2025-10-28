{ lib, wm, ... }: {
  config = lib.mkIf (wm == "niri") {
    programs.niri.settings.animations = {
      enable = true;
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
