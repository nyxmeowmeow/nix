{
  lib,
  theme,
  ...
}: 
let
  col = import ../../../../../../../theme/everforest/medium/colors.nix;
in {
  config = lib.mkIf (theme == "everforest_medium") {

    programs.nixvim.plugins.lualine.settings.options = {
      theme = {
      # FIXME
        normal.a = { 
          fg = col.bg;
          bg = col.gray1;
        }; 
        insert.a = { 
          fg = col.bg;
          bg = col.fg;
        }; 
        visual.a = { 
          fg = col.bg;
          bg = col.fg;
        }; 
        replace.a = { 
          fg = col.bg;
          bg = col.fg;
        }; 
        inactive.a = {
          fg = col.gray1;
          bg = col.bg;
        }; 
      };
    };
  };
}
