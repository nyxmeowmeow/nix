{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      lazyLoad.settings.event = [
        "DeferredUIEnter"
      ];

      settings = {
        defaults = {
          selection_caret = "  ";
          entry_prefix = "  ";
        };

        pickers = {
          colorscheme = {
            enable_preview = true;
          };
        };
        side_by_side = false;
        layout_strategy = "horizontal";
        layout_config = {
          preview_width = 0.5;
        };
      };

    keymaps = {
      "<leader>r" = "oldfiles";
      "<leader><leader>" = "buffers";
      "<leader>gw" = "git_commits";
      "<leader>ga" = "git_status";
      "<leader>f" = "live_grep { cwd = '/home/meow/nix' }";
      "<leader>/" = "current_buffer_fuzzy_find";

      "<leader>i" = "oldfiles { cwd = '/home/meow/nix' }";
    };
    };
  };
}
