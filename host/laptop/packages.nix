{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    dconf
    xwayland
    fuzzel
    steam
    steam-run
  ];
}
