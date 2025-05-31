{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        hls.enable = true;
        clangd.enable = true;
        rust_analyzer = {
          enable = true;
          installRustc = false;
          installCargo = false;
        };
      };
    };
  };
}
