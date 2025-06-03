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
        comment = "S-\\";
        comment_line = "g\\\\";
        comment_visual = "S-\\";
        textobject = "S-\\";
      };
    };
  };
}
