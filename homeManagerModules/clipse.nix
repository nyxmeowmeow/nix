{ config, pkgs, ... }: {

  services.clipse = {
    imageDisplay = {
      type = "kitty";
    };
  };
}
