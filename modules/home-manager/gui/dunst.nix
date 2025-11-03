{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    libnotify
  ];

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

        font = "${config.stylix.fonts.monospace.name} 8";

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
        frame_width = 2;

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



        line_height = 3;

        markup = "full";


        format = "%s\n%b";

        alignment = "left";

        vertical_alignment = "center";


        show_age_threshold = 60;


        ellipsize = "end";

        ignore_newline = false;


        stack_duplicates = true;

        # Hide the count of stacked notifications with the same content
        hide_duplicate_count = false;

        # Display indicators for URLs (U) and actions (A).
        show_indicators = true;





        icon_theme = "Tela-circle-dracula";

        icon_path = "$HOME/.icons/Tela-circle-dracula/16/actions:$HOME/.icons/Tela-circle-dracula/16/apps:$HOME/.icons/Tela-circle-dracula/16/devices:$HOME/.icons/Tela-circle-dracula/16/mimetypes:$HOME/.icons/Tela-circle-dracula/16/panel:$HOME/.icons/Tela-circle-dracula/16/places:$HOME/.icons/Tela-circle-dracula/16/status";

        icon_position = "left";

        min_icon_size = 32;

        max_icon_size = 128;

        sticky_history = true;

        history_length = 20;
      };
    };
  };
}
