{
    programs.nixvim.plugins.treesitter = {
    enable = true;

    lazyLoad.settings.event = [
      "BufEnter"
    ];
    };
}
