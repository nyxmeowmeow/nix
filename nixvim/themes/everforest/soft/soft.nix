{ lib, config, ... }:
let
  col = import ../../../../themes/everforest/soft/colors.nix;
in {
  config = lib.mkIf (config.theme == "everforest_soft") {
  # TODO change visual bg to gray1 or something

    programs.nixvim = {
    colorschemes.everforest = {
      enable = true;
      settings = {
        background = "soft";
        disable_italic_comments = true;
        show_eob = 0; # ~ at end of buffer

        on_highlights = {
        #   lualine_transparent.fg = col.gray1;
        #   lualine_a_normal = { fg = col.bg; bg = col.gray1; };
        #   lualine_a_insert = { fg = col.bg; bg = col.fg; };
        #   lualine_a_inactive.fg = col.gray1;
        LineNr.fg = col.gray2;
        };
        colors_override = {
          fg = [ "#9DA9A0" "247" ];
        };
      };
    };
    };
  };
}
