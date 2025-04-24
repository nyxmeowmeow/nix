{ config, lib, pkgs, ... }: {

  services = {
    flatpak.enable = true;

    xserver = {
      videoDrivers = [
        "amdgpu"
      ];
      displayManager = {
        gdm.enable = false;
        lightdm.enable = false;
      };
    };

    udisks2.enable = true;
    gvfs.enable = true;

    dbus.enable = true;

    printing.enable = false; # cups

    pulseaudio = {
      enable = false;
      # systemWide = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # jack.enable = true;

      ## use the example session manager (no others are packaged yet so this is enabled by default,
      ## no need to redefine it in your config for now)
      # media-session.enable = true;
    };

    mpd = {
      enable = true;
      user = "meow";
      musicDirectory = "/home/meow/Music/";
      dataDir = "/home/meow/misc/mpd";
      extraConfig = ''
        port "6669"
        audio_output {
          type "pipewire"
          name "meowwire"
        }
      '';
    };

  };

  systemd.services = {
    udiskie.enable = true;

    mpd.environment = {
      # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
      XDG_RUNTIME_DIR = "/run/user/1000"; # only worked when i manually specified 1000
    };
  };


  systemd.user.services = {
    clipse = {
      wantedBy = [ "default.target" ];
      serviceConfig.ExecStart = "${pkgs.clipse}/bin/clipse";
    };

    polkit-gnome-authentication-agent-1 = {
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

  systemd.tmpfiles.rules = [ # i cant remember what this is for
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];







}
