{
  programs.nixvim = {
  plugins.flash = {
    enable = true;
    settings = {
      labels = "nisetachr";
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
