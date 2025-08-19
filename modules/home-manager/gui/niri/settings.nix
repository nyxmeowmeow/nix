{
  programs.niri.settings = {

  # debug.preview-render = "screencast";
  # debug.preview-render = "screen-capture";

  #   xwayland-satellite = {
  #     enable = true;
  #     path = "xwayland-satellite";
  #   };


    prefer-no-csd = true;
    screenshot-path = "~/Pictures/Screenshots/%d/%m/%Y_%H-%M-%S.png";
    hotkey-overlay.skip-at-startup = true;
    gestures.hot-corners.enable = false;


    overview = {
      # backdrop-color = 
      workspace-shadow.enable = false;
    };

    workspaces = {
      "1" = {
        name = "left";
        open-on-output = "DP-1";
      };
      "2" = {
        name = "browser";
        open-on-output = "DP-1";
      };
      "3" = {
        name = "game";
        open-on-output = "DP-1";
      };
      "4" = {
        name = "discord";
        open-on-output = "DP-1";
      };
      "5" = {
        name = "media";
        open-on-output = "DP-1";
      };
      "6" = {
        name = "right";
        open-on-output = "DP-1";
      };
      "99" = {
        name = "alt";
        open-on-output = "DP-3";
      };
    };

  };
}
