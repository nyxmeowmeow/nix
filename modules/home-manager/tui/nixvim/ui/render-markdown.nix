{
  programs.nixvim.plugins.render-markdown = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

    settings = {
      debounce = 50;

      code = {
        sign = false;
        # width = "block";
        disable_background = true;
        left_pad = 2;
        left_margin = 2;
        border = "none";
      };

    };
  };
}
