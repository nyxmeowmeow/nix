{ config, pkgs, ... }: {


  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  # Optional, hint Electron apps to use Wayland:
  home.sessionVariables.NIXOS_OZONE_WL = "1";





#  home.pointerCursor = {
#    gtk.enable = true;
#    x11.enable = true;
#    package = pkgs.bibata-cursors;
#    name = "Bibata-Modern-Classic";
#    size = 20;
#  };

 gtk = {
   enable = true;

  theme = {
     package = pkgs.catppuccin-gtk;
     name = "catppuccin-gtk";
   };

   # iconTheme = {
   #   package = pkgs.gnome.adwaita-icon-theme;
   #   name = "Adwaita";
   # };

   font = {
     name = "Sans";
     size = 11;
   };
 };












  wayland.windowManager.hyprland.settings = {
    "$scrPath" = "~/.local/share/bin";

    "$moveactivewindow" = "grep -q 'true' <<< $(hyprctl activewindow -j | jq -r .floating) && hyprctl dispatch moveactive";
    exec = [
      "gsettings set org.gnome.desktop.interface font-name 'Cantarell 10'"
      "gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 10'"
      "gsettings set org.gnome.desktop.interface monospace-font-name 'Mononoki Nerd Font Mono 9'"
      "gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'"
      "gsettings set org.gnome.desktop.interface font-hinting 'full'"
      "hyprctl setcursor Bibata-Modern-Classic-Transparent 20"
      "gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic-Transparent'"
      "gsettings set org.gnome.desktop.interface cursor-size 20"
      "gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dracula'"
      "gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-macchiato-lavender-standard+default'"
      "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
    ];
    exec-once = [
      "clipse -listen"
      "udiskie -a"
      "dunst"
      "hyprpaper"
      "walker --gapplication-service"
      "vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"
      "steam -silent"
      "systemctl --user start hyprpolkitagent"
    ];
    monitor = [
      "DP-1, 2560x1440@165, 0x0, 1"
      "DP-3, 2560x1440@75, -2880x486, 1, transform, 3"
    ];
    env = [
      "PATH,$PATH:$scrPath"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_QPA_PLATFORMTHEME,qt6ct"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "MOZ_ENABLE_WAYLAND,1"
      "GDK_SCALE,1"
      "XCURSOR_SIZE,20"
      #"MANGOHUD,1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION=1"
      "QT_AUTO_SCREEN_SCALE_FACTOR=1"
      "QT_QPA_PLATFORM=wayland;xcb"
      "XDG_CURRENT_DESKTOP=Hyprland"
      "XDG_SESSION_TYPE=wayland"
      "XDG_SESSION_DESKTOP=Hyprland"
      "GDK_BACKEND=wayland,x11"
      "QT_QPA_PLATFORM=wayland,xcb"
      "SDL_VIDEODRIVER=wayland"
      "CLUTTER_BACKEND=wayland"
    ];
    input = {
      follow_mouse = "1";
      numlock_by_default = "true";
      #scroll_factor = "1.5";
      repeat_delay = "15000"; # delay before a held-down key is repeated, in milliseconds
      repeat_rate = "20";  # repeat rate for held-down keys, in repeats per seconds
      sensitivity = "0";
      force_no_accel = "1";
    };
    cursor = {
      hide_on_key_press = "true";
      inactive_timeout = "1";
    };
    xwayland = {
      force_zero_scaling = "true";
    };
    general = {
      allow_tearing = "true";
      resize_on_border = "false";
      gaps_in = "0";
      gaps_out = "0";
      border_size = "2";
      "col.active_border" = "rgba(b7bdf8ff)";
      "col.inactive_border" = "rgba(24273aff)";
      layout = "dwindle";
    };
    dwindle = {
      pseudotile = "true";
      preserve_split = "true";
      split_width_multiplier = "1";
      split_bias = "2";
      force_split = "2";
    };
    decoration = {
      dim_special = "0";
      rounding = "0";
      shadow = {
        enabled = "false";
      };
      blur = {
        enabled = "false";
        special = "true";
        size = "6";
        passes = "3";
        new_optimizations = "on";
        ignore_opacity = "on";
        xray = "false";
      };
    };

    animations.enabled = "false";
    workspace = [
      "1, monitor:DP-1"
      "2, monitor:DP-1"
      "3, monitor:DP-1"
      "4, monitor:DP-1"
      "5, monitor:DP-1"
      "6, monitor:DP-1"
      "7, monitor:DP-1"
      "8, monitor:DP-1"
      "9, monitor:DP-3"
    ];
    bind = [
      
      "SUPER CTRL SHIFT,   Delete, exit"  # kill hyprland session
      "SUPER SHIFT,  Return, fullscreen"
      # "SUPER,       r, exec, $scrPath/dontkillsteam.sh"
      "SUPER,       r, exec, hyprctl dispatch killactive ''"
      "SUPER CTRL,  r, exec, hyprctl kill"
      "SUPER CTRL SHIFT, r, exec, hyprctl dispatch killactive ''"  # bypass dontkillsteam exceptions"
      "SUPER,       n, exec, $scrPath/swap.sh"
      "SUPER, k, togglesplit"
      # "SUPER,       p, togglefloating"
      # "SUPER SHIFT, p, exec, hyprctl dispatch centerwindow"
      "SUPER,       2, exec, foot --hold hyprprop"
      # "SUPER SHIFT, 2, exec, foot --hold hyprctl clients"
      "SUPER CTRL,  2, exec, notify-send $(hyprctl cursorpos)"
      "SUPER,       4, exec, /home/meow/bin/hextoimg.sh"  # hyprpicker
      "SUPER,       3, exec, $scrPath/screenshot.sh s"  # screenshot capture
      "SUPER CTRL,  3, exec, $scrPath/screenshot.sh sf"  # screenshot capture (frozen screen)

      "SUPER,       t, exec, foot"
      "SUPER,       s, exec, foot fish -c yazi" # launch yazi from fish to get correct fzf theme

      "SUPER, f, exec, firefox"
      # "SUPER,       f, exec, zen-browser -p rain"
      # "SUPER SHIFT, f, exec, zen-browser -p rain2"
      "SUPER,       c, exec, foot nvim"
      "SUPER SHIFT, c, exec, foot nvim -c 'lua require('persistence').load()'"
      "SUPER CTRL,  c, exec, ~/bin/open-recent-dl.sh" # open most recently downloaded file with nvim
      "SUPER,  return, exec, walker -s 3 -m applications,calc"
      "SUPER,  apostrophe, exec, walker -s 3 -m catppuccin"


      # ", XF86AudioMute,        exec, $scrPath/volumecontrol.sh -o m"
      # ", XF86AudioMicMute,     exec $scrPath/volumecontrol.sh -i m"
      ", XF86AudioPlay,        exec, $scrPath/playpause.sh"
      ", XF86AudioPause,       exec, $scrPath/playpause.sh"
      ", XF86AudioNext,        exec, playerctl next"
      ", XF86AudioPrev,        exec, playerctl previous"


      "SUPER, V, exec, foot -a clipse -e fish -c clipse -fc $fish_pid"
      # "SUPER, V, exec, pkill -x rofi || $scrPath/cliphist.sh c" # launch clipboard


      "SUPER, Tab,    workspace,                 1"
      "SUPER, b,      workspace,                 2"
      "SUPER, l,      workspace,                 3"
      "SUPER, d,      workspace,                 4"
      "SUPER, w,      workspace,                 5"
      "SUPER, comma,  togglespecialworkspace"
      "SUPER, period, togglespecialworkspace,    2"
      "SUPER, m,      togglespecialworkspace,    music"

      "SUPER SHIFT, n,          movetoworkspacesilent,   9"
      "SUPER SHIFT, Tab,        movetoworkspacesilent,   1"
      "SUPER SHIFT, b,          movetoworkspacesilent,   2"
      "SUPER SHIFT, l,          movetoworkspacesilent,   3"
      "SUPER SHIFT, d,          movetoworkspacesilent,   4"
      "SUPER SHIFT, w,          movetoworkspacesilent,   5"
      "SUPER SHIFT, comma,      movetoworkspacesilent,   special:2"
      "SUPER SHIFT, period,     movetoworkspacesilent,   special"
      "SUPER SHIFT, m,          movetoworkspacesilent,   special:music"


      "SUPER, h, movefocus, l"
      "SUPER, a, movefocus, d"
      "SUPER, e, movefocus, u"
      "SUPER, i, movefocus, r"




    ];
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
    binde = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"

      "SUPER CTRL, h, resizeactive, -50 0"     # left
      "SUPER CTRL, a, resizeactive, 0 50"      # down
      "SUPER CTRL, e, resizeactive, 0 -50"     # up
      "SUPER CTRL, i, resizeactive, 50 0"      # right

    ];
    bindel = [
      ", XF86AudioNext, exec, ddcutil setvcp 10 + 5"
      ", XF86AudioPrev, exec, ddcutil setvcp 10 - 5"

      # ", XF86AudioLowerVolume, exec, $scrPath/volumecontrol.sh -o d"
      # ", XF86AudioRaiseVolume, exec, $scrPath/volumecontrol.sh -o i"
    ];
    binded = [

      "SUPER SHIFT, h,Move activewindow to the right,exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow l"
      "SUPER SHIFT, a,Move activewindow to the right,exec, $moveactivewindow 0 30 || hyprctl dispatch movewindow d"
      "SUPER SHIFT, e,Move activewindow to the right,exec, $moveactivewindow  0 -30 || hyprctl dispatch movewindow u"
      "SUPER SHIFT, i,Move activewindow to the right,exec, $moveactivewindow 30 0 || hyprctl dispatch movewindow r"
      ];



    windowrulev2 = [
      "nofocus, title:^(Remux Recordings)$"
      "float, class:^(clipse)$"
    ];
  };







}
