{
  programs.nixvim.plugins.zen-mode = {
    enable = true;

    settings = {
      signcolumn = false;
      number = false;
      relativenumber = false;
      cursorline = false;
      cursorcolumn = false;
      foldcolumn = false;


    };

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];
  };
}
