{ flake_dir, lib, theme, ... }: {
  config = lib.mkIf (theme == "kantsi") {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          "${flake_dir}/stuff/wallpapers/rocks_blur.png" 
        ];

        wallpaper = [
          "DP-1, ${flake_dir}/stuff/wallpapers/rocks_blur.png"
          "DP-3, ${flake_dir}/stuff/wallpapers/rocks_blur.png"
        ];
      };
    };
  };
}
