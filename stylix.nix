{ config, pkgs, ... }: {

  stylix.enable = true;
  stylix.autoEnable = false; # manually specify which to enable

  stylix.targets = {
      gtk.enable = true;
      qt.enable = true;
  };

  # stylix.base16Scheme = {
  #   rosewater = "#f4dbd6";
  #   flamingo = "#f0c6c6";
  #   pink = "#f5bde6";
  #   mauve = "#c6a0f6";
  #   red = "#ed8796";
  #   maroon = "#ee99a0";
  #   peach = "#f5a97f";
  #   yellow = "#eed49f";
  #   green = "#a6da95";
  #   teal = "#8bd5ca";
  #   sky = "#91d7e3";
  #   sapphire = "#7dc4e4";
  #   blue = "#8aadf4";
  #   lavender = "#b7bdf8";
  #   text = "#cad3f5";
  #   subtext1 = "#b8c0e0";
  #   subtext0 = "#a5adcb";
  #   subtext = "#a5adcb";
  #   overlay2 = "#939ab7";
  #   overlay1 = "#8087a2";
  #   overlay0 = "#6e738d";
  #   overlay = "#6e738d";
  #   surface2 = "#5b6078";
  #   surface1 = "#494d64";
  #   surface0 = "#363a4f";
  #   surface = "#363a4f";
  #   base = "#24273a";
  #   mantle = "#1e2030";
  #   crust = "#181926";
  # };

  stylix.image = ./stuff/1_hor.png; # must be set for some reason

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
