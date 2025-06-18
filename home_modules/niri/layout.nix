{
  programs.niri.settings.layout = {
    gaps = 10;
    center-focused-column = "never";
    # center-focused-column = "on-overflow";
    always-center-single-column = true;

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

    focus-ring = {
      enable = true;
      width = 2;
    };

    border.enable = false;
    shadow.enable = false;

    tab-indicator.hide-when-single-tab = true;

  };
}
