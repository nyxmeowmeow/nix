{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.bracketed ];
    extraConfigLua = ''
      require('mini.bracketed').setup()
    '';
  };
}
