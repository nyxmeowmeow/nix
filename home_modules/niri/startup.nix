{
  programs.niri.settings.spawn-at-startup = [
        "foot --server"
        "clipse -listen"
        "udiskie -a"
        "dunst"
        "walker --gapplication-service"
        "vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "steam -silent"

  ];
}
