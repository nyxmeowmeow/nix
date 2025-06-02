{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.mini-indentscope ];
    extraConfigLua = ''
      require('mini.indentscope').setup()
    '';
    plugins.mini-indentscope = {
      enable = true;
      settings = {
        draw.delay = 100;
        symbol = "│";
      };

    };
  };
}
