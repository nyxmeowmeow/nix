{ pkgs, inputs, ... }: {
  imports = [
    inputs.niri.homeModules.niri 
    ./settings.nix 
    ./binds.nix 
    ./layout.nix
    ./animations.nix
    ./startup.nix
    ./window_rules.nix
    ./input.nix
    ./layer_rules.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite

    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-gnome
    # gnome-keyring
  ];

  # xdg.portal.configPackages = [
  #   pkgs.xdg-desktop-portal-gtk
  #   pkgs.xdg-desktop-portal-gnome
  # ];

  programs.niri.enable = true;
}
