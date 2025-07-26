{ lib, theme, ... }: {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {


    wayland.windowManager.hyprland = {

      settings = {
        general = {
          gaps_in = 4;
          gaps_out = 8;
          border_size = 2;
          "col.active_border" = "rgba(b7bdf8ff)";
          "col.inactive_border" = "rgba(24273a00)";
        };



        decoration = {
          dim_special = 0;
          rounding = 10;
          shadow.enabled = false;
          blur = {
            enabled = true;
            special = false;
            size = 4;
            passes = 3;
            popups = true;
            new_optimizations = true;
            ignore_opacity = true;
            xray = false;
          };


# windowrulev2 = [
#   ];

        };

        exec = [
          "gsettings set org.gnome.desktop.interface font-name 'sn pro 10'"
            "gsettings set org.gnome.desktop.interface document-font-name 'sn pro 10'"
            "gsettings set org.gnome.desktop.interface monospace-font-name 'Mononoki Nerd Font Mono 9'"
            "gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'"
            "gsettings set org.gnome.desktop.interface font-hinting 'full'"
# "hyprctl setcursor Bibata-Modern-Classic-Transparent 20"
# "gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic-Transparent'"
# "gsettings set org.gnome.desktop.interface cursor-size 20"
            "hyprctl setcursor Bibata-Modern-Classic 20"
            "gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'"
            "gsettings set org.gnome.desktop.interface cursor-size 20"
            "gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dracula'"
            "gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-Macchiato-Standard-Lavender-Dark'"
            "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
        ];
        exec-once = [
# ncmpcpp
          "hyprctl dispatch exec '[float;size 986 1200;center;workspace special:music silent] qview ~/nix/themes/macchiato/wallpapers/7_ncmpcpp.png' && sleep 3 && hyprctl dispatch exec '[float;size 986 1200;center;workspace special:music silent] foot -c ~/.config/foot/float.ini ncmpcpp'"

# btop
            "hyprctl dispatch exec '[float;size 1600 1000;center;workspace special:btop silent] qview ~/nix/theme/macchiato/wallpapers/7_btop.png' && sleep 3 && hyprctl dispatch exec '[float;size 1600 1000;center;workspace special:btop silent] foot -c ~/.config/foot/float.ini btop'"

# tty-clock
            "hyprctl dispatch exec '[float;size 968 526;center;workspace special:clock silent] qview ~/nix/themes/macchiato/wallpapers/7_clock.png' && sleep 3 && hyprctl dispatch exec '[float;size 968 526;center;workspace special:clock silent] foot -c ~/.config/foot/float.ini tty-clock -cC 4 -f %a,\\ %d\\ %b\\ %Y'"
        ];
      };
    };
  };
}
