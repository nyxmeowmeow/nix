{
  programs.niri.settings.layout = {
    gaps = 10;
    center-focused-column = "never";
    # center-focused-column = "on-overflow";
    always-center-single-column = true;



    focus-ring = {
      enable = true;
      width = 2;
      active.color = "#B7BDF8";
    };
    tab-indicator = {
      enable = true;
      active.color = "#B7BDF8";
      inactive.color = "#5b6078";
      hide-when-single-tab = false;
    };

    default-column-width = { proportion = 1. / 2.; };
    preset-column-widths = [
    { proportion = 0.3334; } # leaks a bit with exactly 1/3
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
