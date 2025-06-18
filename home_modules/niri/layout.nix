{
  programs.niri.settings.layout = {
    gaps = 10;
    center-focused-column = "never";
    # center-focused-column = "on-overflow";
    always-center-single-column = true;


    # focus-ring = {
    #   enable = true;
    #   width = 2;
    #   active = "#B7BDF8";
    # };
    # tab-indicator = {
    #   enable = true;
    #   active = "#B7BDF8";
    #   inactive = "#A5ADCB";
    #   hide-when-single-tab = true;
    # };

    default-column-width = { proportion = 1. / 2.; };
    preset-column-widths = [
    { proportion = 1. / 3.; }
    { proportion = 1. / 2.; }
    { proportion = 2. / 3.; }
    ];
    preset-window-heights = [
    { proportion = 1. / 3.; }
    { proportion = 1. / 2.; }
    { proportion = 2. / 3.; }
    ];

    border.enable = false;
    shadow.enable = false;


  };
}
