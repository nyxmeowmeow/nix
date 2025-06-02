{
  programs.nixvim = {
    plugins.mini.modules.splitjoin.pairs = {
      enable = true;
      keymaps = {
        "ga" = "toggle";
      };
    };
  };
}
