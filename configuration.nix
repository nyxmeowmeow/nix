# { config, pkgs, zen-browser, ... }: {
{ pkgs, zen-browser, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./services.nix
    ./packages.nix
    ./modules/stylix.nix
    ./modules/kanata.nix
    ./misc.nix
  ];


  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd.kernelModules = [ "amdgpu" ];
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "video=DP-1:2560x1440@165"
      "video=DP-3:2560x1440@75"
    ];
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  users.users.meow = {
    isNormalUser = true;
    description = "meow";
    extraGroups = [ "networkmanager" "wheel" "storage" "plugdev" "video" "audio" ];
    shell = pkgs.nushell;
    # packages = with pkgs; [
    #   user package
    # ];
  };



  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.gamemode.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      libva
      libvdpau-va-gl
      vulkan-loader
      vulkan-validation-layers
      mesa.opencl  # Enables Rusticl (OpenCL) support
      rocmPackages.clr.icd
    ];
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/meow/.steam/root/compatibilitytools.d"; # protonup install path
    NIXOS_OZONE_WL = "1"; # tell things to use wayland
    NIXPKGS_ALLOW_UNFREE = "1";
  };


  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  security.rtkit.enable = true;

  security.sudo.extraRules = [
    {
      users = [ "meow" ];
      commands = [
        { # rebuild no passwd
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
        { # kanata no passwd
          command = "/run/current-system/sw/bin/kanata";
          options = [ "NOPASSWD" ];
        }
        { # keyb0xx no passwd
          command = "/run/current-system/sw/bin/steam-run /home/meow/misc/keyb0xx";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];


  security.polkit = {
    enable = true;
    extraConfig = ''
      /* Allow members of the 'wheel' group to mount devices via Nautilus */
      polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.udisks2.filesystem-mount" && subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';
  };


  environment.systemPackages = [
    zen-browser.packages."x86_64-linux".default 
  ];


  programs.fish.enable = true;
  programs.firefox.enable = true;
  programs.obs-studio.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;

    # This is needed for Slippi to run.
    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.curl
        pkgs.libmpg123
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11";
}
