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
      };
      keymaps = {
        "<leader>r" = "oldfiles";
        "<leader>gc" = "git commits";
        "<leader>gs" = "git status";
        "<leader>f" = "live grep";

        "<leader>i" = "find_files { cwd = '/home/meow/nix' }";
      };
    };
  };
}
