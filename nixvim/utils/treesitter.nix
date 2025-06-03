{
    programs.nixvim.plugins.treesitter = {
    enable = true;

    lazyLoad.settings.event = [
      "VimEnter"
      "BufReadPost"
      "BufNewFile"
    ];
    };
}
