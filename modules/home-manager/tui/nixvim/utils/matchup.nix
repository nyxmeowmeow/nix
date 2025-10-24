{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.vim-matchup ];
    extraConfigLua = ''
      require('matchup').setup()
    '';
  };
}
