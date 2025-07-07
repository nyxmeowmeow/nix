{
programs.nixvim.plugins.cmp = {
  enable = true;

  settings = {
    sources = [
    { name = "nvim_lsp"; }
    { name = "buffer"; }
    { name = "path"; }
    ];
    mapping = {
      "<C-j>" = # Lua
        "cmp.mapping.scroll_docs(-4)";
      "<C-u>" = # Lua
        "cmp.mapping.scroll_docs(4)";
      "<C-Space>" = # Lua
        "cmp.mapping.complete()";
      "<C-h>" = # Lua
        "cmp.mapping.close()";
      "<Tab>" = # Lua
        "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
      "<S-Tab>" = # Lua
        "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
      "<CR>" = # Lua
        "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
    };


  };
};
# programs.nixvim.plugins.mini.modules.completion = {
#   enable = true;
#
#   settings = {
#     lspCompletion = {
#       sourceFunc = "omnifunc";
#       autoSetup = true;
#     };
#     window = {
#       info = {
#         height = 20;
#         width = 30;
#         border = null;
#       };
#       signature = {
#         height = 25;
#         width = 80;
#         border = null;
#       };
#     };
#   };
# };
}
