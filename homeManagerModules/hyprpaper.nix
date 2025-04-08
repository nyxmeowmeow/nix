{ config, pkgs, ... }: {
  
  services.hyprpaper = {
   enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "~Pictures/wallpapers/buildings1b.png" 
        "~Pictures/wallpapers/buildings2b.png" 
      ];

      wallpaper = [
        "DP-3,~Pictures/wallpapers/buildings1b.png"
        "DP-1,~Pictures/wallpapers/buildings2b.png"
      ];
    };
  };
}
