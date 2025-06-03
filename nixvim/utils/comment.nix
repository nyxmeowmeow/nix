{
  programs.nixvim = {
    plugins.mini.modules.comment = {
      enable = true;

      lazyLoad.settings.event = [
        "DeferredUIEnter"
      ];

      settings = {
        ignore_blank_line = true;
      };
      keymaps = {
        comment = "x";
        comment_line = "gx";
        comment_visual = "x";
        textobject = "x";
      };
    };
  };
}
