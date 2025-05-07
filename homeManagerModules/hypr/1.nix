{ ... }: {
  wayland.windowManager.hyprland = {

    settings = {
      general = {
        gaps_in = "4";
        gaps_out = "8";
        border_size = "2";
        "col.active_border" = "rgba(b7bdf8ff)";
        "col.inactive_border" = "rgba(24273aff)";
      };

    };

  };
}
