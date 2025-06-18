{
  programs.niri.settings = {
    outputs = {
      "DP-1" = {
        enable = true;

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

        focus-at-startup = false;
        variable-refresh-rate = false;

        transform.rotation = 270;

        mode = {
          width = 2560;
          height = 1440;
          # refresh = 75;
        };
      };
    };
  };
}
