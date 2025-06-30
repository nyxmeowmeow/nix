{
programs.nixvim.plugins.cmp = {
  enable = true;
  autoLoad = false;

  lazyLoad.settings.event = [
    "DeferredUIEnter"
  ];

  settings = {
  sources = [
    { name = "nvim_lsp"; }
    # { name = "buffer"; }
    { name = "path"; }
  ];
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
