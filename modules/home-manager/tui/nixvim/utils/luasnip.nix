{
  programs.nixvim.plugins.luasnip = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

  };
}
