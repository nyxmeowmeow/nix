{
  lib,
  config,
  wm,
  ...
}:
let
radius = if ((import ../../../nixos/config.nix).config.rounding) then 10.0 else 0.0;
in
{
  config = lib.mkIf (wm == "niri") {
    programs.niri.settings.window-rules = [
    {
      draw-border-with-background = false;
      clip-to-geometry = true;
      geometry-corner-radius = {
        top-left = radius;
        top-right = radius;
        bottom-left = radius;
        bottom-right = radius;
      };
    }


    {
      matches = [ { app-id = "^vesktop$"; } ];
      block-out-from = "screencast";
      open-on-workspace = "discord";
    }

    {
      matches = [ { title = "^Dolphin$"; } ];
      block-out-from = "screencast";
      open-on-workspace = "one";
      open-fullscreen = true;
    }

    {
      matches = [ { 
        app-id = "steam_app_1802710";
      } ];
      open-on-workspace = "one";
      min-width = 2560;
      max-width = 2560;
      min-height = 1080;
      max-height = 1080;
      geometry-corner-radius = {
        top-left = 0.0;
        top-right = 0.0;
        bottom-left = 0.0;
        bottom-right = 0.0;
      };
      variable-refresh-rate = false;
      open-floating = false;
    }

    {
      matches = [ { 
        app-id = "steam_app_2225070";
        title = "Trackmania";
      } ];
      open-on-workspace = "one";
      min-width = 2560;
      max-width = 2560;
      min-height = 1080;
      max-height = 1080;
      geometry-corner-radius = {
        top-left = 0.0;
        top-right = 0.0;
        bottom-left = 0.0;
        bottom-right = 0.0;
      };
      variable-refresh-rate = false;
      open-floating = false;
    }

    { # ubisoft connect little white window
      matches = [ { 
        title = "^$";
        app-id = "steam_app_2225070";
      } ];
      opacity = 0.0;
    }

    {
      matches = [ { 
        title = "Krita";
        app-id = "krita";
      } ];
      open-maximized = true;
    }

    {
      matches = [ { title = "mail"; } ];
      block-out-from = "screen-capture";
    }
    {
      matches = [ { title = "itwarden"; } ];
      block-out-from = "screen-capture";
    }
    {
      matches = [ { title = "assword"; } ];
      block-out-from = "screen-capture";
    }
    ];
  };
}
