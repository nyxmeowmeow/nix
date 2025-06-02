{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.mini-trailspace ];
    extraConfigLua = ''
      require('mini.trailspace').setup()
    '';
  };
}
