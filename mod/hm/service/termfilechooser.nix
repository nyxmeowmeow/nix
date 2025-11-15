{ pkgs, ... }: {
  systemd.user.services.xdg-desktop-portal-termfilechooser = {
    Unit = {
      Description = "Portal service (terminal file chooser implementation)";
      After = ["graphical-session.target"];
      Wants = ["graphical-session.target"];
    };
    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.impl.portal.desktop.termfilechooser";
      ExecStart = "${pkgs.xdg-desktop-portal-termfilechooser}/libexec/xdg-desktop-portal-termfilechooser";
      Restart = "on-failure";
      RestartSec = 3;
    };
  };
}
