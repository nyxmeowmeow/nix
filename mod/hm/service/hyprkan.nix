{
  systemd.user.services.hyprkan = {
    Unit = {
      Description = "Window-Aware Layer Switcher";
      After = ["graphical-session.target"];
      Wants = ["graphical-session.target"];
    };
    Service = {
      Type = "simple";
      ExecStart = "/home/meow/.config/kanata/hyprkan";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
