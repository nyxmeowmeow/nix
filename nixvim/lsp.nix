{ ... }: {

programs.nixvim.plugins = {
  lsp = {
    enable = true;
    servers = {
      nixd.enable = true; # Enable nil_ls. You can use nixd or anything you want from the docs.
    };
  };
  nvim-cmp = {
    enable = true;
    autoEnableSources = true;
 
  };
};
}
