{
  services = {
    openssh.enable = true;

    xserver.enable = true;
    dbus.enable = true;
    xserver.displayManager.lightdm.enable = false;
  };
}
