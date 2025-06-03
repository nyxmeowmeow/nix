{
  programs.nixvim.plugins.zen-mode = {
    enable = true;

    settings = {
      window = {
        backdrop = 1;
        width = 1;
        height = 1;

        options = {
          signcolumn = false;
          number = false;
          relativenumber = false;
          cursorline = false;
          cursorcolumn = false;
          foldcolumn = false;
        };
      };

      plugins.gitsigns.enable = false;
    };

    lazyLoad.settings.event = [ "DeferredUIEnter" ];
  };
}
