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
    block-out-from = "screencast";
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
