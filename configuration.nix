{ pkgs, zen-browser, nixvim, ... }: {

  theme = "black";

  imports = [
    ./hardware-configuration.nix
    ./services.nix
    ./packages.nix
    ./themes/theme.nix
    ./modules/kanata.nix
    ./modules/security.nix
    ./modules/hardware.nix
    ./modules/languages.nix
    ./modules/boot.nix
    ./modules/steam.nix
    ./modules/stylix.nix
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

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/meow/.steam/root/compatibilitytools.d"; # protonup install path
    NIXOS_OZONE_WL = "1"; # tell things to use wayland
    NIXPKGS_ALLOW_UNFREE = "1";
  };


  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

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
