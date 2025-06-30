{
# programs.nixvim.plugins.cmp.enable = true;

  programs.nixvim.plugins.mini.modules.completion = {
    enable = true;

    settings = {
      lspCompletion = {
        sourceFunc = "completefunc";
        autoSetup = true;
      };
      window = {
        info = {
          height = 20;
          width = 30;
          border = null;
        };
        signature = {
          height = 25;
          width = 80;
          border = null;
        };
      };
    };
  };
}
