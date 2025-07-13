{
  programs.nixvim.plugins.render-markdown = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

    settings = {
      debounce = 50;
    };
  };
}
