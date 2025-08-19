{
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
    };
    cursor.hide-after-inactive-ms = 666;
  };
}
