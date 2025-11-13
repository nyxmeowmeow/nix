{
  programs.nixvim.plugins.mini.modules.bracketed = {
    enable = true;

    lazyLoad.enable = true;
    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

    settings = {
      keymaps = [
      { buffer = "r"; }
      { comment = "w"; }
      { conflict = "x"; }
      { diagnostic = "t"; }
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
