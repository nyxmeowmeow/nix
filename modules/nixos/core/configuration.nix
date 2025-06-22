{ pkgs, ... }: {



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
    DISPLAY = ":0";
  };
  environment.variables = {
    DISPLAY = ":0";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


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
}
