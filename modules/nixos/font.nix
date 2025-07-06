{ lib, config, pkgs, ... }: {
  # config = lib.mkMerge [
  #   (lib.mkIf (config.font == "mononoki") {
      stylix.fonts.monospace = {
        package = pkgs.nerd-fonts.mononoki;
        name = "Mononoki Nerd Font Mono";
      };
    # })

  #   (lib.mkIf (config.font == "iosevka") {
  #     stylix.fonts.monospace = {
  #       package = pkgs.nerd-fonts.iosevka;
  #       name = "Iosevka Nerd Font Mono";
  #     };
  #   })
  # ];
}
