{ lib, theme, ... }: {
  config = lib.mkIf (theme == "macchiato") {
  programs.mpv.config = {
      background-color = "#24273a";
      osd-back-color = "#181926";
      osd-border-color = "#181926";
      osd-color = "#cad3f5";
      osd-shadow-color = "#24273a";

      script-opts-append = [
        "stats-border_color=30201e"
        "stats-font_color=f5d3ca"
        "stats-plot_bg_border_color=f8bdb7"
        "stats-plot_bg_color=30201e"
        "stats-plot_color=f8bdb7"
        "uosc-color=foreground=cad3f5,foreground_text=363a4f,background=24273a,background_text=cad3f5,curtain=1e2030,success=a6da95,error=ed8796"
      ];
      };
      }

