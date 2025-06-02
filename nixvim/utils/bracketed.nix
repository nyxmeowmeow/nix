{ pkgs, ... }: {
  programs.nixvim = {
  plugins.mini.enable = true;
    extraPlugins = [ pkgs.vimPlugins.mini-bracketed ];
    extraConfigLua = ''
      require('mini.bracketed').setup({
  buffer     = { suffix = 'r', options = {} },
  comment    = { suffix = 'w', options = {} },
  conflict   = { suffix = 'x', options = {} },
  diagnostic = { suffix = 's', options = {} },
  file       = { suffix = 'm', options = {} },
  indent     = { suffix = 'l', options = {} },
  jump       = { suffix = 'y', options = {} },
  location   = { suffix = 'p', options = {} },
  oldfile    = { suffix = 'd', options = {} },
  quickfix   = { suffix = 'q', options = {} },
  treesitter = { suffix = 'b', options = {} },
  undo       = { suffix = 'u', options = {} },
  window     = { suffix = 'v', options = {} },
  yank       = { suffix = 'f', options = {} },
      })
    '';
  };
}
