{
  programs.nixvim.plugins.luasnip = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

  };
}
