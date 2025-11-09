{
  flake_dir,
  inputs,
  config,
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

    vitetris.noDisplay = true;
    yazi.noDisplay = true;
    nvim.noDisplay = true;
    # cups.noDisplay = !(config.programs.cups.enable); # FIXME cant access this from home manager?
    btop.noDisplay = true;
    rofi-theme-selector.noDisplay = true;
    nixos-manual.noDisplay = true;

    # needs to be set
    vitetris.name = "";
    yazi.name = "";
    nvim.name = "";
    # cups.name = "";
    btop.name = "";
    rofi-theme-selector.name = "";
    nixos-manual.name = "";

    # needs to be set
    vitetris.exec = "";
    yazi.exec = "";
    nvim.exec = "";
    # cups.exec = "";
    btop.exec = "";
    rofi-theme-selector.exec = "";
    nixos-manual.exec = "";
  };
}
