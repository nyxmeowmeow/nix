{
  programs.ghostty = {
    enable = true;
  };

systemd.user.services."app-com.mitchellh.ghostty" = {
    Unit = {
      Description = "Ghostty";
      #After = [ "xdg-desktop-autostart.target" ];
      After = [
        "graphical-session.target"
        "dbus.socket"
      ];
      Requires = [ "dbus.socket" ];
    };

    Service = {
      #Type = "dbus";
      Type = "notify-reload";
      BusName = "com.mitchellh.ghostty";
      ReloadSignal = "SIGUSR2";
      ExecStart = "ghostty --gtk-single-instance=true --initial-window=false --quit-after-last-window-closed=false";
    };

    Install = {
      #WantedBy = [ "xdg-desktop-autostart.target" ];
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
