{
  lib,
  wm,
  ...
}:
{
  config = lib.mkIf (wm == "niri") {
    programs.niri.settings = {

# debug.preview-render = "screencast";
# debug.preview-render = "screen-capture";

#   xwayland-satellite = {
#     enable = true;
#     path = "xwayland-satellite";
#   };


      prefer-no-csd = true;
      screenshot-path = "/tmp/screenshots";
      hotkey-overlay.skip-at-startup = true;
      gestures.hot-corners.enable = false;


      overview = {
        backdrop-color = "transparent";
# zoom = 0.70;
        workspace-shadow.enable = false;
      };

      workspaces = {
        "1" = {
          name = "left";
          open-on-output = "DP-1";
        };
        "2" = {
          name = "right";
          open-on-output = "DP-1";
        };
        "3" = {
          name = "spacer1";
          open-on-output = "DP-1";
        };
        "4" = {
          name = "media";
          open-on-output = "DP-1";
        };
        "5" = {
          name = "spacer2";
          open-on-output = "DP-1";
        };
        "6" = {
          name = "discord";
          open-on-output = "DP-1";
        };
        "7" = {
          name = "spacer3";
          open-on-output = "DP-1";
        };
        "8" = {
          name = "one";
          open-on-output = "DP-1";
        };
        "9" = {
          name = "spacer4";
          open-on-output = "DP-1";
        };
        "a" = {
          name = "two";
          open-on-output = "DP-1";
        };
        "b" = {
          name = "spacer5";
          open-on-output = "DP-1";
        };
        "c" = {
          name = "three";
          open-on-output = "DP-1";
        };
        "d" = {
          name = "spacer6";
          open-on-output = "DP-1";
        };
        "e" = {
          name = "four";
          open-on-output = "DP-1";
        };
        "zzz" = {
          name = "alt";
          open-on-output = "DP-3";
        };

        "xxx" = {
          name = "ghostty_nvim";
          open-on-output = "DP-1";
        };
        "xxy" = {
          name = "ghostty_term";
          open-on-output = "DP-1";
        };
        "xxz" = {
          name = "ghostty_yazi";
          open-on-output = "DP-1";
        };
      };
    };
  };
}
