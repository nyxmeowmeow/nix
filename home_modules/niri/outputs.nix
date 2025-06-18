{
  programs.niri.settings = {
    outputs = {
      "DP-1" = {
        enable = true;
        name = "main";
        focus-at-startup = true;
        variable-refresh-rate = false;
        mode = {
          width = 2560;
          height = 1440;
          refresh = 165.08;
        };
      };
      "DP-3" = {
        enable = true;
        name = "secondary";
        focus-at-startup = false;
        variable-refresh-rate = false;
        transform.rotation = 90;
        mode = {
          width = 2560;
          height = 1440;
          # refresh = 75;
        };
      };
    };
  };
}
