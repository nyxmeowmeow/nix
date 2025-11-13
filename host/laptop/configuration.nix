{ pkgs, username, ... }: {
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = "colon three";
    extraGroups = [ "networkmanager" "wheel" "storage" "plugdev" "video" "audio" "input" "uinput" ];
    shell = pkgs.nushell;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # tell things to use wayland
    NIXPKGS_ALLOW_UNFREE = "1";
  };
  # environment.variables = {
  # };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-gnome ];


  programs.firefox.enable = true;

  system.stateVersion = "24.11";
}
