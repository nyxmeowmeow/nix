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

        # visual select
        marker_marked = {
          fg = col.violet;
          bg = col.violet;
        };

        # one at a time
        marker_selected = {
          fg = col.blue;
          bg = col.blue;
        };


        count_copied = {
          fg = col.bg;
          bg = col.green;
        };

        count_cut = {
          fg = col.bg;
          bg = col.red;
        };

        count_selected = {
          fg = col.bg;
          bg = col.blue;
        };

      };
    };
  };
}
