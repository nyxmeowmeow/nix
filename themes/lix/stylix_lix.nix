{ pkgs, ... }: {

  stylix.enable = true;
  stylix.autoEnable = false; # manually specify which to enable

  # stylix.targets = {
  #   gtk.enable = true;
  #   qt.enable = true;
  # };

  stylix.base16Scheme = {
    pink = "#f5bde6";
    mauve = "#c6a0f6";
    red = "#ed8796";
    peach = "#f5a97f";
    yellow = "#eed49f";
    green = "#a6da95";
    blue = "#8aadf4";
    lavender = "#b7bdf8";
    text = "#cad3f5";
    subtext = "#a5adcb";
    overlay = "#6e738d";
    surface1 = "#494d64";
    surface = "#363a4f";
    base = "#24273a";
    mantle = "#1e2030";
    crust = "#181926";
  };


  stylix.image = ../themes/macchiato/wallpapers/1_hor.png; # must be set for some reason

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.mononoki;
      name = "Mononoki Nerd Font Mono";
    };
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
