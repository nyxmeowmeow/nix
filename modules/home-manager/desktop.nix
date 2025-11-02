{
  flake_dir,
  inputs,
  ...
}: {
  xdg.desktopEntries = {
    melee = {
      name = "melee";
      comment = "melee bash script";
      exec = "${flake_dir}/stuff/scripts/melee.sh";
      icon = "${flake_dir}/stuff/icons/slippi.svg";
      terminal = true;
    };

    wallpapers = {
      name = "wallpapers";
      comment = "rofi wallpaper switcher";
      exec = "${flake_dir}/stuff/scripts/bgselector";
      icon = "${flake_dir}/stuff/icons/wallpaper.svg";
    };
  };
}
