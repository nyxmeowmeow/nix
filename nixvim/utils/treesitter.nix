{
    programs.nixvim.plugins.treesitter = {
    enable = false;

    lazyLoad.settings.event = [
      "BufEnter"
    ];
    };
}
