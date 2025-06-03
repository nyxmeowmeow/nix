{
  programs.nixvim.plugins.zen-mode = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];
  };
}
