{ lib, theme, ... }: {
  config = lib.mkIf (theme == "everforest_hard" || theme == "everforest_medium" || theme == "everforest_soft") {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          "~/nix/themes/everforest/wallpapers/1_hor.jpg" 
        ];

        wallpaper = [
          "DP-1, ~/nix/themes/everforest/wallpapers/1_hor.jpg"
            "DP-3, ~/nix/themes/lix/wallpapers/2_hor.png"
        ];
      };
    };
  };
}
