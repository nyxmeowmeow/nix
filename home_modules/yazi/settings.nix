{

  programs.yazi = {
    settings = {
      mgr = {
        ratio          = [ 1 3 4 ];
        sort_by        = "natural";
        sort_sensitive = false;
        sort_reverse 	 = false;
        sort_dir_first = true;
        sort_translit  = false;
        linemode       = "none";
        show_hidden    = true;
        show_symlink   = true;
        scrolloff      = 5;
        mouse_events   = [ "click" "scroll" ];
        title_format   = "Yazi: {cwd}";
      };

      preview = {
        tab_size        = 2;
        max_width       = 600;
        max_height      = 900;
        cache_dir       = "";
        image_delay     = 0;
        image_filter    = "triangle";
        image_quality   = 75;
        sixel_fraction  = 15;
        ueberzug_scale  = 1;
        ueberzug_offset = [ 0 0 0 0 ];
      };

      opener = {
        edit = [ {
          run = "nvim \"$@\"";
          desc = "$EDITOR";
          block = true;
          for = "unix";
        } ];

        open = [ {
          run = "xdg-open '$1'";
          desc = "Open";
          for = "linux";
        } ];

        reveal = [
        {
          run = "xdg-open '$(dirname \"$1\")'";
          desc = "Reveal";
          for = "linux";
        }
        {
          run = "exiftool '$1'; echo 'Press enter to exit'; read _";
          block = true;
          desc = "Show EXIF";
          for = "unix";
        } ];

        extract = [
        {
          run = "ya pub extract --list '$@'";
          desc = "Extract here";
          for = "unix";
        } ];

        play = [
        {
          run = "mpv --force-window '$@'";
          orphan = true;
          for = "unix";
        }
        { run = "mediainfo '$1'; echo 'Press enter to exit'; read _";
          block = true;
          desc = "Show media info";
          for = "unix";
        }
        ];

        qview = [ {
          run = "qview '$@'";
          orphan = true;
          for = "unix";
        } ];

        krita = [ {
          run = "krita '$@'";
          orphan = true;
          for = "unix";
        } ];
      };
    };
  };
}
