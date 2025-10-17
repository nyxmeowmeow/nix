{ lib, wm, ... }: {
  config = lib.mkIf (wm == "niri") {
    programs.niri.settings = {
      input = {
        focus-follows-mouse.enable = true;
        mouse = {
          accel-profile = "flat";
        };
# FIXME no worky
# tablet = {
#   enable = true;
#   map-to-output = "DP-1";
# };
        keyboard = {
          repeat-delay = 300;
          repeat-rate = 25;
        };
      };
      cursor.hide-after-inactive-ms = 666;
    };
  };
}
