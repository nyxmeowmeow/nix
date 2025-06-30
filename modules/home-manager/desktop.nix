{ username, ... }: {
  xdg.desktopEntries = {
    melee = {
      name = "melee";
      comment = "melee bash script";
      exec = "/home/${username}/nix/stuff/scripts";
      icon = "slippi-launcher";
      terminal = true;
    };
  };
}
