{ lib, config, ... }: {
  # config = lib.mkIf (config.theme == "everforest_soft") {

    programs.nixvim.colorschemes.everforest = {
      enable = true;
      settings = {
        background = "soft";
        disable_italic_comments = true;
        show_eob = false; # ~ at end of buffer
      };
    };
  # };
}
