{
  programs.nixvim.plugins.yanky = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

    settings = {
      highlight = {
        on_yank = true;
        on_put = true;
      };

    };

  };
}
