
{
  programs.nixvim = {
  plugins.mini.splitjoin.pairs.enable = true;
};
keymaps = [
    {
      key = "ga";
      action = "MiniSplitjoin.toggle()";
      mode = [ "n" "v" "x" ];
      lua = true;
    }
];
}
