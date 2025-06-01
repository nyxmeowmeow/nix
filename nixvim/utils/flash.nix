{
  programs.nixvim = {
  plugins.flash = {
    enable = true;
    settings = {
      labels = "nisetachr";
      prompt.win_config.col = 1000;
    };
  };
    keymaps = [
    {
      key = "<cr>";
      action = "function() require('flash').jump() end";
      mode = [ "n" "v" "x" ];
      lua = true;
    }
    ];
  };
}
