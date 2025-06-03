{
  programs.nixvim = {
    plugins.harpoon.enable = true;

    keymaps = [
    {
      mode = "n";
      key = "<leader>jh";
      action = ":lua require('harpoon.ui').toggle_quick_menu()<CR>";
#    lua = true;
      options = {
        silent = true;
        desc = "Mark Menu";
      };
    }

    {
      mode = "n";
      key = "<leader>jj";
      action = ":lua require('harpoon.mark').add_file()<CR>";
#    lua = true;
      options = {
        silent = true;
        desc = "Mark File";
      };
    }
    {
      mode = "n";
      key = "<leader>jl";
      action = ":lua require('harpoon.ui').nav_next()<CR>";
#    lua = true;
      options = {
        silent = true;
        desc = "Next Mark";
      };
    }

    {
      mode = "n";
      key = "<leader>jh";
      action = ":lua require('harpoon.ui').nav_prev()<CR>";
#    lua = true;
      options = {
        silent = true;
        desc = "Prev Mark";
      };
    }
    ];
  };
}
