{ lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "lix") {
    programs.yazi.theme = {
      mgr = {
        cwd.fg = col.fg;

        find_keyword  = {
          fg = col.bubblegum;
          bold = true;
          italic = false;
          underline = false;
        };

        find_position = {
          fg = "magenta";
          bg = "reset";
          bold = true;
          italic = true;
        };

        marker_copied = {
          fg = col.mint;
          bg = col.mint;
        };

        marker_cut = {
          fg = col.red;
          bg = col.red;
        };

        marker_marked = {
          fg = col.violet;
          bg = col.violet;
        };

        marker_selected = {
          fg = col.blue;
          bg = col.blue;
        };

      };
    };
  };
}
