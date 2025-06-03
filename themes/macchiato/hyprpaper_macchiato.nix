{

  services.hyprpaper = {
   enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "~/nix/themes/macchiato/wallpapers/7_hor.png" 
        "~/nix/themes/macchiato/wallpapers/1_vert.png" 
      ];

      wallpaper = [
        "DP-1, ~/nix/themes/macchiato/wallpapers/7_hor.png"
        "DP-3, ~/nix/themes/macchiato/wallpapers/1_vert.png"
      ];
    };
  };
}
