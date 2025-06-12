{ lib, theme, ... }: {
  config = lib.mkIf (theme == "ocean") {

    programs.foot = {
      enable = true;
      settings = {
        cursor.color = "a0b8e6 0c1228";

        colors = {
          alpha = "0.65";

          background = "0c1228";
          foreground = "a0b8e6";

          ## Normal/regular colors (color palette 0-7)
          regular0 = "000000";  # black
          regular1 = "d874e4";  # red
          regular2 = "8ec3d2";  # green
          regular3 = "6aedf2";  # yellow
          regular4 = "5081e8";  # blue
          regular5 = "000000";  # magenta
          regular6 = "6aedf2";  # cyan
          regular7 = "D5E7FF";  # white

          ## Bright colors (color palette 8-15)
          bright0 = "616161";   # bright black
          bright1 = "ed8796";   # bright red
          bright2 = "a6da95";   # bright green
          bright3 = "eed49f";   # bright yellow
          bright4 = "b7bdf8";   # bright blue
          bright5 = "c6a0f6";   # bright magenta
          bright6 = "8bd5ca";   # bright cyan
          bright7 = "ffffff";   # bright white
        };
        tweak.box-drawing-base-thickness = "0.05";
      };
    };
  };
}
