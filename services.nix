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


  services.mpd = {
    enable = true;
    user = "meow";
    musicDirectory = "/home/meow/Music/";
    dataDir = "/home/meow/misc/mpd";
    extraConfig = ''
      port "6669"
      audio_output {
        type "alsa"
        name "meowalsa"
        mixer_type		"hardware"
        mixer_device	"default"
        mixer_control	"PCM"
      }
    '';
  };

  # systemd.services.mpd.environment = {
  #   # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
  #   XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.meow.uid}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
  # };

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
