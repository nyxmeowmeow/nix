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
env=TERMCMD=kitty --app-id="kitty.yazi.filechooser"
  '';

  home.file.".config/xdg-desktop-portal/portals.conf".text = ''
[preferred]
org.freedesktop.impl.portal.FileChooser=termfilechooser
  '';


xdg.portal = {
    enable = true;
    
    config = {
        niri = {
            default = ["gnome" "gtk"];
            "org.freedesktop.impl.portal.Access" = "gtk";
            "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
            "org.freedesktop.impl.portal.ScreenCast" = "wlr";
            "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        };
    };
    extraPortals =  [
        pkgs.xdg-desktop-portal-termfilechooser
    ];
};

}
