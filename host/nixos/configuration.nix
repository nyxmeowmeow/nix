{
  pkgs,
  username,
  ...
}: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = "colon three";
    extraGroups = [
      "networkmanager"
      "wheel"
      "storage"
      "plugdev"
      "video"
      "audio"
      "input"
      "uinput"
    ];
    shell = pkgs.nushell;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # tell things to use wayland
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xdg-desktop-portal-termfilechooser
    ];
    config = {
      common = {
        default = ["termfilechooser"];
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
      };
      niri = {
        default = ["termfilechooser"];
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
      };
    };
  };

  system.stateVersion = "24.11";
}
