{
  programs.nixvim.plugins.tiny-inline-diagnostic = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];
  };
}
