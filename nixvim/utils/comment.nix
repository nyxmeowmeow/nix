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
        comment = "\\";
        comment_line = "g\\";
        comment_visual = "\\";
        textobject = "\\";
      };
    };
  };
}
