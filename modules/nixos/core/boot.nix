{ pkgs, ... }: {

  boot = {
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 50;
      efi.canTouchEfiVariables = true;
    };
    # initrd.kernelModules = [ "amdgpu" ];
    kernelModules = [ "amdgpu" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest; # pkgs.linuxPackages_zen;
    kernelParams = [
      "video=DP-1:2560x1440@165"
      "video=DP-3:2560x1440@75"
    ];
    blacklistedKernelModules = [
      "bluetooth"
      "vivaldi_fmap"
      "battery"

    ];
  };
}
