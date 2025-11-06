{
  pkgs,
  username,
  ...
}: {
  virtualisation.docker.enable = true;

  services = {
    flatpak.enable = false;

    xserver = {
      videoDrivers = [
        "amdgpu"
      ];
      displayManager.lightdm.enable = false;
    };


    dbus.enable = true;

    printing.enable = false; # cups
  };



  systemd.user.services = {
    clipse = {
      wantedBy = [ "default.target" ];
      serviceConfig.ExecStart = "${pkgs.clipse}/bin/clipse";
    };

    # polkit-gnome-authentication-agent-1 = {
    #   description = "polkit-gnome-authentication-agent-1";
    #   wantedBy = [ "graphical-session.target" ];
    #   wants = [ "graphical-session.target" ];
    #   after = [ "graphical-session.target" ];
    #   serviceConfig = {
    #     Type = "simple";
    #     ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    #     Restart = "on-failure";
    #     RestartSec = 1;
    #     TimeoutStopSec = 10;
    #   };
    # };
  };

  systemd.tmpfiles.rules = [ # i cant remember what this is for
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];



}
