{
  programs.nixvim = {
    plugins.mini.modules.comment = {
      enable = true;
      settings = {
        ignore_blank_line = true;
      };
      keymaps = {
        comment = "x";
        comment_line = "X";
        comment_visual = "x";
        textobject = "x";
      };
    };
  };
}
