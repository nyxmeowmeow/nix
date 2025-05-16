{ ... }: {
  wayland.windowManager.hyprland = {

    settings = {
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(b7bdf8ff)";
        "col.inactive_border" = "rgba(24273a00)";
      };



      decoration = {
        dim_special = 0;
        rounding = 10;
        shadow.enabled = false;
        blur = {
          enabled = true;
          special = false;
          size = 4;
          passes = 3;
          popups = true;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
        };


      # windowrulev2 = [
      #   ];

      };

    };

  };
}
