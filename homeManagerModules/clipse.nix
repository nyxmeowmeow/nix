{ config, pkgs, ... }: {

  services.clipse = {
    imageDisplay = {
      type = "sixel";
    };
  };
}
