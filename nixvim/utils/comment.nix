{
  programs.nixvim = {
    plugins.mini.modules.splitjoin.enable = true;
    keymaps = [
    {
      key = "ga";
      action = "MiniSplitjoin.toggle()";
      mode = [ "n" "v" "x" ];
      lua = true;
    }
    ];
  };
}
