{
  programs.yazi.settings.opener = {
    edit = [
    {
      run = "nvim \"$@\"";
      desc = "$EDITOR";
      block = true;
      for = "unix";
    }
    ];

    open = [
    {
      run = "xdg-open \"$1\"";
      desc = "Open";
      for = "linux";
    }
    ];

    reveal = [
    {
      run = "xdg-open '$(dirname \"$1\")'";
      desc = "Reveal";
      for = "linux";
    }
    {
      run = "exiftool \"$1\"; echo 'Press enter to exit'; read _";
      block = true;
      desc = "Show EXIF";
      for = "unix";
    } ];

    extract = [
    {
      run = "ya pub extract --list \"$@\"";
      desc = "Extract here";
      for = "unix";
    }
    ];

    play = [
    { # FIXME
      run = "mpv --force-window --resume-playback=no \"$@\"";
      orphan = true;
      for = "unix";
    }
    { run = "mediainfo \"$1\"; echo 'Press enter to exit'; read _";
      block = true;
      desc = "Show media info";
      for = "unix";
    }
    ];

    image = [
    {
      run = "swayimg \"$@\"";
      orphan = true;
      for = "unix";
    }
    ];
    krita = [
    {
      run = "krita \"$@\"";
      orphan = true;
      for = "unix";
    }
    ];
    inkscape = [
    {
      run = "inkscape \"$@\"";
      orphan = true;
      for = "unix";
    }
    ];
  };
}
