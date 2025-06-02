{ pkgs, ... }: {
  programs.nixvim.plugins.mini.modules.bracketed = {
  enable = true;
  settings = {
  keymaps = [
  { buffer = "r"; }
  ];
  };
};
}
