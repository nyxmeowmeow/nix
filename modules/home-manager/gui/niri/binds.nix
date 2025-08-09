{ config, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; 
  let
    sh = spawn "dash" "-c"; # TODO change back to sh if something breaks
  in
  {
    "Mod+G".action = spawn "wlr-which-key";
    "Mod+L".action = sh "wlr-which-key ~/.config/wlr-which-key/mpc.yaml";

    # "Mod+T".action = spawn "kitty" "-1";
    # "Mod+C".action = spawn "kitty" "-1" "yazi";
    # "Mod+S".action = spawn "kitty" "-1" "nvim";

    "Mod+T".action = spawn "footclient";
    "Mod+C".action = spawn "footclient" "yazi";
    "Mod+S".action = spawn "footclient" "nvim";


    "Mod+J".action = sh "footclient tty-clock -cC 4 -f \"%a,\ %d\ %b\ %Y\""; # TODO per-theme colour
    "Mod+U".action = sh "footclient btop && niri msg action switch-preset-window-width;"; # TODO window rule for size
    "Mod+K".action = sh "footclient ncmpcpp && niri msg action switch-preset-window-width && niri msg action switch-preset-window-width"; # TODO window rule for size


    "XF86AudioRaiseVolume".action = sh "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
    "XF86AudioLowerVolume".action = sh "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";

    "Mod+N".action = focus-monitor-next;
    # "Mod+3".action = screenshot;
    # "Mod+4".action = sh "hex=$(niri msg pick-color | grep -o '#.*') && echo -n \"$hex\" | wl-copy && notify-send \"$hex\"";
    "Mod+O".action = close-window;
    "Mod+Return".action = toggle-overview;

    "Mod+Space".action = spawn "walker";

    "Mod+Z".action = sh "zen";
    "Mod+Shift+Z".action = sh "zen -p media";


    "Mod+Tab".action = focus-workspace "left";
    "Mod+B".action = focus-workspace "browser";
    "Mod+F".action = focus-workspace "game";
    "Mod+D".action = focus-workspace "discord";
    "Mod+W".action = focus-workspace "media";
    "Mod+P".action = focus-workspace "right";

    "Mod+Shift+Tab".action.move-window-to-workspace = "left";
    "Mod+Shift+B".action.move-window-to-workspace = "browser";
    "Mod+Shift+F".action.move-window-to-workspace = "game";
    "Mod+Shift+D".action.move-window-to-workspace = "discord";
    "Mod+Shift+W".action.move-window-to-workspace = "media";
    "Mod+Shift+P".action.move-window-to-workspace = "right";


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
    "Alt+A".action = move-window-down;
    "Alt+E".action = move-window-up;

    "Mod+Shift+9".action = switch-preset-window-width;
    "Mod+Shift+0".action = switch-preset-window-height;

    "Mod+M".action = maximize-column;
    "Mod+Shift+M".action = fullscreen-window;
    "Mod+Ctrl+M".action = fullscreen-window;
    "Mod+Shift+minus".action = toggle-column-tabbed-display;





  # expand-column-to-available-width
  # focus-window-previous
  # move-column-left
  # move-column-right
  # center-column
  # set-window-width
  # set-window-height
  # switch-preset-window-width
  # switch-preset-window-height
  # reset-window-height
  # maximize-column


  };
}
