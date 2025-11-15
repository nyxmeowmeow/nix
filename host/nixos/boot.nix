{
  pkgs,
  ...
}: {
# TODO limine
  boot = {
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 50;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      "video=DP-1:2560x1440@165"
      "video=DP-3:2560x1440@75"
    ];

    # initrd.kernelModules = [];
    kernelModules = [ "amdgpu" ];
    blacklistedKernelModules = [

      # "battery"

      /* ps2 */
      # "vivaldi_fmap"
      # "atkbd"
      # "libps2"
      # "serio"
      # "i8042"

      /* bluetooth */
      "bluetooth"
      "btrtl"
      "btmtk"
      "btintel"
      "btbcm"
      "btusb"
    ];
  };
}
