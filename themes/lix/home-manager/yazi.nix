{ lib, theme, ... }:
let
col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "lix") {
    programs.yazi.theme = {
      mgr = {
        cwd.fg = col.fg;

        find_keyword  = {
          fg = col.bubblegum;
          bold = true;
          italic = false;
          underline = false;
        };

        find_position = {
          fg = "magenta";
          bg = "reset";
          bold = true;
          italic = true;
        };

        marker_copied = {
          fg = col.mint;
          bg = col.mint;
        };

        marker_cut = {
          fg = col.red;
          bg = col.red;
        };

# visual select
        marker_marked = {
          fg = col.violet;
          bg = col.violet;
        };

# one at a time
        marker_selected = {
          fg = col.blue;
          bg = col.blue;
        };


        count_copied = {
          fg = col.bg;
          bg = col.mint;
        };

        count_cut = {
          fg = col.bg;
          bg = col.red;
        };

        count_selected = {
          fg = col.bg;
          bg = col.blue;
        };

# TODO
# Highlighting
# syntect_theme = ""
      };
      status = {

        progress_label.bold = true;
        progress_normal = {
          fg = col.pink;
          bg = col.bg;
        };
        progress_error = {
          fg = col.red;
          bg = col.bg;
        };

        perm_sep.fg = col.bg_fade;
        perm_typef.fg = col.mint;
        perm_readf.fg = col.gold;
        perm_writef.fg = col.bubblegum;
        perm_execf.fg = col.mint;
      };
      filetype = {

        rules = [
# Images
        {
          mime = "image/*";
          fg = col.gold;
        }

# Media
        {
          mime = "{audio,video}/*";
          fg = col.violet;
        }

# Archives
        {
          mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
          fg = col.bubblegum;
        }

# Documents
        {
          mime = "application/{pdf,doc,rtf}";
          fg = col.blue;
        }

# Empty files
# { mime = "inode/empty", fg = "red" },

# Special files
        {
          name = "*";
          is = "orphan";
          bg = col.red;
        }

        {
          name = "*";
          is = "exec";
          fg = col.mint;
        }

# Dummy files
        { name = "*";
          is = "dummy";
          bg = col.red;
        }
        {
          name = "*/"; is = "dummy";
          bg = col.red;
        }

# Fallback
        {
          name = "*";
          fg = col.fg;
        }
        {
          name = "*/";
          fg = col.pink;
        }
        ];



      };
    };
  };
}
