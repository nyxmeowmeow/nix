{
programs.nixvim.plugins.cmp = {
  enable = true;

  settings = {
    sources = [
    { name = "nvim_lsp"; }
    { name = "buffer"; }
    { name = "path"; }
    ];

    preselect = # lua
      "cmp.PreselectMode.None";

    mapping = {
      "<C-j>" = # lua
        "cmp.mapping.scroll_docs(-4)";
      "<C-u>" = # lua
        "cmp.mapping.scroll_docs(4)";
      # "<C-Space>" = # lua
        # "cmp.mapping.complete()";
      # "<C-h>" = # lua
      #   "cmp.mapping.close()";
      # "<Tab>" = # lua
      #   "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
      "<Tab>" = # lua
        "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})  ";
      "<S-Tab>" = # lua
        "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
      "<C-Space>" = # lua
        "cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })";
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
