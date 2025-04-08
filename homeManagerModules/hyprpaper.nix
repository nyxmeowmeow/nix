{ config, pkgs, ... }: {
  
  services.hyprpaper = {
#    enabled = "true";
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "~Pictures/wallpapers/dithered.png" 
      ];

      wallpaper = [
        "DP-3,~Pictures/wallpapers/dithered.png"
        "DP-1,~Pictures/wallpapers/dithered.png"
      ];
    };
  };
}
