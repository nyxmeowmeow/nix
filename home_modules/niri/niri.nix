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
  ];

  home.packages = with pkgs; [
    xwayland-satellite
    swaybg
  ];

  programs.niri.enable = true;
}
