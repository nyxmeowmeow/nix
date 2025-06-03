{
  programs.nixvim = {
  plugins.flash = {
    enable = true;
    settings = {
      label.uppercase = false;
      labels = "nisetachr";
      prompt = {
        win_config.zindex = -1000;
        #prefix = [ "" "FlashPromptIcon" ];
      };
    };
  };
    keymaps = [
    {
      key = "<cr>";
      action = "function() require('flash').jump() end";
      mode = [ "n" "v" "x" ];
      lua = true;
    }
    {
      key = "<cr>";
      action = "function() require('flash').remote() end";
      mode = [ "o" ];
      lua = true;
    }
    ];
  };
}
