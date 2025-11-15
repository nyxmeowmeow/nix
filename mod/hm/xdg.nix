{ config, ... }: {
  xdg.userDirs = {
    enable = true;

    download = config.home.homeDirectory + "/dl";
    documents = config.home.homeDirectory + "/doc";
    music = config.home.homeDirectory + "/music";
    pictures = config.home.homeDirectory + "/pic";
    videos = config.home.homeDirectory + "/vid";
    desktop = null;
    extraConfig = {
      XDG_GAMES_DIR = config.home.homeDirectory + "/games";
      XDG_MISC_DIR = config.home.homeDirectory + "/misc";
    };
  };
}
