{ pkgs, ... }: {
  programs.nixvim.plugins.smear-cursor = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

    settings = {
      legacy_computing_symbols_support = true;
      cursor_color = "#C5C9C7";
      time_interval = 6;
    };

  };
}
