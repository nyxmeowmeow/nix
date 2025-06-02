{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.nvim-highlight-colors ];
    extraConfigLua = ''
      require('nvim-highlight-colors').setup()
    '';
  };
}
