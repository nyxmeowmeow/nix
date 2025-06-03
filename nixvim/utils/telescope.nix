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
        "<leader>gc" = "git_commits";
        "<leader>gs" = "git_status";
        "<leader>f" = "live_grep";

        # "<leader>i" = "find_files { cwd = '/home/meow/nix' }";
      };
    };
    # keymaps = [
    # {
    #   key = "<leader>gc";
    #   action = "<cmd>Telescope git_commits<cr>";
    #   mode = [ "n" "v" "x" "o" ];
    # }
    # ];
  };
}
