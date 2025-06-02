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



      };
    };

    keymaps = [
    {
      key = "<leader>r";
      action = "<cmd>lua Snacks.picker.files()<cr>";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "<leader><space>";
      action = "<cmd>lua Snacks.picker.buffers()<cr>";
      mode = [ "n" "v" "x" ];
    }
    ];
  };
}
