{ lib, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "lix") {
    programs.yazi.theme = {
      mgr = {
        border_symbol = " ";
        cwd.fg = col.fg;
        hovered.reversed = true;
        preview_hovered.underline = true;
      };
    };
  };
}
