{
  pkgs,
  ...
}: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.vim-matchup ];
    extraConfigLua = ''
    require('match-up').setup({
      treesitter = {
        stopline = 500
      }
    })
    '';

    extraConfigVim = ''
      let g:matchup_matchparen_singleton = 0
      let g:matchup_matchparen_offscreen = {'method': 'popup'}
    '';
  };
}
