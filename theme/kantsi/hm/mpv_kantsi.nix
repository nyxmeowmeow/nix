{
  lib,
  theme,
  ...
}:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kantsi") {
    programs.mpv.config = {
      background-color = col.bg;
      osd-back-color = col.bg;
      osd-border-color = col.bg;
      osd-color = col.fg;
      osd-shadow-color = col.bg;

      script-opts-append = [ # TODO col without # symbol
        "stats-border_color=30201e"
        "stats-font_color=f5d3ca"
        "stats-plot_bg_border_color=f8bdb7"
        "stats-plot_bg_color=30201e"
        "stats-plot_color=f8bdb7"
        "uosc-color=foreground=c5c9c7,foreground_text=c5c9c7,background=090e13,background_text=c5c9c7,curtain=090e13,success=98bb6c,error=e46876"
      ];
    };
  };
}
