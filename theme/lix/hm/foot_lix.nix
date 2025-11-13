{ lib, theme, ... }: {
  config = lib.mkIf (theme == "lix") {
  
  programs.foot = {
    enable = true;
    settings = {
      colors = {
        alpha = "1";

        cursor = "3B224C A4A0E8";

        background = "3B224C";
        foreground = "A4A0E8";

        ## Normal/regular colors (color palette 0-7)
        regular0 = "281733";  #281733 black
        regular1 = "F22C86";  #F22C86 red
        regular2 = "A5E07F";  #A5E07F green
        regular3 = "EFBA5D";  #EFBA5D yellow
        regular4 = "9466ff";  #9466ff blue
        regular5 = "DBBFEF";  #DBBFEF magenta
        regular6 = "8bd5ca";  #8bd5ca cyan
        regular7 = "d5e7ff";  #d5e7ff white

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
    };
  };
  };
}
