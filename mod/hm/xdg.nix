{
  config,
  ...
}:
let
  h = config.home.homeDirectory;
in {
  xdg.userDirs = {
    enable = true;

    download = h + "/dl";
    documents = h + "/doc";
    music = h + "/music";
    pictures = h + "/pic";
    videos = h + "/vid";
    desktop = null;

    extraConfig = {
      XDG_GAMES_DIR = h + "/games";
      XDG_MISC_DIR = h + "/misc";
    };
  };
}
