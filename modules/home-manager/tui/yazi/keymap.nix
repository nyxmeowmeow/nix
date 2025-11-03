{ flake_dir, ... }: {
  programs.yazi = {
    keymap = {
      mgr.keymap = [
      {
        desc = "Run dupes interactive";
        on = [
          "g"
          "d"
          "<Space>"
        ];
        run = "plugin dupes interactive";
      }

      # {
      #   on = [ "g" "<Enter>" ];
      #   run = "plugin file-actions -- --around ";
      #   desc = "perform action on selected files";
      # }
      {
        on = [ "g" "<Enter>" ];
        run = "plugin open-with-cmd --args=block";
        # desc = "open with command";
      }
      {
        on = [ "g" "<S-Enter>" ];
        run = "plugin open-with-cmd";
        # desc = "open with command";
      }

      { # sort natural/none
        on = [ "g" "o" "n" ];
        run = "sort natural";
        desc = "sort natural/none";
      }

      { # sort reverse (inverse)
        on = [ "g" "o" "i" ];
        run = "sort --reverse";
        desc = "reverse/inverse sort";
      }

      { # sort dir first
        on = [ "g" "o" "d" ];
        run = "sort --dir-first";
        desc = "sort directories first";
      }
      { # dont sort dir first
        on = [ "g" "o" "D" ];
        run = "sort --dir-first=no";
        desc = "dont sort directories first";
      }

      { # sort by file size
        on = [ "g" "o" "s" ];
        run = "sort size";
        desc = "sort by size";
      }

      { # sort randomly
        on = [ "g" "o" "r" ];
        run = "sort random";
        desc = "sort randomly";
      }

      { # sort by extension
        on = [ "g" "o" "e" ];
        run = "sort extension";
        desc = "sort by extension";
      }

      { # sort by btime
        on = [ "g" "o" "b" ];
        run = "sort extension";
        desc = "sort by extension";
      }
      { # sort by mtime
        on = [ "g" "o" "m" ];
        run = "sort mtime";
        desc = "sort by mtime";
      }



      {
        on = "<Esc>";
        run = "escape";
        desc = "Exit visual mode, clear selected; or cancel search";
      }

      { # FIXME
        on = [ "g" "r" ];
        run = "shell -- ya emit cd '$(git rev-parse --show-toplevel)'";
        desc = "go to git root";
      }

      {
        on = [ "g" "M" ];
        run = "plugin gvfs -- jump-to-device";
        desc = "Select device then jump to its mount point";
      }

      { # TODO compression level?
        on = [ "g" "a" "<Space>" ];
        run = "plugin compress";
        desc = "Archive";
      }
      {
        on = [ "g" "a" "p" ];
        run = "plugin compress -p";
        desc = "Archive (password)";
      }
      {
        on = [ "g" "a" "P" ];
        run = "plugin compress -ph";
        desc = "Archive (pw + header)";
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
        on = "<C-c>";
        run = "quit";
        desc = "Suspend the process";
      }

      {
        on = "<C-d>";
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
      }
      {
        on = "<C-a>";
        run = "arrow 10";
      }

      {
        on = "<C-S-e>";
        run = "arrow -50%";
      }
      {
        on = "<C-S-a>";
        run = "arrow 50%";
      }

      {
        on = [ "g" "g" ];
        run = "arrow top";
      }

      {
        on = "G";
        run = "arrow bot";
      }

      {
        on = "h";
        run = "leave";
      }

      {
        on = "i";
        run = "enter";
      }

      {
        on = "a";
        run = "arrow next";
      }

      {
        on = "e";
        run = "arrow prev";
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
        on = [ "g" "i" ];
        run = [ "toggle_all" ];
        desc = "Invert selection";
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
        on = "<C-r>";
        run = "toggle_all";
        desc = "Invert selection";
      }

# Visual mode
      {
        on = "r";
        run = "visual_mode";
        desc = "visual mode";
      }

      {
        on = "R";
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
        on = "y";
        run = [ "shell -- for path in \"$@\"; do echo \"file://$path\"; done | wl-copy -t text/uri-list" "yank" ];
        desc = "Yank";
      }

      {
        on = "u";
        run = "yank --cut";
        desc = "Cut";
      }

      {
        on = "l";
        run = "paste";
        desc = "Paste";
      }

# { on = "f"         run = "paste --force";               desc = "Paste yanked files (overwrite if the destination exists)"; }

      {
        on = [ "g" "c" ];
        run = "plugin chmod";
        desc = "Change mode";
      }

      {
        on = [ "g" "m" ];
        run = "plugin mount";
        desc = "Mount";
      }

      {
        on = [ "g" "l" "l" ];
        run = "link";
        desc = "Symlink absolute";
      }

      {
        on = [ "g" "l" "r" ];
        run = "link --relative";
        desc = "Symlink relative";
      }

      {
        on = [ "g" "l" "h" ];
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
        on   = ["g" "s"];
        run  = "shell 'nu' --block";
        desc = "Open shell here";
      }


# Linemode
      {
        on = [ "m" "s" ];
        run = "linemode size";
        desc = "size";
      }

      {
        on = [ "m" "p" ];
        run = "linemode permissions";
        desc = "permissions";
      }

      {
        on = [ "m" "b" ];
        run = "linemode btime";
        desc = "btime";
      }

      {
        on = [ "m" "m" ];
        run = "linemode mtime";
        desc = "mtime";
      }

      {
        on = [ "m" "o" ];
        run = "linemode owner";
        desc = "owner";
      }

      {
        on = [ "m" "n" ];
        run = "linemode none";
        desc = "none";
      }

# Copy
      {
        on = [ "Y" "c" ];
        run = "copy path";
        desc = "Copy the file path";
      }

      {
        on = [ "Y" "d" ];
        run = "copy dirname";
        desc = "Copy the directory path";
      }

      {
        on = [ "Y" "f" ];
        run = "copy filename";
        desc = "Copy the filename";
      }

      {
        on = [ "Y" "n" ];
        run = "copy name_without_ext";
        desc = "Copy the filename without extension";
      }

      # FIXME
      # {
      #   on = [ "Y" "g" ];
      #   run = "shell -- ${flake_dir}/stuff/scripts/jg.sh";
      #   desc = "Copy file path from git root";
      # }


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
        on = [ "<Space>" "a" ];
        run = "cd ~/art";
        desc = "art";
      }

      {
        on = [ "<Space>" "c" ];
        run = "cd ~/.config";
        desc = ".config";
      }

      {
        on = [ "<Space>" "d" "e" ];
        run = "cd ~/Desktop";
        desc = "desktop";
      }

      {
        on = [ "<Space>" "d" "o" ];
        run = "cd ~/Documents";
        desc = "documents";
      }

      {
        on = [ "<Space>" "d" "l" ];
        run = "cd ~/Downloads";
        desc = "downloads";
      }

      {
        on = [ "<Space>" "f" ];
        run = "cd ~/.config";
        desc = "~/.config";
      }

      {
        on = [ "<Space>" "g" "d" ];
        run = "cd ~/.local/share/Steam/steamapps/compatdata/322170/pfx/drive_c/users/steamuser/AppData/Local/GeometryDash/";
        desc = "GD songs";
      }

      {
        on = [ "<Space>" "g" "a" ];
        run = "cd ~/game";
        desc = "game repo";
      }

      {
        on = [ "<Space>" "h" "o" ];
        run = "cd ~";
        desc = "home";
      }
      {
        on = [ "<Space>" "~" ];
        run = "cd ~";
        desc = "home";
      }

      {
        on = [ "<Space>" "h" "a" ];
        run = "cd ~/hammer";
        desc = "hammer repo";
      }

      {
        on = [ "<Space>" "l" ];
        run = "cd ~/.local";
        desc = "~/.local";
      }

      {
        on = [ "<Space>" "m" "e" ];
        run = "cd ~/melee";
        desc = "melee";
      }

      {
        on = [ "<Space>" "m" "i" ];
        run = "cd ~/misc";
        desc = "misc";
      }

      {
        on = [ "<Space>" "m" "u" ];
        run = "cd ~/Music";
        desc = "music";
      }

      {
        on = [ "<Space>" "n" "i" ];
        run = "cd ${flake_dir}";
        desc = "nix";
      }

      {
        on = [ "<Space>" "n" "v" ];
        run = "cd ${flake_dir}/modules/home-manager/tui/nixvim";
        desc = "nixvim";
      }

      {
        on = [ "<Space>" "n" "z" ];
        run = "cd ${flake_dir}/modules/home-manager/gui/zen";
        desc = "zen";
      }

      {
        on = [ "<Space>" "n" "h" "n" ];
        run = "cd ${flake_dir}/hosts/nixos";
        desc = "hosts/nixos";
      }

      {
        on = [ "<Space>" "n" "h" "l" ];
        run = "cd ${flake_dir}/hosts/laptop";
        desc = "hosts/laptop";
      }

      {
        on = [ "<Space>" "n" "o" ];
        run = "cd ~/notes";
        desc = "nix";
      }

      {
        on = [ "<Space>" "p" "i" ];
        run = "cd ~/Pictures";
        desc = "pictures";
      }

      {
        on = [ "<Space>" "p" "r" ];
        run = "cd ~/dev/projects";
        desc = "projects";
      }

      {
        on = [ "<Space>" "r" ];
        run = "cd /";
        desc = "root";
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
        on = [ "<Space>" "t" "r" ];
        run = "cd ~/.local/share/Trash/files";
        desc = "trash";
      }

      {
        on = [ "<Space>" "t" "e" ];
        run = "cd ~/textures";
        desc = "textures repo";
      }

      {
        on = [ "<Space>" "v" ];
        run = "cd ~/Videos";
        desc = "videos";
      }

      {
        on = [ "<space>" "1" ];
        run = "cd /run/media/meow/66d7f84b-92ba-41dc-8847-b486ec0c3817";
        desc = "drive #1";
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
        on = ["S" "l" ];
        run = "plugin sudo -- paste";
        desc = "sudo paste";
      }

# sudo cp/mv --force
# { on = ["S" "P"]; run = "plugin sudo -- paste --force"; desc = "sudo paste"; }

      { # sudo mv
        on = ["S" "s"];
        run = "plugin sudo -- rename";
        desc = "sudo rename";
      }

      { # sudo ln -s (absolute-path)
        on = ["S" "n" "l"];
        run = "plugin sudo -- link";
        esc = "sudo link";
      }

      { # sudo ln -s (relative-path)
        on = ["S" "n" "r"];
        run = "plugin sudo -- link --relative";
        desc = "sudo link relative path";
      }

      { # sudo ln
        on = ["S" "n" "h"];
        run = "plugin sudo -- hardlink";
        desc = "sudo hardlink";
      }

      { # sudo touch/mkdir
        on = ["S" "t"];
        run = "plugin sudo -- create";
        desc = "sudo create";
      }

      { # sudo trash
        on = ["S" "o"];
        run = "plugin sudo -- remove";
        desc = "sudo trash";
      }

      ];
      spot.keymap = [
      {
        on = "<Escape>";
        run = "spot close";
      }

      {
        on = "a";
        run = "arrow next";
      }
      {
        on = "e";
        run = "arrow prev";
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
        on = [ "g" "g" ];
        run = "arrow top";
      }
      {
        on = "G";
        run = "arrow bot";
      }

      {
        on = "j";
        run = "copy cell";
      }
      {
        on = "<Enter>";
        run = "copy cell";
      }
      ];

    };
  };
}
