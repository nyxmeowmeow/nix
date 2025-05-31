{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        rust-analyzer.enable = true;
      };
    };
  };
}
