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
      icon = "${inputs.slippi}/usr/share/icons/hicolor/512x512/apps"; # FIXME
      terminal = true;
    };

    wallpapers = {
      name = "wallpapers";
      comment = "rofi wallpaper switcher";
      exec = "${flake_dir}/stuff/scripts/bgselector";
      icon = "wallpaper";
    };
  };
}
