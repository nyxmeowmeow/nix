{
  programs.nixvim = {
    plugins.harpoon.enable = true;

    keymaps = [
    {
      mode = "n";
      key = "<leader>jh";
      action = "require('harpoon.ui').toggle_quick_menu()";
   lua = true;
      options = {
        silent = true;
        desc = "Mark Menu";
      };
    }

    {
      mode = "n";
      key = "<leader>jj";
      action = "require('harpoon.mark').add_file()";
   lua = true;
      options = {
        silent = true;
        desc = "Mark File";
      };
    }
    {
      mode = "n";
      key = "<leader>jl";
      action = "require('harpoon.ui').nav_next()";
   lua = true;
      options = {
        silent = true;
        desc = "Next Mark";
      };
    }

    {
      mode = "n";
      key = "<leader>jh";
      action = "require('harpoon.ui').nav_prev()";
   lua = true;
      options = {
        silent = true;
        desc = "Prev Mark";
      };
    }
    ];
  };
}
