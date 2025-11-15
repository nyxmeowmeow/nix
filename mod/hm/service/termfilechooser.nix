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

  home.file.".config/xdg-desktop-portal-termfilechooser/config".text = ''
[filechooser]
cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
default_dir=$HOME
env=TERMCMD=foot --app-id="foot.yazi.filechooser"
  '';


  # xdg.portal = {
  #   enable = true;
  #
  #   config = {
  #     common = {
  #       default = ["termfilechooser"];
  #       "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
  #     };
  #     niri = {
  #       default = ["termfilechooser"];
  #       "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
  #     };
  #   };
  #
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-termfilechooser
  #   ];
  # };
}
