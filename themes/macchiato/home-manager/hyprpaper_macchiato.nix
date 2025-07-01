{ lib, theme, ... }: {
  config = lib.mkIf (theme == "macchiato") {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          "~/nix/stuff/wallpapers/pixel7.jpg" 
          "~/nix/stuff/wallpapers/pixel7.jpg" 
        ];

        wallpaper = [
          "DP-1, ~/nix/stuff/wallpapers/pixel7.jpg"
          "DP-3, ~/nix/stuff/wallpapers/pixel7.jpg"
        ];
      };
    };
  };
}
