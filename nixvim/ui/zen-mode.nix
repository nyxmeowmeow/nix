{
  programs.nixvim.plugins.zen-mode = {
    enable = true;

    settings = {
      options = {
        signcolumn = false;
        number = false;
        relativenumber = false;
        cursorline = false;
        cursorcolumn = false;
        foldcolumn = false;
      };
      backdrop = 1;
      plugins = {
      gitsigns.enable = false;
      };

    };

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];
  };
}
