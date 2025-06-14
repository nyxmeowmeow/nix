{ pkgs, ... }: {

  programs.yazi = {
    enable = true;
    # enableFishIntegration = true;
    enableNushellIntegration = true;
    initLua = ''
      -- require("folder-rules"):setup()
      require("no-status"):setup()
      -- require("mime-preview"):setup()
      -- require("simple-tag"):setup()
      require("git"):setup()
      require("starship"):setup()
    '';

    plugins = {
      git = pkgs.yaziPlugins.git;
      sudo = pkgs.yaziPlugins.sudo;
      no-status = pkgs.yaziPlugins.no-status;
      starship = pkgs.yaziPlugins.starship;
      restore = pkgs.yaziPlugins.restore;
      chmod = pkgs.yaziPlugins.chmod;
      piper = pkgs.yaziPlugins.piper;
      mount = pkgs.yaziPlugins.mount;
      jump-to-char = pkgs.yaziPlugins.jump-to-char;
    };

      # require("git"):setup()
      # require("folder-rules"):setup()
      # require("no-status"):setup()
      # require("simple-tag"):setup()

    # flavours = "../stuff/yazitheme.lua";


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
          run = "nvim '$@'";
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




    keymap = {
      mgr.keymap = [
        {
          on = "<Esc>";
          run = "escape";
          desc = "Exit visual mode, clear selected; or cancel search";
        }

        {
          on = "<C-z>";
          run = "suspend";
          desc = "Suspend the process";
        }

        {
          on = "q";
          run = "quit";
          desc = "Suspend the process";
        }

        {
          on = "f";
          run = "plugin jump-to-char";
          desc = "Jump to char";
        }

        {
          on = "<C-e>";
          run = "arrow -10";
          desc = "Move cursor up half page";
        }

        {
          on = "<C-a>";
          run = "arrow 10";
          desc = "Move cursor down half page";
        }

        {
          on = "<C-S-e>";
          run = "arrow -50%";
          desc = "Move cursor up one page";
        }

        {
          on = "<C-S-a>";
          run = "arrow 50%";
          desc = "Move cursor down one page";
        }

        {
          on = [ "g" "g" ];
          run = "arrow top";
          desc = "Move cursor to the top";
        }

        {
          on = "G";
          run = "arrow bot";
          desc = "Move cursor to the bottom";
        }

        # Navigation
        {
          on = "h";
          run = "leave";
          desc = "Go back to the parent directory";
        }

        {
          on = "i";
          run = "enter";
          desc = "Enter the child directory";
        }

        {
          on = "a";
          run = "arrow next";
          desc = "";
        }

        {
          on = "e";
          run = "arrow prev";
          desc = "";
        }

        {
          on = "H";
          run = "back";
          desc = "Go back to the previous directory";
        }

        {
          on = "I";
          run = "forward";
          desc = "Go forward to the next directory";
        }

        # Toggle
        {
          on = [ "r" "i" ];
          run = [ "toggle" "arrow 1" ];
          desc = "Toggle the current selection state";
        }

        {
          on = "n";
          run = [ "toggle" "arrow 1" ];
          desc = "Toggle the current selection state";
        }

        {
          on = "<C-g>";
          run = "toggle_all --state=on";
          desc = "Select all files";
        }

        {
          on = "<C-v>";
          run = "toggle_all";
          desc = "Invert selection of all files";
        }

        # Visual mode
        {
          on = "w";
          run = "visual_mode";
          desc = "Enter visual mode (selection mode)";
        }

        {
          on = "W";
          run = "visual_mode --unset";
          desc = "Enter visual mode (unset mode)";
        }

        {
          on = "p";
          run = "plugin restore";
          desc = "Restore files";
        }

        # Seeking
        {
          on = "A";
          run = "seek 5";
          desc = "Seek down 5 units in the preview";
        }

        {
          on = "E";
          run = "seek -5";
          desc = "Seek up 5 units in the preview";
        }

        # Spotting
        {
          on = "<Tab>";
          run = "spot";
          desc = "Spot hovered file";
        }

        # Tagging
        {
          on = [ "~" ];
          run = "plugin simple-tag -- toggle-tag";
          desc = "Toggle tag with any key (press any key to toggle tag)";
        }

        # Operation
        {
          on = "<Enter>";
          run = "open";
          desc = "Open selected files";
        }

        {
          on = "<S-Enter>";
          run = "open --interactive";
          desc = "Open selected files interactively";
        }

        {
          on = "j";
          run = [ "shell -- for path in '$@'; do echo 'file://$path'; done | wl-copy -t text/uri-list" "yank" ];
          desc = "Yank";
        }

        {
          on = "u";
          run = "yank --cut";
          desc = "Cut";
        }

        {
          on = "f";
          run = "paste";
          desc = "Paste";
        }

        # { on = "f"         run = "paste --force";               desc = "Paste yanked files (overwrite if the destination exists)"; }

        {
          on = [ "r" "c" ];
          run = "plugin chmod";
          desc = "Change mode";
        }

        {
          on = [ "r" "m" ];
          run = "plugin mount";
          desc = "Mount";
        }

        {
          on = [ "r" "s" "l" ];
          run = "link";
          desc = "Symlink absolute";
        }

        {
          on = [ "r" "s" "r" ];
          run = "link --relative";
          desc = "Symlink relative";
        }

        {
          on = [ "r" "s" "h" ];
          run = "hardlink";
          desc = "Hardlink";
        }

        {
          on = "X";
          run = "unyank";
          desc = "Cancel the yank status";
        }

        {
          on = "o";
          run = "remove";
          desc = "Trash selected files";
        }

        {
          on = "t";
          run = "create";
          desc = "Create a file (ends with / for directories)";
        }

        {
          on = "s";
          run = "rename --cursor=before_ext";
          desc = "Rename selected file(s)";
        }

        {
          on = ":";
          run = "shell --interactive";
          desc = "Run a shell command";
        }

        # { on = ";";         run = "shell --block --interactive"; desc = "Run a shell command (block until finishes)"; }

        {
          on = ".";
          run = "hidden toggle";
          desc = "Toggle the visibility of hidden files";
        }

        {
          on = "k";
          run = "search --via=fd";
          desc = "Search files by name via fd";
        }

        {
          on = "K";
          run = "search --via=rg";
          desc = "Search files by content via ripgrep";
        }

        {
          on = "<C-s>";
          run = "escape --search";
          desc = "Cancel the ongoing search";
        }

        {
          on = "c";
          run = "plugin zoxide";
          desc = "Jump to a directory via zoxide";
        }

        {
          on = "C";
          run = "plugin fzf";
          desc = "Jump to a file/directory via fzf";
        }


        {
          on   = ["r" "f"];
          run  = "shell 'fish' --block";
          desc = "Open shell here";
        }


        # Linemode
        {
          on = [ "m" "s" ];
          run = "linemode size";
          desc = "Linemode: size";
        }

        {
          on = [ "m" "p" ];
          run = "linemode permissions";
          desc = "Linemode: permissions";
        }

        {
          on = [ "m" "b" ];
          run = "linemode btime";
          desc = "Linemode: btime";
        }

        {
          on = [ "m" "m" ];
          run = "linemode mtime";
          desc = "Linemode: mtime";
        }

        {
          on = [ "m" "o" ];
          run = "linemode owner";
          desc = "Linemode: owner";
        }

        {
          on = [ "m" "n" ];
          run = "linemode none";
          desc = "Linemode: none";
        }

        # Copy
        {
          on = [ "J" "c" ];
          run = "copy path";
          desc = "Copy the file path";
        }

        {
          on = [ "J" "d" ];
          run = "copy dirname";
          desc = "Copy the directory path";
        }

        {
          on = [ "J" "f" ];
          run = "copy filename";
          desc = "Copy the filename";
        }

        {
          on = [ "J" "n" ];
          run = "copy name_without_ext";
          desc = "Copy the filename without extension";
        }


        # Filter
        {
          on = "/";
          run = "filter --smart";
          desc = "Filter files";
        }

        {
          on = "?";
          run = "filter --previous --smart";
          desc = "Filter files backwards";
        }


        # Find
        {
          on = "d";
          run = "find --smart";
          desc = "Find next file";
        }

        {
          on = "D";
          run = "find --previous --smart";
          desc = "Find previous file";
        }

        {
          on = "m";
          run = "find_arrow";
          desc = "Goto the next found";
        }

        {
          on = "M";
          run = "find_arrow --previous";
          desc = "Goto the previous found";
        }

        # Sorting
        #{ on = [ ";" "m" ]; run = [ "sort mtime --reverse=no", "linemode mtime" ]; desc = "Sort by modified time"; }
        #{ on = [ ";" "M" ]; run = [ "sort mtime --reverse", "linemode mtime" ];    desc = "Sort by modified time (reverse)"; }
        #{ on = [ ";" "b" ]; run = [ "sort btime --reverse=no", "linemode btime" ]; desc = "Sort by birth time"; }
        #{ on = [ ";" "B" ]; run = [ "sort btime --reverse", "linemode btime" ];    desc = "Sort by birth time (reverse)"; }
        #{ on = [ ";" "v" ]; run = "sort extension --reverse=no",                   desc = "Sort by extension"; }
        #{ on = [ ";" "V" ]; run = "sort extension --reverse",                      desc = "Sort by extension (reverse)"; }
        #{ on = [ ";" "j" ]; run = "sort alphabetical --reverse=no",                desc = "Sort alphabetically"; }
        #{ on = [ ";" "J" ]; run = "sort alphabetical --reverse",                   desc = "Sort alphabetically (reverse)"; }
        #{ on = [ ";" "n" ]; run = "sort natural --reverse=no",                     desc = "Sort naturally"; }
        #{ on = [ ";" "N" ]; run = "sort natural --reverse",                        desc = "Sort naturally (reverse)"; }
        #{ on = [ ";" "s" ]; run = [ "sort size --reverse=no", "linemode size" ];   desc = "Sort by size"; }
        #{ on = [ ";" "S" ]; run = [ "sort size --reverse", "linemode size" ];      desc = "Sort by size (reverse)"; }
        #{ on = [ ";" "r" ]; run = "sort random --reverse=no";                      desc = "Sort randomly"; }

        # Goto
        {
          on = [ "<Space>" "<Space>" ];
          run = "cd --interactive";
          desc = "Jump interactively";
        }

        {
          on = [ "<Space>" "r" ];
          run = "cd /";
          desc = "root";
        }

        {
          on = [ "<Space>" "h" ];
          run = "cd ~";
          desc = "home";
        }

        {
          on = [ "<Space>" "n" ];
          run = "cd ~/nix";
          desc = "~/nix";
        }

        {
          on = [ "<Space>" "f" ];
          run = "cd ~/.config";
          desc = "~/.config";
        }

        {
          on = [ "<Space>" "l" ];
          run = "cd ~/.local";
          desc = "~/.local";
        }

        {
          on = [ "<Space>" "a" ];
          run = "cd ~/art";
          desc = "~/art";
        }

        {
          on = [ "<Space>" "d" "e" ];
          run = "cd ~/Desktop";
          desc = "~/Desktop";
        }

        {
          on = [ "<Space>" "d" "o" ];
          run = "cd ~/Documents";
          desc = "~/Documents";
        }

        {
          on = [ "<Space>" "d" "l" ];
          run = "cd ~/Downloads";
          desc = "~/Downloads";
        }

        {
          on = [ "<Space>" "m" "u" ];
          run = "cd ~/Music";
          desc = "~/Music";
        }

        {
          on = [ "<Space>" "m" "i" ];
          run = "cd ~/misc";
          desc = "~/misc";
        }

        {
          on = [ "<Space>" "i" ];
          run = "cd ~/Pictures";
          desc = "~/Pictures";
        }

        {
          on = [ "<Space>" "t" ];
          run = "cd ~/.local/share/Trash/files";
          desc = "Trash";
        }

        {
          on = [ "<Space>" "p" ];
          run = "cd ~/projects";
          desc = "~/projects";
        }

        {
          on = [ "<Space>" "v" ];
          run = "cd ~/Videos";
          desc = "~/Videos";
        }

        {
          on = [ "<Space>" "o" "r" ];
          run = "cd ~/Documents/Obsidian_Vault/Rust/Book_notes";
          desc = "obsidian rust";
        }

        {
          on = [ "<Space>" "o" "n" ];
          run = "cd ~/Documents/Obsidian_Vault/NixOS";
          desc = "obsidian nix";
        }

        {
          on = [ "<Space>" "s" "t" ];
          run = "cd ~/.local/share/Steam/steamapps/common";
          desc = "steamapps";
        }

        {
          on = [ "<Space>" "s" "i" ];
          run = "cd ~/silly";
          desc = "silly";
        }

        {
          on = [ "<Space>" "g" ];
          run = "cd ~/.local/share/Steam/steamapps/compatdata/322170/pfx/drive_c/users/steamuser/AppData/Local/GeometryDash/";
          desc = "GD songs";
        }


        # Tabs
        {
          on = ",";
          run = "tab_create --current";
          desc = "Create a new tab with CWD";
        }

        {
          on = "1";
          run = "tab_switch 0";
          desc = "Switch to the first tab";
        }

        {
          on = "2";
          run = "tab_switch 1";
          desc = "Switch to the second tab";
        }

        {
          on = "3";
          run = "tab_switch 2";
          desc = "Switch to the third tab";
        }

        {
          on = "4";
          run = "tab_switch 3";
          desc = "Switch to the fourth tab";
        }

        {
          on = "5";
          run = "tab_switch 4";
          desc = "Switch to the fifth tab";
        }

        {
          on = "6";
          run = "tab_switch 5";
          desc = "Switch to the sixth tab";
        }

        {
          on = "7";
          run = "tab_switch 6";
          desc = "Switch to the seventh tab";
        }

        {
          on = "8";
          run = "tab_switch 7";
          desc = "Switch to the eighth tab";
        }

        {
          on = "9";
          run = "tab_switch 8";
          desc = "Switch to the ninth tab";
        }

        {
          on = "[";
          run = "tab_switch -1 --relative";
          desc = "Switch to the previous tab";
        }

        {
          on = "]";
          run = "tab_switch 1 --relative";
          desc = "Switch to the next tab";
        }

        {
          on = "{";
          run = "tab_swap -1";
          desc = "Swap current tab with previous tab";
        }

        {
          on = "}";
          run = "tab_swap 1";
          desc = "Swap current tab with next tab";
        }

        # Tasks
        {
          on = "f";
          run = "tasks_show";
          desc = "Show task manager";
        }


        # Projects
        # { on = [ "p" "s" ]; run = "plugin projects save", desc = "Save current projects"; }
        # { on = [ "p" "l" ]; run = "plugin projects load", desc = "Load project"; }
        # { on = [ "p" "p" ]; run = "plugin projects load_last", desc = "Load last project"; }
        # { on = [ "p" "o" ]; run = "plugin projects delete", desc = "Delete project"; }
        # { on = [ "p" "O" ]; run = "plugin projects delete_all", desc = "Delete all projects"; }
        # { on = [ "p" "m" ]; run = "plugin projects 'merge current'", desc = "Merge current tab to other projects"; }

        # Sudo
        # sudo cp/mv
        {
          on = ["R" "l" ];
          run = "plugin sudo -- paste";
          desc = "sudo paste";
        }

        # sudo cp/mv --force
        # { on = ["R" "P"]; run = "plugin sudo -- paste --force"; desc = "sudo paste"; }

        # sudo mv
        {
          on = ["R" "s"];
          run = "plugin sudo -- rename";
          desc = "sudo rename";
        }

        # sudo ln -s (absolute-path)
        {
          on = ["R" "n" "l"];
          run = "plugin sudo -- link";
          esc = "sudo link";
        }

        # sudo ln -s (relative-path)
        {
          on = ["R" "n" "r"];
          run = "plugin sudo -- link --relative";
          desc = "sudo link relative path";
        }

        # sudo ln
        {
          on = ["R" "n" "h"];
          run = "plugin sudo -- hardlink";
          desc = "sudo hardlink";
        }

        # sudo touch/mkdir
        {
          on = ["R" "t"];
          run = "plugin sudo -- create";
          desc = "sudo create";
        }

        # sudo trash
        {
          on = ["R" "o"];
          run = "plugin sudo -- remove";
          desc = "sudo trash";
        }

      ];
    };
  };
}
