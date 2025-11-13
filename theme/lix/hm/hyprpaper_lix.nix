{ flake_dir, lib, theme, ... }: {
  config = lib.mkIf (theme == "lix") {

    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          "~/nix/stuff/wallpapers/outskirts.png" 
        ];

        wallpaper = [
          "DP-1, ${flake_dir}/stuff/wallpapers/outskirts.png"
          "DP-3, ${flake_dir}/stuff/wallpapers/outskirts.png"
        ];
      };
    };
  };
}
