{ config, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+T".action = spawn "foot"; # TODO change to footclient
    "Mod+C".action = spawn "foot" "yazi"; # TODO change to footclient
    "Mod+S".action = spawn "foot" "nvim"; # TODO change to footclient

    "Mod+N".action = focus-monitor-next;
    "Mod+3".action = screenshot;
    "Mod+O".action = close-window;

    "Mod+H".action = focus-column-left;
    "Mod+I".action = focus-column-right;
    "Mod+A".action = focus-window-down-or-top;
    "Mod+E".action = focus-window-up-or-bottom;
  };
}
