{ config, ... }: {

  programs.niri.settings.binds = with config.lib.niri.actions; 
  let
    sh = spawn "sh" "-c";
  in
  {
    "Mod+G".action = spawn "~/misc/wlr-which-key";

    "Mod+T".action = spawn "footclient";
    "Mod+C".action = spawn "footclient" "yazi";
    "Mod+S".action = spawn "footclient" "nvim";


    "XF86AudioRaiseVolume".action = sh "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
    "XF86AudioLowerVolume".action = sh "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";

    "Mod+N".action = focus-monitor-next;
    "Mod+3".action = screenshot;
    "Mod+O".action = close-window;
    "Mod+Return".action = toggle-overview;

    "Mod+Space".action = spawn "walker";

    "Mod+Z".action = sh "zen -p misc";
    "Mod+Shift+Z".action = sh "zen -p rain";


    "Mod+Shift+Semicolon".action = focus-workspace "one";
    "Mod+B".action = focus-workspace "browser";
    "Mod+F".action = focus-workspace "game";
    "Mod+D".action = focus-workspace "discord";
    "Mod+W".action = focus-workspace "browser_2";
    "Mod+P".action = focus-workspace "two";

    # "Mod+Shift+B".action = move-window-to-workspace "browser";
    # "Mod+Shift+F".action = move-window-to-workspace "game";
    # "Mod+Shift+D".action = move-window-to-workspace "discord";
    # "Mod+Shift+W".action = move-window-to-workspace "browser_2";
    # "Mod+Shift+P".action = move-window-to-workspace "two";


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

    "Alt+Shift+9".action = switch-preset-window-width;
    "Alt+Shift+0".action = switch-preset-window-height;



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
