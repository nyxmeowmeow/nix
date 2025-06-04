{
  programs.nixvim.plugins.mini.modules.pairs = {
    enable = true;
    modes = {
      insert = true;
      command = false;
      terminal = false;
    };
  };
}
