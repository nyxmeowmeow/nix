{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

    lazyLoad.settings.event = [
      "BufEnter"
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

        "<leader>i" = "find_files { cwd = '/home/meow/nix' }";
      };
    };
  };
}
