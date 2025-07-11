{ config, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        font = "${config.stylix.fonts.monospace.name}:size=26";
        # font = "/home/meow/iosevka/Iosevka/dist/IosevkaCustom/TTF/IosevkaCustom-Regular.ttf:size=26";
        # font = "Mononoki Nerd Font Mono:size=26";
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
      tweak.box-drawing-base-thickness = "0.04";
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
