{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "image/jpeg" = ["qview"];
      "image/jpg" = ["qview"];
      "image/png" = ["qview"];
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
      "image/*" = ["qview"];
      "image/jpg" = ["qview"];
      "image/png" = ["qview"];
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
