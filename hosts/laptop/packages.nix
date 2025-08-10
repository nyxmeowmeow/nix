{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    dconf
    xwayland
  ];
}
