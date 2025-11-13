{ flake_dir, lib, theme, ... }: {
  config = lib.mkIf (theme == "macchiato") {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          "${flake_dir}/stuff/wallpapers/pixel7.jpg" 
          "${flake_dir}/stuff/wallpapers/pixel7.jpg" 
        ];

        wallpaper = [
          "DP-1, ${flake_dir}/stuff/wallpapers/pixel7.jpg"
          "DP-3, ${flake_dir}/stuff/wallpapers/pixel7.jpg"
        ];
      };
    };
  };
}
