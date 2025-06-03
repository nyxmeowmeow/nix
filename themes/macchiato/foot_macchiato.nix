{
  
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";

        font = "Mononoki Nerd Font Mono:size=20";
        dpi-aware = "yes";
        shell = "nu";


        box-drawings-uses-font-glyphs = "no";
      };

      cursor = {
        style = "beam";
        blink = "yes";
        unfocused-style = "unchanged";
        color = "24273a cad3f5";
      };

      colors = {
        alpha = "0.5";
        background = "24273a";
        foreground = "cad3f5";
        ## Normal/regular colors (color palette 0-7)
        regular0 = "242424";  # black
        regular1 = "ed8796";  # red
        regular2 = "a6da95";  # green
        regular3 = "eed49f";  # yellow
        regular4 = "b7bdf8";  # blue
        regular5 = "c6a0f6";  # magenta
        regular6 = "8bd5ca";  # cyan
        regular7 = "e6e6e6";  # white

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
      key-bindings = {
        scrollback-up-half-page = "Control+Shift+e";
        scrollback-down-half-page = "Control+Shift+a";
        scrollback-home = "Control+Shift+h";
        scrollback-end = "Control+Shift+i";
        # search-start = "Control+/";
        # find-prev = "Control+h";
        # find-next = "Control+i";
      };
      tweak.box-drawing-base-thickness = "0.05";
    };
  };


  home.file.".config/foot/float.ini".text = /* ini */ ''
    shell=nu
    app-id=footfloatme
    title=floatme
    font=Mononoki Nerd Font Mono:size=20
    dpi-aware=yes

    [cursor]
    style=beam
    blink=yes
    blink-rate=500
    unfocused-style=unchanged
    color=24273a cad3f5


    [colors]
    alpha=0
    background=24273a
    foreground=cad3f5
    flash=7f7f00
    flash-alpha=0.5

    ## Normal/regular colors (color palette 0-7)
    regular0=242424  # black
    regular1=ed8796  # red
    regular2=a6da95  # green
    regular3=eed49f  # yellow
    regular4=b7bdf8  # blue
    regular5=c6a0f6  # magenta
    regular6=8bd5ca  # cyan
    regular7=e6e6e6  # white

    ## Bright colors (color palette 8-15)
    bright0=616161   # bright black
    bright1=ed8796   # bright red
    bright2=a6da95   # bright green
    bright3=eed49f   # bright yellow
    bright4=b7bdf8   # bright blue
    bright5=c6a0f6   # bright magenta
    bright6=8bd5ca   # bright cyan
    bright7=ffffff   # bright white


    [tweak]
    box-drawing-base-thickness=0.05
  '';
}

