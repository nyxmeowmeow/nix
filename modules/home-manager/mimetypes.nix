{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "image/jpeg" = ["qview" "krita" "aseprite"];
      "image/jpg" = ["qview" "krita" "aseprite"];
      "image/png" = ["qview" "krita" "aseprite"];
      "audio/mpeg" = ["mpv"];
      "video/mp3" = ["mpv"];
      "video/mp4" = ["mpv"];
      "video/quicktime" = ["mpv"];
      "video/webm" = ["mpv"];
    };
    defaultApplications = {
      "application/json" = ["nvim"];
      "application/toml" = "nvim";
      "audio/*" = ["mpv"];
      "audio/mp3" = ["mpv"];
      "image/*" = ["qview" "krita" "aseprite"];
      "image/jpg" = ["qview" "krita" "aseprite"];
      "image/png" = ["qview" "krita" "aseprite"];
      "text/plain" = "nvim";
      "video/*" = ["mpv"];
      "video/mp4" = ["mpv"];
    };
  };
  userDirs = {
    enable = true;
    createDirectories = true;
  };
}
