{
  programs.niri.settings = {
    input = {
      focus-follows-mouse.enable = true;
      mouse = {
        accel-profile = "flat";
        accel-speed = 0.2;
      };
      tablet = {
        enable = true;
        map-to-output = "DP-1";
      };
    };
    cursor.hide-after-inactive-ms = 1000;
  };
}
