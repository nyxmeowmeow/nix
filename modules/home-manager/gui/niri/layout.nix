{
  programs.niri.settings.layout = {
    gaps = 10;
    # center-focused-column = "never";
    center-focused-column = "on-overflow";
    always-center-single-column = true;



    focus-ring = {
      enable = true;
      width = 3;
    };
    tab-indicator = {
      enable = true;
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
