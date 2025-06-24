{ pkgs, ... }: {

  stylix.enable = true;
  stylix.autoEnable = false; # manually specify which to enable

  # stylix.targets = {
  #   gtk.enable = true;
  #   qt.enable = true;
  # };


  stylix.image = ../../themes/macchiato/wallpapers/1_hor.png; # must be set for some reason

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };

  stylix.fonts = {
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
}
