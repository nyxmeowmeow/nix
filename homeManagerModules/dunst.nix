{ config, pkgs, ... }: {
  
  services.dunst = {
    enable = true;
    settings = {

      global = {
        monitor = 0;
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "20x20";
        scale = 0;
        notification_limit = 20;


        progress_bar = true;

        # Set the progress bar height. This includes the frame, so make sure
        # it's at least twice as big as the frame width.
        progress_bar_height = 10;

        # Set the frame width of the progress bar
        progress_bar_frame_width = 0;

        # Set the minimum width for the progress bar
        progress_bar_min_width = 125;

        # Set the maximum width for the progress bar
        progress_bar_max_width = 250;

        # Corner radius for the progress bar. 0 disables rounded corners.
        progress_bar_corner_radius = 4;
      };
    };
  };
}
