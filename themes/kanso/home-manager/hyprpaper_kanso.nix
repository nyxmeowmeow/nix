{ flake_dir, lib, theme, ... }: {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          # "${flake_dir}/stuff/wallpapers/clouds.jpg" 
          "${flake_dir}/stuff/wallpapers/underwater.jpg" 
        ];

        wallpaper = [
          "DP-1, ${flake_dir}/stuff/wallpapers/underwater.jpg"
          "DP-3, ${flake_dir}/stuff/wallpapers/underwater.jpg"
        ];
      };
    };
  };
}
