{
  programs.yazi = {
    settings = {
      mgr = {
        ratio          = [ 0 3 4 ];
        sort_by        = "natural";
        sort_sensitive = false;
        sort_reverse 	 = false;
        sort_dir_first = true;
        sort_translit  = false;
        linemode       = "none";
        show_hidden    = true;
        show_symlink   = true;
        scrolloff      = 10;
        mouse_events   = [];
        title_format   = "Yazi: {cwd}";
      };

      preview = {
        tab_size        = 2;
        max_width       = 2560;
        max_height      = 1440;
        cache_dir       = "";
        image_delay     = 0;
        image_filter    = "triangle";
        image_quality   = 85;
        sixel_fraction  = 1;
        ueberzug_scale  = 1;
        ueberzug_offset = [ 0 0 0 0 ];
      };


      input = {
        cursor_blink = false;

# cd
        cd_title  = "";
        cd_origin = "center";
        cd_offset = [ 0 0 50 3 ];

# create
        create_title  = [ "" "" ];
        create_origin = "center";
        create_offset = [ 0 0 50 3 ];

# rename
        rename_title  = "";
        rename_origin = "hovered";
        rename_offset = [ 0 1 50 3 ];

# filter
        filter_title  = "";
        filter_origin = "center";
        filter_offset = [ 0 0 50 3 ];

# find
        find_title  = [ "" "" ];
        find_origin = "center";
        find_offset = [ 0 0 50 3 ];

# search
        search_title  = " {n} ";
        search_origin = "center";
        search_offset = [ 0 0 50 3 ];

# shell
        shell_title  = [ "" "" ];
        shell_origin = "center";
        shell_offset = [ 0 0 50 3 ];

        confirm = {
# trash
          trash_title 	= " Trash {n} selected file{s}? ";
          trash_origin	= "center";
          trash_offset	= [ 0 0 70 20 ];

# delete
          delete_title 	= " PERMANENTLY delete {n} selected file{s}? ";
          delete_origin	= "center";
          delete_offset	= [ 0 0 70 20 ];

# overwrite
          overwrite_title   = " Overwrite file? ";
          overwrite_content = "Will overwrite the following file:";
          overwrite_origin  = "center";
          overwrite_offset  = [ 0 0 50 15 ];

# quit
          quit_title   = " Quit? ";
          quit_content = "The following tasks are still running, are you sure you want to quit?";
          quit_origin  = "center";
          quit_offset  = [ 0 0 50 15 ];
        };

        pick = {
          open_title  = "";
          open_origin = "hovered";
          open_offset = [ 0 1 50 7 ];
        };

        which = {
          sort_by      	 = "none";
          sort_sensitive = false;
          sort_reverse 	 = false;
          sort_translit  = false;
        };




        opener = {
          edit = [ {
            run = "nvim \"$@\"";
            desc = "$EDITOR";
            block = true;
            for = "unix";
          } ];

          open = [ {
            run = "xdg-open \"$1\"";
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
          } ];

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

          icat = [ {
            run = "kitten icat \"$@\"";
            orphan = true;
            for = "unix";
          } ];

          image = [ {
            run = "swayimg \"$@\"";
            orphan = true;
            for = "unix";
          } ];

          krita = [ {
            run = "krita \"$@\"";
            orphan = true;
            for = "unix";
          } ];
          inkscape = [ {
            run = "inkscape \"$@\"";
            orphan = true;
            for = "unix";
          } ];
        };



        open = {
          rules = [
          {
            name = "*.gif";
            use = [ "image" "play" "reveal" ];
          }

          {
            name = "*.png";
            use = [ "image" "krita" "reveal" ];
          }

          {
            name = "*.jpg";
            use = [ "image" "krita" "reveal" ];
          }

          {
            name = "*.jpeg";
            use = [ "image" "krita" "reveal" ];
          }

          {
            name = "*.svg";
            use = [ "image" "inkscape" "edit" "reveal" ];
          }

          {
            name = "*.kra*";
            use = [ "krita" "reveal" ];
          }

# Folder
          {
            name = "*/";
            use = [ "edit" "open" "reveal" ];
          }

# Text
          {
            mime = "text/*";
            use = [ "edit" "reveal" ];
          }

# Image
          {
            mime = "image/*";
            use = [ "open" "reveal" ];
          }

# Media
          {
            mime = "{audio; ideo}/*";
            use = [ "play" "reveal" ];
          }

# Archive
          {
            mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
            use = [ "extract" "reveal" ];
          }

# JSON
          {
            mime = "application/{json, djson}";
            use = [ "edit" "reveal" ];
          }

          {
            mime = "*/javascript";
            use = [ "edit" "reveal" ];
          }

# Empty file
          {
            mime = "inode/empty";
            use = [ "edit" "reveal" ];
          }

# Fallback
          {
            name = "*";
            use = [ "open" "reveal" ];
          }
          ];

          tasks = {
            micro_workers    = 10;
            macro_workers    = 10;
            bizarre_retry    = 3;
            image_alloc      = 536870912; # 512MB
              image_bound      = [ 0 0 ];
            suppress_preload = false;
          };


          plugin = {

            fetchers = [
# Mimetype
            {
              id = "mime";
              name = "*";
              run = "mime";
              prio = "high";
            }

            {
              id   = "git";
              name = "*";
              run  = "git";
            }

            {
              id   = "git";
              name = "*/";
              run  = "git";
            }

            {
              id = "simple-tag";
              url = "*";
              run = "simple-tag";
            }
            {
              id = "simple-tag";
              url = "*/";
              run = "simple-tag";
            }


            ];

            spotters = [
            {
              name = "*/";
              run = "folder";
            }

# Code
            {
              mime = "text/*";
              run = "code";
            }

            {
              mime = "application/{mbox,javascript,wine-extension-ini}";
              run = "code";
            }

# Image
            {
              mime = "image/{avif,hei?,jxl,svg+xml}";
              run = "magick";
            }

            {
              mime = "image/*";
              run = "image";
            }

# Video
            {
              mime = "video/*";
              run = "video";
            }

# Fallback
            {
              name = "*";
              run = "file";
            }
            ];

            preloaders = [
# Image
            {
              mime = "image/{avif,hei?,jxl,svg+xml}";
              run = "magick";
            }

            {
              mime = "image/*";
              run = "image";
            }

# Video
            {
              mime = "video/*";
              run = "video";
            }

# PDF
            {
              mime = "application/pdf";
              run = "pdf";
            }

# Font
            {
              mime = "font/*";
              run = "font";
            }

            {
              mime = "application/ms-opentype";
              run = "font";
            }
            ];

            previewers = [
            {
              name = "*/";
              run = "folder";
              sync = true;
            }

# Code
            {
              mime = "text/*";
              run = "code";
            }

            {
              mime = "application/{mbox,javascript,wine-extension-ini}";
              run = "code";
            }

# JSON
            {
              mime = "application/{json,ndjson}";
              run = "json";
            }

# Image
            {
              mime = "image/{avif,hei?,jxl,svg+xml}";
              run = "magick";
            }

            # FIXME
            {
              name = "*.dds";
              run = "icat";
            }

            {
              mime = "image/*";
              run = "image";
            }

# Video
            {
              mime = "video/*";
              run = "video";
            }

# PDF
            {
              mime = "application/pdf";
              run = "pdf";
            }

# Archive
            {
              mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
              run = "archive";
            }

            {
              mime = "application/{debian*-package,redhat-package-manager,rpm,android.package-archive}";
              run = "archive";
            }

# { name = "*.{AppImage,appimage}", run = "archive" },

            {
              name = "*.{AppImage,appimage}";
              run = "appimaged";
            }

# Virtual Disk / Disk Image
            {
              mime = "application/{iso9660-image,qemu-disk,ms-wim,apple-diskimage}";
              run = "archive";
            }

            {
              mime = "application/virtualbox-{vhd,vhdx}";
              run = "archive";
            }

            {
              name = "*.{img,fat,ext,ext2,ext3,ext4,squashfs,ntfs,hfs,hfsx}";
              run = "archive";
            }

# Font
            {
              mime = "font/*";
              run = "font";
            }

            {
              mime = "application/ms-opentype";
              run = "font";
            }

# Empty file
            {
              mime = "inode/empty";
              run = "empty";
            }

# Fallback
            {
              name = "*";
              run = "file";
            }
            ];
          };
        };
      };
    };
  };
}
