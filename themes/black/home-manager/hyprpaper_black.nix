{ flake_dir, lib, theme, ... }: {
  config = lib.mkIf (theme == "black") {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          "${flake_dir}/stuff/wallpapers/shaded_citadel.png" 
        ];

        wallpaper = [
          "DP-1, ${flake_dir}/stuff/wallpapers/shaded_citadel.png" 
          "DP-3, ${flake_dir}/stuff/wallpapers/shaded_citadel.png" 
        ];
      };
    };
  };
}
