{ config, pkgs, ... }: {
  
  services.dunst = {
    enable = true;
    settings = {

      global = {
        monitor = 0;
        width = "300";
        height = "300";
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


        indicate_hidden = true;

        separator_height = 2;

        # Padding between text and separator.
        padding = 8;

        # Horizontal padding.
        horizontal_padding = 8;

        # Padding between text and icon.
        text_icon_padding = 10;

        # Defines width in pixels of frame around the notification window.
        # Set to 0 to disable.
        frame_width = 5;

        gap_size = 5;

        # Define a color for the separator.
        # possible values are:
        #  * auto: dunst tries to find a color fitting to the background;
        #  * foreground: use the same color as the foreground;
        #  * frame: use the same color as the frame;
        #  * anything else will be interpreted as a X color.
        separator_color = "auto";

        # Sort messages by urgency.
        sort = true;


        font = "mononoki Nerd Font mono 8";

        # The spacing between lines.  If the height is smaller than the
        # font height, it will get raised to the font height.
        line_height = 3;
      };
    };
  };
}
