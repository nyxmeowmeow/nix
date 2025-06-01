{
  programs.nixvim = {
  plugins.flash = {
    enable = true;
    settings = {
      labels = "nisetachr";
      prompt.enable = false;
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
