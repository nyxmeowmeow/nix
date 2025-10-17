{ pkgs, ... }: {
  programs.nixvim.plugins.smear-cursor = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

  };
}
