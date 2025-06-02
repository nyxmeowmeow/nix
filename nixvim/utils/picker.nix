{
  programs.nixvim = {
    plugins.snacks.settings.picker = {
      enable = true;
      settings = {
        prompt = "󰘧";
        focus = "input";

        matcher = {
          cwd_bonus = true;
          history_bonus = true;
        };

        icons = {
          git.enable = false;
        };

        keymaps = {
          "<leader>r" = "picker";
        };



      };
    };

#    keymaps = [
#    {
#      key = "<leader>r";
#      action = "Snacks.picker()";
#      mode = [ "n" "v" "x" ];
#      lua = true;
#    }
#    {
#      key = "<leader><space>";
#      action = "Snacks.picker.buffers()";
#      mode = [ "n" "v" "x" ];
#      lua = true;
#    }
#    ];
  };
}
