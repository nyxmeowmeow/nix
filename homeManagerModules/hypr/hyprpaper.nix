{ ... }: {

  services.hyprpaper = {
   enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "~/nix/stuff/7_hor.jpg" 
        "~/nix/stuff/1_vert.png" 
      ];

      wallpaper = [
        "DP-1,~/nix/stuff/7_hor.jpg"
        "DP-3,~/nix/stuff/1_vert.png"
      ];
    };
  };
}
