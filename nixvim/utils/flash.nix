{
  programs.nixvim.plugins.flash = {
    enable = true;
    settings = {
      labels = "nisetachr";
      keymaps = {
      "<cr>" = "function() require('flash').jump() end";
      };
    };
  };
}
