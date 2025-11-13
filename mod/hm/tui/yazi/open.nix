{
  programs.yazi.settings = {
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
    };
  };
}
