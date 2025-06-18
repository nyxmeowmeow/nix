{ niri, pkgs, ... }: {
  imports = [ niri.nixosModules.niri ];

  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    wl-clipboard
      wayland-utils
      libsecret
      cage
      gamescope
      xwayland-satellite-unstable
      swaybg
  ];


  programs.niri = {
    enable = true;
    settings = {
              input.mouse.accel-speed = 1.0;
              input.tablet.map-to-output = "eDP-1";
    };
  };
}
