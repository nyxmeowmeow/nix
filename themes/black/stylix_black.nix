{ pkgs, ... }: {

  stylix.enable = true;
  stylix.autoEnable = false; # manually specify which to enable

  # stylix.targets = {
  #   gtk.enable = true;
  #   qt.enable = true;
  # };

  stylix.base16Scheme = {
    base00 = "#000000";
    base01 = "#181926";
    base02 = "#1e2030";
    base03 = "#363a4f";
    base04 = "#494d64";
    base05 = "#6e738d";
    base07 = "#a5adcb"; # subtext
    base06 = "#cad3f5"; # text
    base08 = "#b7bdf8"; # lavender
    base09 = "#8aadf4"; # blue
    base0A = "#c6a0f6"; # mauve
    base0B = "#f5bde6"; # pink
    base0C = "#ed8796"; # red
    base0D = "#f5a97f"; # peach
    base0E = "#eed49f"; # yellow
    base0F = "#a6da95"; # green
  };


  stylix.image = ../macchiato/wallpapers/1_hor.png; # must be set for some reason

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic $";
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
