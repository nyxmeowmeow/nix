{ lib, config, ... }: {
  # config = lib.mkIf (config.theme == "everforest_soft") {
  # TODO change visual bg to gray1 or something

    programs.nixvim.colorschemes.everforest = {
      enable = true;
      settings = {
        background = "soft";
        disable_italic_comments = true;
        show_eob = 0; # ~ at end of buffer
      };
    };
  # };
}
