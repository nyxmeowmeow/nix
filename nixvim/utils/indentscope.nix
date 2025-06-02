{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.mini-indentscope ];
    extraConfigLua = ''
      require('mini.indentscope').setup({
          draw = {
              delay = 100,
          },
          symbol = "│";
      })
    '';
#    plugins.mini-indentscope = {
#      enable = true;
#      settings = {
#        draw.delay = 100;
#        symbol = "│";
#      };
#    };
  };
}
