{ pkgs, inputs, ... }: {

  imports = [
    inputs.niri.homeModules.niri 
    ./settings.nix 
    ./binds.nix 
    ./outputs.nix
    ./layout.nix
    ./animations.nix
    ./startup.nix
    ./window_rules.nix
    ./input.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite

    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-gnome
    # gnome-keyring
  ];

  programs.niri.enable = true;
}
