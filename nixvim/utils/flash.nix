{
  programs.nixvim = {
  plugins.flash = {
    enable = true;
    settings = {
      label.uppercase = false;
      labels = "nisetachr";
      prompt.enabled = false;
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
