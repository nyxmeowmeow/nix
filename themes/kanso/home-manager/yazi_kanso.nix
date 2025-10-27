{ lib, theme, ... }:
let
col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen" || theme == "kantsi") {
    programs.yazi.theme = {
      mgr = {
        cwd.fg = col.fg;

        find_keyword  = {
          fg = col.violet;
          bold = true;
          italic = false;
          underline = false;
        };

        find_position = {
          fg = col.violet;
          bg = "reset";
          bold = true;
          italic = true;
        };

        marker_copied = {
          fg = col.green;
          bg = col.green;
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
          fg = col.zen_bg0;
          bg = col.green;
        };

        count_cut = {
          fg = col.zen_bg0;
          bg = col.red;
        };

        count_selected = {
          fg = col.zen_bg0;
          bg = col.blue;
        };

# TODO
# Highlighting
# syntect_theme = ""
      };
      status = {

        progress_label.bold = true;
        progress_normal = {
          fg = col.fg;
          bg = col.zen_bg0;
        };
        progress_error = {
          fg = col.red;
          bg = col.zen_bg0;
        };

        perm_sep.fg = col.zen_bg3;
        perm_typef.fg = col.green;
        perm_readf.fg = col.yellow2;
        perm_writef.fg = col.red2;
        perm_execf.fg = col.green;
      };
      filetype = {

        rules = [
# Images
        {
          mime = "image/*";
          fg = col.yellow2;
        }

# Media
        {
          mime = "{audio,video}/*";
          fg = col.violet;
        }

# Archives
        {
          mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
          fg = col.red;
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
          fg = col.green;
        }

# Dummy files
        {
          name = "*";
          is = "dummy";
          bg = col.red;
          fg = col.zen_bg0;
        }
        {
          name = "*/";
          is = "dummy";
          bg = col.red;
          fg = col.zen_bg0;
        }

# Fallback
        {
          name = "*";
          fg = col.fg;
        }
        {
          name = "*/";
          fg = col.blue;
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
          { name = ".bash_profile"; text = ""; fg = col.fg; }
          { name = ".bashrc"; text = ""; fg = col.fg; }
          { name = ".gtkrc-2.0"; text = ""; fg = col.fg; }
          { name = ".Xresources"; text = ""; fg = col.fg; }
          { name = "license"; text = ""; fg = col.yellow2; }
          # { name = "LICENSE"; text = ""; fg = col.yellow2; }
          { name = "license.md"; text = ""; fg = col.yellow2; }
          # { name = "LICENSE.md"; text = ""; fg = col.yellow2; }
          { name = "readme"; text = "󰂺"; fg = col.fg; }
          { name = "readme.md"; text = "󰂺"; fg = col.fg; }
          { name = "readme.txt"; text = "󰂺"; fg = col.fg; }
          # { name = "README"; text = "󰂺"; fg = col.fg; }
          # { name = "README.md"; text = "󰂺"; fg = col.fg; }
          { name = ".git-blame-ignore-revs"; text = ""; fg = col.orange; }
          { name = ".gitattributes"; text = ""; fg = col.orange; }
          { name = ".gitignore"; text = ""; fg = col.orange; }
          { name = ".gitmodules"; text = ""; fg = col.orange; }
          { name = "makefile"; text = "󱌣"; fg = col.fg; }
        ];

        exts = [
          { name = "nix"; text = "󱄅"; fg = col.blue; }
          { name = "css"; text = ""; fg = col.blue; }
          { name = "html"; text = ""; fg = col.orange; }
          { name = "yaml"; text = ""; fg = col.fg; }
          { name = "yml"; text = ""; fg = col.fg; }
          { name = "json"; text = ""; fg = col.fg; }
          { name = "toml"; text = ""; fg = col.red; }
          { name = "desktop"; text = ""; fg = col.violet; }
          { name = "js"; text = ""; fg = col.yellow2; }
          { name = "rs"; text = ""; fg = col.red; }
          { name = "py"; text = ""; fg = col.yellow2; }
          { name = "c"; text = ""; fg = col.blue; }
          { name = "c++"; text = ""; fg = col.violet; }
          { name = "cpp"; text = ""; fg = col.violet; }
          { name = "cp"; text = ""; fg = col.violet; }
          { name = "lua"; text = "󰢱"; fg = col.blue; }
          { name = "zig"; text = ""; fg = col.yellow2; }
          { name = "hs"; text = ""; fg = col.violet; }
          { name = "git"; text = ""; fg = col.red2; }
          { name = "lock"; text = ""; fg = col.fg; }
          { name = "txt"; text = ""; fg = col.fg; }
          { name = "png"; text = ""; fg = col.yellow2; }
          { name = "webp"; text = ""; fg = col.yellow2; }
          { name = "jpg"; text = ""; fg = col.yellow2; }
          { name = "jpeg"; text = ""; fg = col.yellow2; }
          { name = "gif"; text = ""; fg = col.yellow2; }
          { name = "ico"; text = ""; fg = col.yellow2; }
          { name = "svg"; text = "󰜡"; fg = col.yellow2; }
          { name = "vtf"; text = ""; fg = col.yellow2; }
          { name = "vmt"; text = ""; fg = col.fg; }
          { name = "mp4"; text = ""; fg = col.violet; }
          { name = "mkv"; text = ""; fg = col.violet; }
          { name = "mov"; text = ""; fg = col.violet; }
          { name = "mp3"; text = ""; fg = col.violet; }
          { name = "ogg"; text = ""; fg = col.violet; }
          { name = "opus"; text = ""; fg = col.violet; }
          { name = "flac"; text = ""; fg = col.violet; }
          { name = "wav"; text = "󱑽"; fg = col.violet; }
          { name = "nu"; text = ""; fg = col.green; }
          { name = "sh"; text = ""; fg = col.green; }
          { name = "bash"; text = ""; fg = col.green; }
          { name = "zsh"; text = ""; fg = col.green; }
          { name = "fish"; text = ""; fg = col.green; }
          { name = "bat"; text = ""; fg = col.red2; }
          { name = "exe"; text = ""; fg = col.red2; }
          { name = "dll"; text = "󱉟"; fg = col.red2; }
          { name = "iso"; text = ""; fg = col.fg; }
          { name = "qcow2"; text = ""; fg = col.fg; }
          { name = "kra"; text = ""; fg = col.pink; }
          { name = "kra~"; text = ""; fg = col.fg; }
          { name = "xml"; text = "󰗀"; fg = col.fg; }
          { name = "md"; text = ""; fg = col.fg; }
          { name = "org"; text = ""; fg = col.green; }

          { name = "gz"; text = "󰗄"; fg = col.yellow2; }
          { name = "xz"; text = "󰗄"; fg = col.yellow2; }
          { name = "bz2"; text = "󰗄"; fg = col.yellow2; }
          { name = "zst"; text = "󰗄"; fg = col.yellow2; }
          { name = "lz4"; text = "󰗄"; fg = col.yellow2; }
          { name = "lha"; text = "󰗄"; fg = col.yellow2; }
          { name = "zip"; text = "󰗄"; fg = col.yellow2; }
          { name = "7z"; text = "󰗄"; fg = col.yellow2; }
          { name = "rar"; text = "󰗄"; fg = col.yellow2; }

          { name = "jar"; text = ""; fg = col.orange; }
          { name = "swift"; text = ""; fg = col.red2; }
          { name = "svelte"; text = ""; fg = col.red2; }
          { name = "db"; text = ""; fg = col.fg; }
          { name = "sql"; text = ""; fg = col.fg; }
          { name = "sqlite"; text = ""; fg = col.fg; }
          { name = "sqlite3"; text = ""; fg = col.fg; }
          { name = "dump"; text = ""; fg = col.fg; }
          { name = "bsp"; text = ""; fg = col.fg; }
          { name = "vmf"; text = ""; fg = col.fg; }
          { name = "vmx"; text = ""; fg = col.fg; }
          { name = "el"; text = ""; fg = col.violet; }
          { name = "gpg"; text = "󱕴"; fg = col.yellow2; }

          { name = "celeste"; text = ""; fg = col.yellow2; }

        ];

# FIXME
#         conds = [
# # Special files
#           { if = "orphan"; text = ""; }
#           { if = "link"; text = ""; }
#           { if = "block"; text = ""; }
#           { if = "char"; text = ""; }
#           { if = "fifo"; text = ""; }
#           { if = "sock"; text = ""; }
#           { if = "sticky"; text = ""; }
#           { if = "dummy"; text = ""; }
#
# # Fallback
#           { if = "dir"; text = ""; }
#           { if = "exec"; text = ""; }
#           { if = "!dir"; text = ""; }
#         ];
      };
    };
  };
}
