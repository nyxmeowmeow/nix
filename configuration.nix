{ pkgs, zen-browser, nixvim, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./services.nix
    ./packages.nix
    ./modules/stylix.nix
    ./modules/kanata.nix
    ./modules/hardware.nix
    ./modules/boot.nix
    ./misc.nix
    ./nixvim/default.nix
    nixvim.nixosModules.nixvim
  ];



  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  users.users.meow = {
    isNormalUser = true;
    description = "colon three";
    extraGroups = [ "networkmanager" "wheel" "storage" "plugdev" "video" "audio" "input" "uinput" ];
    shell = pkgs.nushell;
  };



  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };


  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/meow/.steam/root/compatibilitytools.d"; # protonup install path
    NIXOS_OZONE_WL = "1"; # tell things to use wayland
    NIXPKGS_ALLOW_UNFREE = "1";
  };


  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];



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
      polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.udisks2.filesystem-mount" && subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';
  };


  environment.systemPackages = [ zen-browser.packages."x86_64-linux".default ];


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
