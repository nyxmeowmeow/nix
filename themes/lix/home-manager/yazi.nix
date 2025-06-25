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
          mime = "application/{pdf,doc;rtf}";
          fg = col.blue;
        }

# Empty files
# { mime = "inode/empty" fg = "red" }

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
        {
          name = "*";
          is = "dummy";
          bg = col.red;
          fg = col.bg;
        }
        {
          name = "*/";
          is = "dummy";
          bg = col.red;
          fg = col.bg;
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
      icon = {
        dirs = [
          { name = ".config"; text = ""; }
          { name = "Desktop"; text = ""; }
          { name = "Documents"; text = ""; }
          { name = "Downloads"; text = ""; }
          { name = "Music"; text = ""; }
          { name = "Pictures"; text = ""; }
          { name = "Videos"; text = ""; }
        ];

        files = [
          { name = "nix"; text = "󱄅"; fg = col.blue; }
          { name = "css"; text = ""; fg = col.blue; }
          { name = "html"; text = ""; fg = col.bubblegum; } #TODO orange
          { name = "yaml"; text = ""; fg = col.fg; }
          { name = "json"; text = ""; fg = col.fg; }
          { name = "toml"; text = ""; fg = col.bubblegum; }
          { name = "desktop"; text = ""; fg = col.violet; }
          { name = "js"; text = ""; fg = col.peach; }
          { name = "rs"; text = ""; fg = col.red; }
          { name = "py"; text = ""; fg = col.peach; }
          { name = "c"; text = ""; fg = col.blue; }
          { name = "c++"; text = ""; fg = col.violet; }
          { name = "cpp"; text = ""; fg = col.violet; }
          { name = "cp"; text = ""; fg = col.violet; }
          { name = "zig"; text = ""; fg = col.peach; }
          { name = "hs"; text = ""; fg = col.violet; }
          { name = "git"; text = ""; fg = col.peach; } #TODO orange
          { name = ".git-blame-ignore-revs"; text = ""; fg = col.bubblegum; } #TODO orange
          { name = ".gitattributes"; text = ""; fg = col.bubblegum; } #TODO orange
          { name = ".gitignore"; text = ""; fg = col.bubblegum; } #TODO orange
          { name = ".gitmodules"; text = ""; fg = col.bubblegum; } #TODO orange
          { name = "lock"; text = ""; fg = col.fg; }
          { name = "txt"; text = ""; fg = col.fg; }
          { name = "png"; text = ""; fg = col.gold; }
          { name = "webp"; text = ""; fg = col.gold; }
          { name = "jpg"; text = ""; fg = col.gold; }
          { name = "jpeg"; text = ""; fg = col.gold; }
          { name = "gif"; text = ""; fg = col.gold; }
          { name = "ico"; text = ""; fg = col.gold; }
          { name = "svg"; text = "󰜡"; fg = col.gold; }
          { name = "vtf"; text = ""; fg = col.gold; }
          { name = "vmt"; text = ""; fg = col.fg; }
          { name = "mp4"; text = ""; fg = col.violet; }
          { name = "mkv"; text = ""; fg = col.violet; }
          { name = "mov"; text = ""; fg = col.violet; }
          { name = "mp3"; text = ""; fg = col.violet; }
          { name = "ogg"; text = ""; fg = col.violet; }
          { name = "opus"; text = ""; fg = col.violet; }
          { name = "flac"; text = ""; fg = col.violet; }
          { name = "wav"; text = "󱑽"; fg = col.violet; }
          { name = "nu"; text = ""; fg = col.mint; }
          { name = "sh"; text = ""; fg = col.mint; }
          { name = "bash"; text = ""; fg = col.mint; }
          { name = "zsh"; text = ""; fg = col.mint; }
          { name = "fish"; text = ""; fg = col.mint; }
          { name = "bat"; text = ""; fg = col.bubblegum; }
          { name = "exe"; text = ""; fg = col.bubblegum; }
          { name = "dll"; text = "󱉟"; fg = col.bubblegum; }
          { name = "iso"; text = ""; fg = col.fg; }
          { name = "kra"; text = ""; fg = col.pink; }
          { name = "kra~"; text = ""; fg = col.fg; }
          { name = "xml"; text = "󰗀"; fg = col.fg; }
          { name = "md"; text = ""; fg = col.fg; }
          { name = "license"; text = ""; fg = col.gold; }
          { name = "license.md"; text = ""; fg = col.gold; }
          { name = "org"; text = ""; fg = col.mint; }
          { name = "gz"; text = "󰗄"; fg = col.gold; }
          { name = "xz"; text = "󰗄"; fg = col.gold; }
          { name = "zip"; text = "󰗄"; fg = col.gold; }
          # { name = "swift"; text = ""; fg = "#e37933"; } #TODO orange
          # { name = "svelte"; text = ""; fg = "#ff3e00"; } #TODO orange
          { name = "db"; text = ""; fg = col.fg; }
          { name = "sql"; text = ""; fg = col.fg; }
          { name = "sqlite"; text = ""; fg = col.fg; }
          { name = "sqlite3"; text = ""; fg = col.fg; }
          { name = "dump"; text = ""; fg = col.fg; }
          { name = "bsp"; text = ""; fg = col.fg; }
          { name = "vmf"; text = ""; fg = col.fg; }
          { name = "vmx"; text = ""; fg = col.fg; }


        ];

        conds = [
# Special files
          { "orphan" = ""; }
          { "link" = ""; }
          { "block" = ""; }
          { "char" = ""; }
          { "fifo" = ""; }
          { "sock" = ""; }
          { "sticky" = ""; }
          { "dummy" = ""; }

# Fallback
          { "dir" = ""; }
          { "exec" = ""; }
          { "!dir" = ""; }
        ];
      };
    };
  };
}
