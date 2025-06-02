{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.mini-bracketed ];
    extraConfigLua = ''
      require('mini.bracketed').setup()
    '';
  };
}
