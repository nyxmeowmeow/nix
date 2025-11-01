{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in {
  programs.yazi.theme = {
    mgr = {
      border_symbol = " ";
      hovered.reversed = true;
      preview_hovered.underline = true;
    };
    tabs = {
      active = {
        bg = col.accent;
        fg = col.bg;
      };
      inactive = {
        bg = "none";
        fg = col.accent;
      };
      sep_inner = {
        open = "";
        close = "";
      };
      sep_outer = {
        open = "";
        close = "";
      };
    };
  };
}
