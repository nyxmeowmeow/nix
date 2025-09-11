{ config, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        font = "${config.stylix.fonts.monospace.name}:size=26";
        dpi-aware = false;
        shell = "nu";
        pad = "12x6";
        box-drawings-uses-font-glyphs = false;
      };

      cursor = {
        style = "beam";
        blink = true;
        unfocused-style = "unchanged";
      };
      # tweak.box-drawing-base-thickness = "0.04";

      key-bindings = {
        scrollback-up-half-page = "page up";
        scrollback-down-half-page = "page down";
        scrollback-home = "Home";
        scrollback-end = "End";
        # search-start = "Control+/";
        # find-prev = "Control+h";
        # find-next = "Control+i";
      };
    };
  };
}
