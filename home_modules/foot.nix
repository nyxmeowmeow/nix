{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";

        font = "Mononoki Nerd Font Mono:size=25";
        dpi-aware = false;
        shell = "nu";


        box-drawings-uses-font-glyphs = false;
      };

      cursor = {
        style = "beam";
        blink = true;
        unfocused-style = "unchanged";
      };
      tweak.box-drawing-base-thickness = "0.05";
      key-bindings = {
        scrollback-up-half-page = "Control+Shift+e";
        scrollback-down-half-page = "Control+Shift+a";
        scrollback-home = "Control+Shift+h";
        scrollback-end = "Control+Shift+i";
        # search-start = "Control+/";
        # find-prev = "Control+h";
        # find-next = "Control+i";
      };
    };
  };
}
