{
  programs.nixvim.plugins.snacks.settings.picker = {
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
        "<leader>r" = "snacks picker";
        };



    };
  };
}
