{ lib, ... }: {
  programs.nixvim.plugins.mini.modules.splitjoin.pairs = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

    settings = {
      detect = {
        brackets = lib.nixvim.mkRaw "nil";
        exclude_regions = lib.nixvim.mkRaw "nil";
        separator = ",";
      };
      mappings = {
        join = "ga";
        split = "gA";
      };
      join = {
        hooks_post = lib.nixvim.emptyTable;
        hooks_pre = lib.nixvim.emptyTable;
      };
      split = {
        hooks_post = lib.nixvim.emptyTable;
        hooks_pre = lib.nixvim.emptyTable;
      };
    };
  };
}
