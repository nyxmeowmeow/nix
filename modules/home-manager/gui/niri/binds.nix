{ config, lib, wm, ... }: {
  config = lib.mkIf (wm == "niri") {
    programs.niri.settings.binds = with config.lib.niri.actions; 
    let
      sh = spawn "dash" "-c"; # TODO change back to sh if something breaks
    in {
        "Mod+G".action = spawn "wlr-which-key";
        "Mod+L".action = sh "wlr-which-key ~/.config/wlr-which-key/mpc.yaml";

# "Mod+T".action = spawn "kitty" "-1";
# "Mod+C".action = spawn "kitty" "-1" "yazi";
# "Mod+S".action = spawn "kitty" "-1" "nvim";

        "Mod+T".action = spawn "footclient";
        "Mod+Shift+T".action = spawn "foot";
        "Mod+C".action = spawn "footclient" "yazi";
        "Mod+S".action = spawn "footclient" "nvim";

        "Mod+X".action = sh "niri msg action expand-column-to-available-width";


        # "Mod+J".action = sh "pkill tty-clock || footclient tty-clock -cC 4 -f \"%a,\ %d\ %b\ %Y\""; # TODO per-theme colour
          "Mod+U".action = sh "pkill btop || footclient btop"; # TODO window rule for size
          "Mod+K".action = sh "pkill ncmpcpp || footclient ncmpcpp"; # TODO window rule for size


          "XF86AudioRaiseVolume".action = sh "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume".action = sh "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";

        "Mod+N".action = focus-monitor-next;
# "Mod+3".action = screenshot;
# "Mod+4".action = sh "hex=$(niri msg pick-color | grep -o '#.*') && echo -n \"$hex\" | wl-copy && notify-send \"$hex\"";
        "Mod+O".action = close-window;
        "Mod+Return".action = toggle-overview;

# "Mod+Space".action = sh "walker --theme min";
        "Mod+Space".action = spawn "fuzzel";
        "Mod+Slash".action = sh "rofi -show window";

        "Mod+Z".action = sh "zen";
        "Mod+Shift+Z".action = sh "zen -p media";


        "Mod+comma".action = focus-workspace "left";
        "Mod+period".action = focus-workspace "right";
        "Mod+Tab".action = focus-workspace "media";
        "Mod+B".action = focus-workspace "discord";
        "Mod+F".action = focus-workspace "one";
        "Mod+D".action = focus-workspace "two";
        "Mod+W".action = focus-workspace "three";
        "Mod+P".action = focus-workspace "four";

        "Mod+Shift+comma".action = sh "niri msg action move-window-to-workspace --focus=false left";
        "Mod+Shift+period".action = sh "niri msg action move-window-to-workspace --focus=false right";
        "Mod+Shift+Tab".action = sh "niri msg action move-window-to-workspace --focus=false media";
        "Mod+Shift+B".action = sh "niri msg action move-window-to-workspace --focus=false discord";
        "Mod+Shift+F".action = sh "niri msg action move-window-to-workspace --focus=false one";
        "Mod+Shift+D".action = sh "niri msg action move-window-to-workspace --focus=false two";
        "Mod+Shift+W".action = sh "niri msg action move-window-to-workspace --focus=false three";
        "Mod+Shift+P".action = sh "niri msg action move-window-to-workspace --focus=false four";
        "Mod+Shift+N".action = sh "niri msg action move-window-to-workspace --focus=false alt";


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

        "Mod+9".action = switch-preset-window-width;
        "Mod+0".action = switch-preset-window-height;
        "Mod+Shift+9".action = switch-preset-window-width-back;
        "Mod+Shift+0".action = switch-preset-window-height-back;

        "Mod+M".action = maximize-column;
        "Mod+Shift+M".action = fullscreen-window;
        "Mod+Ctrl+M".action = fullscreen-window;
        "Mod+minus".action = toggle-column-tabbed-display;





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
  };
}
