{
  programs.nixvim.plugins.mini.modules.bracketed = {
    enable = true;
    settings = {
      keymaps = [
      { buffer = "r"; }
      { comment = "w"; }
      { conflict = "x"; }
      { diagnostic = "s"; }
      { file = "m"; }
      { indent = "l"; }
      { jump = "y"; }
      { location = "p"; }
      { oldfile = "d"; }
      { quickfix = "q"; }
      { treesitter = "b"; }
      { undo = "u"; }
      { window = "v"; }
      { yank = "f"; }
      ];
    };
  };
}
