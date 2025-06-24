{ lib, config, pkgs, ... }: {
  config = lib.mkIf (config.font == "iosevka") {
    stylix.fonts.monospace = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font Mono";
    };
  };
}
