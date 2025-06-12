{ lib, theme, ... }: {
  config = lib.mkIf (theme == "black") {

    programs.foot = {
      enable = true;
      settings = {
        cursor.color = "000000 cad3f5";

        colors = {
          alpha = "0.8";

          background = "000000";
          foreground = "cad3f5";

          # Normal/regular colors (color palette 0-7)
          regular0 = "242424";  # black
          regular1 = "ed8796";  # red
          regular2 = "a6da95";  # green
          regular3 = "eed49f";  # yellow
          regular4 = "b7bdf8";  # blue
          regular5 = "c6a0f6";  # magenta
          regular6 = "8bd5ca";  # cyan
          regular7 = "e6e6e6";  # white

          # Bright colors (color palette 8-15)
          bright0 = "616161";   # bright black
          bright1 = "ed8796";   # bright red
          bright2 = "a6da95";   # bright green
          bright3 = "eed49f";   # bright yellow
          bright4 = "b7bdf8";   # bright blue
          bright5 = "c6a0f6";   # bright magenta
          bright6 = "8bd5ca";   # bright cyan
          bright7 = "ffffff";   # bright white
        };
      };
    };
  };
}
