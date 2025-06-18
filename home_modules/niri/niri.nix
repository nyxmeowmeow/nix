{ pkgs, inputs, ... }: {

  imports = [
    inputs.niri.homeModules.niri 
    ./settings.nix 
    ./binds.nix 
    ./outputs.nix
    ./layout.nix
    ./animations.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite
    swaybg
  ];

  programs.niri.enable = true;
}
