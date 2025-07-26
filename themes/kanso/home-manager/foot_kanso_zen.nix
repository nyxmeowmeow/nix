{ lib, theme, ... }: {
  config = lib.mkIf (theme == "kanso_zen") {

    programs.foot = {
      enable = true;
      settings = {
        colors = {
          alpha = "0.8";

          cursor = "090E13 C5C9C7";

          background = "090E13";
          foreground = "C5C9C7";

          ## Normal/regular colors (color palette 0-7)
          regular0 = "393B44";  # black
          regular1 = "C34043";  # red
          regular2 = "98BB6C";  # green
          regular3 = "DCA561";  # yellow
          regular4 = "7FB4CA";  # blue
          regular5 = "938AA9";  # magenta
          regular6 = "8ea4a2";  # cyan
          regular7 = "f2f1ef";  # white

          ## Bright colors (color palette 8-15)
          bright0 = "393B44";   # bright black
          bright1 = "C34043";   # bright red
          bright2 = "98BB6C";   # bright green
          bright3 = "DCA561";   # bright yellow
          bright4 = "7FB4CA";   # bright blue
          bright5 = "938AA9";   # bright magenta
          bright6 = "8ea4a2";   # bright cyan
          bright7 = "f2f1ef";   # bright white
        };
        tweak.box-drawing-base-thickness = "0.05";
      };
    };
  };
}
