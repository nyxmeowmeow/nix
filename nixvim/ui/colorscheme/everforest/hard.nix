{ lib, config, ... }: {
  config = lib.mkIf (config.theme == "everforest_hard") {

    programs.nixvim.colorschemes.everforest = {
      enable = true;
      settings = {
        background = "hard";
        disable_italic_comments = true;
        show_eob = false; # ~ at end of buffer
      };
    };
  };
}
