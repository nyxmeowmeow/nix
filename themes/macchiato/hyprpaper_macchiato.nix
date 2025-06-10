{ lib, theme, ... }: {
  config = lib.mkIf (theme == "macchiato") {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          "~/nix/themes/macchiato/wallpapers/4_hor.jpg" 
            "~/nix/themes/macchiato/wallpapers/1_vert.png" 
        ];

        wallpaper = [
          "DP-1, ~/nix/themes/macchiato/wallpapers/4_hor.jpg"
            "DP-3, ~/nix/themes/macchiato/wallpapers/1_vert.png"
        ];
      };
    };
  };
}
