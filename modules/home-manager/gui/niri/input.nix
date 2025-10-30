{
  lib,
  wm,
  ...
}:
{
  config = lib.mkIf (wm == "niri") {
    programs.niri.settings = {
      input = {
        # warp-mouse-to-focus
        workspace-auto-back-and-forth = true; # switch to previous workspace when pressing the same workspace key
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "0%"; # only scroll if it wont move the screen
        };
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
