{ pkgs, ... }: {
  programs.nixvim.plugins.smear-cursor = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

    settings = {
      legacy_computing_symbols_support = true;
    };

  };
}
