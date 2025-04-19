{ config, pkgs, ... }: {
  programs.mpv = {
    enable = true;
    bindings = {
      h = "seek -5";
      i = "seek 5";
    };

    config = {

      background-color = "#24273a";
      osd-back-color = "#181926";
      osd-border-color = "#181926";
      osd-color = "#cad3f5";
      osd-shadow-color = "#24273a";
      osd-font = "mononoki nerd font mono";
    };
  };



}
