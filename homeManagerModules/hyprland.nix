{ config, pkgs, ... }: {

  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   x11.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Classic";
  #   size = 20;
  # };
  #
  # gtk = {
  #   enable = true;
  #
  #   theme = {
  #     package = pkgs.catppuccin-gtk;
  #     name = "catppuccin-gtk";
  #   };
  #
  #   iconTheme = {
  #     # package = pkgs.gnome.adwaita-icon-theme;
  #     name = "Tela Circle Dracula";
  #   };
  #
  #   font = {
  #     name = "sn pro";
  #     size = 11;
  #   };
  # };



  wayland.windowManager.hyprland = {
    settings = {
      "$scrPath" = "~/.local/share/bin";
      "$scripts" = "~/nix/stuff/scripts";
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
        "hyprctl dispatch exec '[workspace special:music silent] foot -c ~/.config/foot/float.ini'"
        "hyprctl dispatch exec '[float;size 1000 1200;center;workspace special:music silent] qview ~/nix/stuff/1_float.png'"
        "hyprctl dispatch exec '[workspace special:2 silent] foot -c ~/.config/foot/float.ini /home/meow/nix/stuff/scripts/keyb0xx.sh'"
        "hyprctl dispatch exec '[workspace special:2 silent] foot -c ~/.config/foot/blur.ini sudo kanata -nc /home/meow/.config/kanata/symbols.kbd -p 10000'"
        "hyprctl dispatch exec '[workspace special:2 silent] foot -c ~/.config/foot/blur.ini cd nata && ./nata.sh -c config.json'"
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
        hide_on_key_press = "false"; # set to false to make tablet cursor stay visible
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
          enabled = "true";
          special = "false";
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
        "SUPER,       r, exec, $scripts/dontkillsteam.sh"
        "SUPER CTRL,  r, exec, hyprctl kill"
        "SUPER CTRL SHIFT, r, exec, hyprctl dispatch killactive ''"  # bypass dontkillsteam exceptions"
        "SUPER,       n, exec, $scripts/swap.sh"
        "SUPER, k, togglesplit"
        "SUPER,       y, togglefloating"
        # "SUPER SHIFT, p, exec, hyprctl dispatch centerwindow"
        "SUPER,       2, exec, foot --hold hyprprop"
        # "SUPER SHIFT, 2, exec, foot --hold hyprctl clients"
        "SUPER CTRL,  2, exec, notify-send $(hyprctl cursorpos)"
        "SUPER,       4, exec, $scripts/hextoimg.sh"  # hyprpicker

        # TODO: doesnt work using $scripts
        "SUPER,       3, exec, $scrPath/screenshot.sh s"  # screenshot capture
        # TODO: doesnt work using $scripts
        "SUPER CTRL,  3, exec, $scrPath/screenshot.sh sf"  # screenshot capture (frozen screen)

        "SUPER,       t, exec, foot"
        "SUPER,       s, exec, foot bash -c yazi" # launch yazi from fish to get correct fzf theme

        "SUPER,       f, exec, zen -p rain"
        "SUPER SHIFT, f, exec, zen -p rain2"
        "SUPER,       c, exec, foot bash nvim"
        "SUPER SHIFT, c, exec, foot bash nvim -c 'lua require('persistence').load()'"
        "SUPER CTRL,  c, exec, $scripts/open-recent-dl.sh" # open most recently downloaded file with nvim
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
        "SUPER SHIFT, comma,      movetoworkspacesilent,   special"
        "SUPER SHIFT, period,     movetoworkspacesilent,   special:2"
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

        "float,class:^(footfloatme)$"
        "center,class:^(footfloatme)$"
        "size 1000 1200,class:^(footfloatme)$"
        "noblur,class:^(footfloatme)$"

        "float,class:^(clipse)$"
        "center,class:^(clipse)$"
        "size 1000 1200,class:^(clipse)$"
        "noblur,class:^(clipse)$"

        "suppressevent fullscreen,class:^(krita)$"
        "stayfocused,title:^(Create new document — Krita)$"
        "stayfocused,title:^(Saving As — Krita)$"
        "noblur,class:^(foot)$"
        "noblur,class:^(vesktop)$"
        "noblur,class:^(zen-beta)$"

        "workspace special:2,title:(keyb0xx.sh)$"
        "workspace special:2,class:^(Slippi Launcher)$"
        "workspace special:2 silent,class:^(Apprun)$"
        "workspace 3,title:^(Dolphin)$"
        "workspace 4 silent,class:^(vesktop)$"

        "tile,initialTitle:^(Hammer)"

        "tile,title:(Godot Engine)"
        "tile,initialtitle:(Godot)"
        "minsize 600 600,title:^(Editor Settings)$"
        "center,title:^(Editor Settings)$"
        "minsize 812 812,title:^(Create New Node)$"
        "center,title:^(Create New Node)$"
        "minsize 600 600,title:^(Instantiate Child Scene)$"
        "center,title:^(Instantiate Child Scene)$"
        "minsize 600 600,title:^(Command Palette)$"
        "center,title:^(Command Palette)$"
        "minsize 600 600,title:(Project Settings)$"
        "center,title:(Project Settings)$"

        # misc

        "rounding 0,title:(ELDEN RING)$"


        # melee

        "center,title:^(Dolphin)$"
        "size 2560 1440,title:^(Dolphin)$"
        "minsize 2560 1440,title:^(Dolphin)$"
        "rounding 0,title:^(Dolphin)$"
        "noborder,title:^(Dolphin)$"
        "float,title:^(Dolphin)$"
        "immediate,title:^(Dolphin)$"

        # momentum mod (set size in steam launch options not window rules or it shits itself)

        "center,class:^(chaos)$"
        "rounding 0,class:^(chaos)$"
        "noborder,class:^(chaos)$"
        "float,class:^(chaos)$"
        "immediate,class:^(chaos)$"

        # trackmania

        "center,title:^(Trackmania)$"
        "size 2560 1080,title:^(Trackmania)$"
        "minsize 2560 1080,title:^(Trackmania)$"
        "rounding 0,title:^(Trackmania)$"
        "noborder,title:^(Trackmania)$"
        "float,title:^(Trackmania)$"
        "immediate,title:^(Trackmania)$"

        # battlebit remastered

        "center,class:^(steam_app_671860)$"
        "rounding 0,class:^(steam_app_671860)$"
        "noborder,class:^(steam_app_671860)$"
        "float,class:^(steam_app_671860)$"
        "immediate,class:^(steam_app_671860)$"

        # ultrakill

        "center,class:^(steam_app_1229490)$"
        "size 2560 1080,class:^(steam_app_1229490)$"
        "minsize 2560 1080,class:^(steam_app_1229490)$"
        "rounding 0,class:^(steam_app_1229490)$"
        "noborder,class:^(steam_app_1229490)$"
        "float,class:^(steam_app_1229490)$"
        "immediate,class:^(steam_app_1229490)$"

        # balatro

        "rounding 0,class:^(steam_app_2379780)$"

        # terraria

        "center,class:^(dotnet)$"
        "size 2560 1440,class:^(dotnet)$"
        "minsize 2560 1440,class:^(dotnet)$"
        "rounding 0,class:^(dotnet)$"
        "noborder,class:^(dotnet)$"
        "float,class:^(dotnet)$"
        "immediate,class:^(dotnet)$"

        # poly bridge

        "center,title:^(Poly Bridge)$"
        "size 2560 1440,title:^(Poly Bridge)$"
        "minsize 2560 1440,title:^(Poly Bridge)$"
        "rounding 0,title:^(Poly Bridge)$"
        "noborder,title:^(Poly Bridge)$"
        "float,title:^(Poly Bridge)$"

      ];
      layerrule = [
        "blur, walker"
        "ignorezero, walker"
      ];
    };


    # no nix way to do this :(
    extraConfig = ''
      bind = SUPER, p, submap, player

      # will start a submap called "player"
      submap = player

      # play/pause mpd
      bind = ,      t, exec, playerctl play-pause
      bind = SUPER, t, exec, playerctl play-pause
      bind = ,      t, submap, reset

      # play/pause firefox
      bind = ,      s, exec, mpc -p 6669 toggle
      bind = SUPER, s, exec, mpc -p 6669 toggle
      bind = ,      s, submap, reset

      # previous mpd song
      bind = ,      h, exec, mpc -p 6669 prev
      bind = SUPER, h, exec, mpc -p 6669 prev
      bind = ,      h, submap, reset

      # next mpd song
      bind = ,      i, exec, mpc -p 6669 next
      bind = SUPER, i, exec, mpc -p 6669 next
      bind = ,      i, submap, reset

      # mpd -vol
      bind = ,      a, exec, mpc -p 6669 volume -5
      bind = SUPER, a, exec, mpc -p 6669 volume -5

      # mpd +vol
      bind = ,      e, exec, mpc -p 6669 volume +5
      bind = SUPER, e, exec, mpc -p 6669 volume +5

      # restart current song
      bind = ,      r, exec, mpc -p 6669 prev
      bind = SUPER, r, exec, mpc -p 6669 prev
      bind = ,      r, exec, mpc -p 6669 next
      bind = SUPER, r, exec, mpc -p 6669 next
      bind = ,      r, submap, reset











      bind = ,      p, submap, play_song
      bind = SUPER, p, submap, play_song
      submap = play_song



      bind = ,      v, exec, mpc -p 6669 searchplay title 'violet'
      bind = SUPER, v, exec, mpc -p 6669 searchplay title 'violet'
      bind = ,      v, submap, reset

      bind = ,      s, exec, mpc -p 6669 searchplay title 'Salt'
      bind = SUPER, s, exec, mpc -p 6669 searchplay title 'Salt'
      bind = ,      s, submap, reset

      bind = ,      p, exec, mpc -p 6669 searchplay title 'phoenix'
      bind = SUPER, p, exec, mpc -p 6669 searchplay title 'phoenix'
      bind = ,      p, submap, reset



      bind = ,      d, submap, d
      bind = SUPER, d, submap, d
      submap = d

          bind = ,      a, exec, mpc -p 6669 searchplay title 'daydreamer'
          bind = SUPER, a, exec, mpc -p 6669 searchplay title 'daydreamer'
          bind = ,      a, submap, reset

          bind = ,      o, exec, mpc -p 6669 searchplay title 'downfall'
          bind = SUPER, o, exec, mpc -p 6669 searchplay title 'downfall'
          bind = ,      o, submap, reset

      bind = , escape, submap, reset
      submap = play_song



      bind = ,      n, submap, n
      bind = SUPER, n, submap, n
      submap = n

          bind = ,      o, exec, mpc -p 6669 searchplay title 'nothing nothing nothing'
          bind = SUPER, o, exec, mpc -p 6669 searchplay title 'nothing nothing nothing'
          bind = ,      o, submap, reset

          bind = ,      e, exec, mpc -p 6669 searchplay title 'newlove'
          bind = SUPER, e, exec, mpc -p 6669 searchplay title 'newlove'
          bind = ,      e, submap, reset

      bind = , escape, submap, reset
      submap = play_song




      bind = ,      h, submap, h
      bind = SUPER, h, submap, h
      submap = h

          bind = ,      s, exec, mpc -p 6669 searchplay title 'homeswitcher'
          bind = SUPER, s, exec, mpc -p 6669 searchplay title 'homeswitcher'
          bind = ,      s, submap, reset

          bind = ,      o, exec, mpc -p 6669 searchplay title 'how to save a life'
          bind = SUPER, o, exec, mpc -p 6669 searchplay title 'how to save a life'
          bind = ,      o, submap, reset

          bind = ,      a, exec, mpc -p 6669 searchplay title 'i hate everything about you'
          bind = SUPER, a, exec, mpc -p 6669 searchplay title 'i hate everything about you'
          bind = ,      a, submap, reset

      bind = , escape, submap, reset
      submap = play_song



      bind = ,      t, submap, t
      bind = SUPER, t, submap, t
      submap = t

          bind = ,      h, exec, mpc -p 6669 searchplay title '3 nights'
          bind = SUPER, h, exec, mpc -p 6669 searchplay title '3 nights'
          bind = ,      h, submap, reset


          bind = ,      a, exec, mpc -p 6669 searchplay title 'ta1lsd004'
          bind = SUPER, a, exec, mpc -p 6669 searchplay title 'ta1lsd004'
          bind = ,      a, submap, reset

      bind = , escape, submap, reset
      submap = play_song



      bind = ,      a, submap, a
      bind = SUPER, a, submap, a
      submap = a

          bind = ,      s, exec, mpc -p 6669 searchplay title 'ascension to heaven'
          bind = SUPER, s, exec, mpc -p 6669 searchplay title 'ascension to heaven'
          bind = ,      s, submap, reset

          bind = ,      b, exec, mpc -p 6669 searchplay title 'absolute in doubt'
          bind = SUPER, b, exec, mpc -p 6669 searchplay title 'absolute in doubt'
          bind = ,      b, submap, reset

      bind = , escape, submap, reset
      submap = play_song


      bind = ,      m, submap, m
      bind = SUPER, m, submap, m
      submap = m

          bind = ,      i, exec, mpc -p 6669 searchplay title 'midnight'
          bind = SUPER, i, exec, mpc -p 6669 searchplay title 'midnight'
          bind = ,      i, submap, reset

          bind = ,      y, exec, mpc -p 6669 searchplay title 'miss you'
          bind = SUPER, y, exec, mpc -p 6669 searchplay title 'miss you'
          bind = ,      y, submap, reset

      bind = , escape, submap, reset
      submap = play_song

      bind = ,      k, exec, mpc -p 6669 searchplay title 'mr. kill myself'
      bind = SUPER, k, exec, mpc -p 6669 searchplay title 'mr. kill myself'
      bind = ,      k, submap, reset

      bind = ,      z, exec, mpc -p 6669 searchplay title 'zen garden'
      bind = SUPER, z, exec, mpc -p 6669 searchplay title 'zen garden'
      bind = ,      z, submap, reset

      bind = ,      b, exec, mpc -p 6669 searchplay title 'The Breach'
      bind = SUPER, b, exec, mpc -p 6669 searchplay title 'The Breach'
      bind = ,      b, submap, reset

      bind = ,      l, exec, mpc -p 6669 searchplay title 'LosT'
      bind = SUPER, l, exec, mpc -p 6669 searchplay title 'LosT'
      bind = ,      l, submap, reset

      bind = ,      r, exec, mpc -p 6669 searchplay title 'R.i.p.'
      bind = SUPER, r, exec, mpc -p 6669 searchplay title 'R.i.p.'
      bind = ,      r, submap, reset

      bind = ,      t, exec, mpc -p 6669 searchplay title 'Throne'
      bind = SUPER, t, exec, mpc -p 6669 searchplay title 'Throne'
      bind = ,      t, submap, reset


      bind = , escape, submap, reset
      submap = player



      # use reset to go back to the global submap
      bind = , escape, submap, reset

      # reset if any other key pressed
      bind = , catchall, submap, reset

      # will reset the submap, which will return to the global submap
      submap = reset



    '';
  };







}
