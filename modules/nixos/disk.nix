{ pkgs, ... }: {
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  systemd.services.udiskie.enable = true;


  environment.systemPackages = with pkgs; [
    udiskie
    udisks2
    gvfs
  ];
}
