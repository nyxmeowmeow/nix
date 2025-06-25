{ lib, theme, ... }: {
  config = lib.mkIf (theme == "lix") {
    programs.yazi.theme = {
      mgr = {
        border_symbol = " ";
        border_style.fg = "#000000";
        cwd.fg = "fg";
      };
    };
  };
}
