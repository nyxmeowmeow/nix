{
  programs.niri.settings.window-rules = [
  {
    draw-border-with-background = false;
    clip-to-geometry = true;
    geometry-corner-radius =
      let
        r = 10.0;
      in {
        top-left = r;
        top-right = r;
        bottom-left = r;
        bottom-right = r;
      };
  }

  {
    matches = [ { app-id = "^vesktop$"; } ];
    block-out-from = "screencast";
    open-on-workspace = "discord";
  }

  {
    matches = [ { 
      app-id = "steam_app_2225070";
      title = "Trackmania";
    } ];
    open-on-workspace = "game";
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
}
