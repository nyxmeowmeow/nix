{ ... }: {

  services.hyprpaper = {
   enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "~/nix/themes/lix/wallpapers/1_hor.png" 
        "~/nix/themes/lix/wallpapers/1_vert.png" 
      ];

      wallpaper = [
        "DP-1, ~/nix/themes/lix/wallpapers/1_hor.png"
        "DP-3, ~/nix/themes/lix/wallpapers/1_vert.png"
      ];
    };
  };
}
