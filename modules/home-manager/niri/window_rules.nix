{
  programs.niri.settings.window-rules = [
  {


    draw-border-with-background = false;
    geometry-corner-radius =
      let
        r = 10.0;
      in
      {
        top-left = r;
        top-right = r;
        bottom-left = r;
        bottom-right = r;
      };
    clip-to-geometry = true;
  }

  {
    matches = [ { app-id = "^vesktop$"; } ];
    block-out-from = "screen-capture";
  }

  {
    matches = [ { 
      app-id = "steam_app_2225070";
      title = "Trackmania";
    } ];
    opacity = 0.0;
    open-on-workspace = "game";
    min-width = 2560;
    max-width = 2560;
    min-height = 1080;
    max-height = 1080;
    # geometry-corner-radius = 0;
    variable-refresh-rate = false;
  }

  { # ubisoft connect little white window
    matches = [ { 
      app-id = "steam_app_2225070";
      title = "";
    } ];
    opacity = 0.0;
  }

# {
#   matches = [ { title = "mail"; } ];
#   block-out-from = [ "screen-capture" "screencast" ];
# }
# {
#   matches = [ { title = "bitwarden"; } ];
  #   block-out-from = [ "screen-capture" "screencast" ];
  # }
  # {
  #   matches = [ { title = "password"; } ];
  #   block-out-from = [ "screen-capture" "screencast" ];
  # }
  ];
}
