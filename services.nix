{ config, lib, pkgs, ... }: {

  services.flatpak.enable = true;

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  services.xserver.displayManager = {
    gdm.enable = false;
    lightdm.enable = false;
  };

  services.udisks2.enable = true;
  systemd.services.udiskie.enable = true;
  services.gvfs.enable = true;

  services.dbus.enable = true;

  systemd.user.services.clipse = {
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.clipse}/bin/clipse";
  };



  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];


  services.printing.enable = true; # cups

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;

    ## use the example session manager (no others are packaged yet so this is enabled by default,
    ## no need to redefine it in your config for now)
    # media-session.enable = true;
  };


}
