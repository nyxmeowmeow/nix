{
  programs.nixvim.plugins.yanky = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings.event = [
      "BufEnter"
    ];

    settings = {
      highlight = {
        on_yank = true;
        on_put = true;
        timer = 200;
      };
    };
  };
}
