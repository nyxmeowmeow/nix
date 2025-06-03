{
  programs.nixos.plugins.zen-mode = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];
  };
}
