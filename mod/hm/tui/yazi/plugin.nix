{
  programs.yazi.settings.plugin = {
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
      name = "*";
      run = "simple-tag";
    }
    {
      id = "simple-tag";
      name = "*/";
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

    # # FIXME opens up ripgrep with weird shit??
    # {
    #   name = "*.dds";
    #   run = "piper -- kitten icat \"$1\"";
    # }

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
}
