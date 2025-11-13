{ pkgs, ... }: {
  boot = {
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 50;
      efi.canTouchEfiVariables = true;
    };

    kernelModules = [];
    blacklistedKernelModules = [
    ];
  };
}
