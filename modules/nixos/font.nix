{ lib, config, pkgs, ... }: {
  config = lib.mkIf (config.font == "mononoki") {
    stylix.fonts.monospace = {
      package = pkgs.nerd-fonts.mononoki;
      name = "Mononoki Nerd Font Mono";
    };
  };
}
