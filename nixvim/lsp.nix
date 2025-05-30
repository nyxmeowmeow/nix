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
    sources = [
      {name = "nvim_lsp";}
      {name = "path";}
      {name = "buffer";}
      {name = "luasnip";}
    ];
 
    mapping = {
      "<CR>" = "cmp.mapping.confirm({ select = true })";
      "<Tab>" = {
        action = ''
          function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end
        '';
        modes = [ "i" "s" ];
      };
    };
  };
};
}
