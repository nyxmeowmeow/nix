{ lib, theme, ... }: {
  config = lib.mkIf (theme == "ocean") {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          "~/nix/themes/ocean/wallpapers/2_hor.png" 
        ];

        wallpaper = [
          "DP-1, ~/nix/themes/ocean/wallpapers/2_hor.png"
            "DP-3, ~/nix/themes/ocean/wallpapers/2_hor.png"
        ];
      };
    };
  };
                     }
