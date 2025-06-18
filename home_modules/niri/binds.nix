{ config, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+T".action = spawn "footclient";
    "Mod+C".action = spawn "footclient" "yazi";
    "Mod+S".action = spawn "footclient" "nvim";

    "Mod+N".action = focus-monitor-next;
    "Mod+3".action = screenshot;
    "Mod+O".action = close-window;
    "Mod+Return".action = toggle-overview;

    "Mod+Space".action = spawn "walker";

    "Mod+Z".action = spawn "zen" "-p" "misc";
    "Mod+Shift+Z".action = spawn "zen";

    "Mod+B".action = focus-workspace "browser";
    "Mod+F".action = focus-workspace "game";
    "Mod+D".action = focus-workspace "discord";
    "Mod+W".action = focus-workspace "browser_2";

    "Mod+H".action = focus-column-left;
    "Mod+I".action = focus-column-right;
    "Mod+A".action = focus-window-down-or-top;
    "Mod+E".action = focus-window-up-or-bottom;

    "Mod+Shift+H".action = consume-or-expel-window-left;
    "Mod+Shift+I".action = consume-or-expel-window-right;
    "Mod+Shift+A".action = move-window-down;
    "Mod+Shift+E".action = move-window-up;

    "Alt+H".action = swap-window-left;
    "Alt+I".action = swap-window-right;

# expand-column-to-available-width
  };
}
