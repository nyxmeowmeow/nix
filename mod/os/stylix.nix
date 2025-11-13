{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = false; # manually specify which to enable

      # targets = {
      #   gtk.enable = true;
      #   qt.enable = true;
      # };


    image = ../../stuff/wallpapers/thing.png; # must be set for some reason

      # base16Scheme = {
      #   scheme = "kanso";
      #   base00 = "#ffffff";
      #   base01 = "#e3e3e3";
      #   base02 = "#b9b9b9";
      #   base03 = "#ababab";
      #   base04 = "#525252";
      #   base05 = "#464646";
      #   base06 = "#252525";
      #   base07 = "#000000";
      #   base08 = "#7c7c7c";
      #   base09 = "#999999";
      #   base0A = "#a0a0a0";
      #   base0B = "#8e8e8e";
      #   base0C = "#868686";
      #   base0D = "#686868";
      #   base0E = "#747474";
      #   base0F = "#5e5e5e";
      # };


    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };

    fonts = {
      sansSerif = {
        package = pkgs.sn-pro;
        name = "sn pro";
      };
      serif = {
        package = pkgs.sn-pro;
        name = "sn pro";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
