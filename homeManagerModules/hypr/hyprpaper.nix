{ ... }: {

  services.hyprpaper = {
   enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "~/nix/stuff/1_hor.png" 
        "~/nix/stuff/1_vert.png" 
        "~/nix/stuff/2_hor.png" 
      ];

      wallpaper = [
        "DP-1,~/nix/stuff/2_hor.png"
        "DP-3,~/nix/stuff/1_vert.png"
      ];
    };
  };
}
