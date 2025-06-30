{
  programs.nixvim.plugins.mini.modules.completion = {
    enable = true;
    settings = {
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
