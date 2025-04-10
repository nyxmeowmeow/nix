{ config, pkgs, ... }: {
  
  services.hyprpaper = {
   enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "../stuff/1_hor.png" 
        "../stuff/1_vert.png" 
      ];

      wallpaper = [
        "DP-1,../stuff/1_hor.png"
        "DP-3,../stuff/1_vert.png"
      ];
    };
  };
}
