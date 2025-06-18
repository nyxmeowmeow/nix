{ pkgs, inputs, ... }: {

  imports = [
    inputs.niri.homeModules.niri 
    # ./settings.nix 
    # ./binds.nix 
    # ./rules.nix
  ];

    home.packages = with pkgs; [
      xwayland-satellite
      swaybg
    ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
}
