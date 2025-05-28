{ ... }: {

  services.hyprpaper = {
   enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "~/nix/themes/black/wallpapers/1_hor.png" 
      ];

      wallpaper = [
        "DP-1, ~/nix/themes/black/wallpapers/1_hor.png" 
        "DP-3, ~/nix/themes/black/wallpapers/1_hor.png" 
      ];
    };
  };
}
