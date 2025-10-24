{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.vim-matchup ];
    extraConfigLua = ''
      require('match-up').setup()
    '';
  };
}
