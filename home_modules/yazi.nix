{

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    initLua = ''
    '';

    plugins = {
      compress = "https://github.com/KKV9/compress.yazi";
    };

      # require("git"):setup()
      # require("folder-rules"):setup()
      # require("no-status"):setup()
      # require("simple-tag"):setup()

    # flavours = "../stuff/yazitheme.lua";
    keymap = {
      input.keymap = [
        { on = "<Esc>"; run = "escape";             desc = "Exit visual mode, clear selected; or cancel search"; }
        { on = "<C-z>"; run = "suspend";            desc = "Suspend the process"; }
        { on = "q"; run = "quit";            desc = "Suspend the process"; }

        # Hopping
        { on = "e"; run = "arrow -1"; desc = "Move cursor up"; }
        { on = "a"; run = "arrow 1";  desc = "Move cursor down"; }

        { on = "<C-e>"; run = "arrow -10";  desc = "Move cursor up half page"; }
        { on = "<C-a>"; run = "arrow 10";   desc = "Move cursor down half page"; }
        { on = "<C-S-e>"; run = "arrow -50%"; desc = "Move cursor up one page"; }
        { on = "<C-S-a>"; run = "arrow 50%";  desc = "Move cursor down one page"; }

        { on = [ "c" "c" ]; run = "arrow top"; desc = "Move cursor to the top"; }
        { on = "C";          run = "arrow bot";  desc = "Move cursor to the bottom"; }

        # Navigation
        { on = "h"; run = "leave"; desc = "Go back to the parent directory"; }
        { on = "i"; run = "enter"; desc = "Enter the child directory"; }

        { on = "H"; run = "back";    desc = "Go back to the previous directory"; }
        { on = "I"; run = "forward"; desc = "Go forward to the next directory"; }

        # Toggle
        # { on = "<Space>"; run = [ "toggle"; "arrow 1" ]; desc = "Toggle the current selection state"; }
        { on = "n"; run = [ "toggle" "arrow 1" ]; desc = "Toggle the current selection state"; }
        { on = "<C-g>";   run = "toggle_all --state=on"; desc = "Select all files"; }
        { on = "<C-v>";   run = "toggle_all";            desc = "Invert selection of all files"; }

        # Visual mode
        { on = "w"; run = "visual_mode";         desc = "Enter visual mode (selection mode)"; }
        { on = "W"; run = "visual_mode --unset"; desc = "Enter visual mode (unset mode)"; }

        # Seeking
        { on = "A"; run = "seek 5";  desc = "Seek down 5 units in the preview"; }
        { on = "E"; run = "seek -5"; desc = "Seek up 5 units in the preview"; }

        # Spotting
        { on = "<Tab>"; run = "spot"; desc = "Spot hovered file"; }

        # Archiving
        { on = "'"; run = "plugin compress"; desc = "Archive selected files"; }

        # Tagging
        { on = [ "~" ]; run = "plugin simple-tag -- toggle-tag"; desc = "Toggle tag with any key (press any key to toggle tag)"; }

        # Operation
        { on = "d";         run = "open";                        desc = "Open selected files"; }
        { on = "D";         run = "open --interactive";          desc = "Open selected files interactively"; }
        { on = "<Enter>";   run = "open";                        desc = "Open selected files"; }
        { on = "<S-Enter>"; run = "open --interactive";          desc = "Open selected files interactively"; }
        { on = "j";         run = [ "shell -- for path in '$@'; do echo 'file://$path'; done | wl-copy -t text/uri-list" "yank" ];   desc = "Yank selected files (copy)"; }
        { on = "u";         run = "yank --cut";                  desc = "Yank selected files (cut)"; }
        { on = "f";         run = "paste";                       desc = "Paste yanked files"; }
        # { on = "f"         run = "paste --force";               desc = "Paste yanked files (overwrite if the destination exists)"; }
        { on = [ "<space>" "s" "l" ];         run = "link";                        desc = "Symlink absolute"; }
        { on = [ "<space>" "s" "r" ];         run = "link --relative";             desc = "Symlink relative"; }
        { on = [ "<space>" "s" "h" ];     run = "hardlink";                    desc = "Hardlink"; }
        { on = "X";         run = "unyank";                      desc = "Cancel the yank status"; }
        { on = "o";         run = "remove";                      desc = "Trash selected files"; }
        { on = "t";         run = "create";                      desc = "Create a file (ends with / for directories)"; }
        { on = "r";         run = "rename --cursor=before_ext";  desc = "Rename selected file(s)"; }
        { on = ":";         run = "shell --interactive";         desc = "Run a shell command"; }
        # { on = ";";         run = "shell --block --interactive"; desc = "Run a shell command (block until finishes)"; }
        { on = ".";         run = "hidden toggle";               desc = "Toggle the visibility of hidden files"; }
        { on = "k";         run = "search --via=fd";             desc = "Search files by name via fd"; }
        { on = "K";         run = "search --via=rg";             desc = "Search files by content via ripgrep"; }
        { on = "<C-s>";     run = "escape --search";             desc = "Cancel the ongoing search"; }
        { on = "b";         run = "plugin zoxide";               desc = "Jump to a directory via zoxide"; }
        { on = "B";         run = "plugin fzf";                  desc = "Jump to a file/directory via fzf"; }

        { on   = ["<space>" "f"];       run  = "shell 'fish' --block";       desc = "Open shell here"; }

        # Linemode
        { on = [ "m" "s" ]; run = "linemode size";        desc = "Linemode: size"; }
        { on = [ "m" "p" ]; run = "linemode permissions"; desc = "Linemode: permissions"; }
        { on = [ "m" "b" ]; run = "linemode btime";       desc = "Linemode: btime"; }
        { on = [ "m" "m" ]; run = "linemode mtime";       desc = "Linemode: mtime"; }
        { on = [ "m" "o" ]; run = "linemode owner";       desc = "Linemode: owner"; }
        { on = [ "m" "n" ]; run = "linemode none";        desc = "Linemode: none"; }

        # Copy
        { on = [ "J" "c" ]; run = "copy path";             desc = "Copy the file path"; }
        { on = [ "J" "d" ]; run = "copy dirname";          desc = "Copy the directory path"; }
        { on = [ "J" "f" ]; run = "copy filename";         desc = "Copy the filename"; }
        { on = [ "J" "n" ]; run = "copy name_without_ext"; desc = "Copy the filename without extension"; }

        # Filter
        { on = ";"; run = "filter --smart"; desc = "Filter files"; }

        # Find
        { on = "s"; run = "find --smart";            desc = "Find next file"; }
        # { on = "S"; run = "find --previous --smart"; desc = "Find previous file"; }
        { on = "p"; run = "find_arrow";              desc = "Goto the next found"; }
        { on = "P"; run = "find_arrow --previous";   desc = "Goto the previous found"; }

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
        { on = [ "c" "<Space>" ]; run = "cd --interactive"; desc = "Jump interactively"; }
        { on = [ "c" "r" ];       run = "cd /";             desc = "Goto root"; }
        { on = [ "c" "h" ];       run = "cd ~";             desc = "Goto home"; }
        { on = [ "c" "n" ];       run = "cd ~/nix";         desc = "Goto ~/nix"; }
        { on = [ "c" "f" ];       run = "cd ~/.config";     desc = "Goto ~/.config"; }
        { on = [ "c" "l" ];       run = "cd ~/.local";      desc = "Goto ~/.local"; }
        { on = [ "c" "a" ];       run = "cd ~/art";         desc = "Goto ~/art"; }
        { on = [ "c" "d" "e" ];  run = "cd ~/Desktop";     desc = "Goto ~/Desktop"; }
        { on = [ "c" "d" "o" ];  run = "cd ~/Documents";   desc = "Goto ~/Documents"; }
        { on = [ "c" "d" "l" ];  run = "cd ~/Downloads";   desc = "Goto ~/Downloads"; }
        { on = [ "c" "m" "u" ];  run = "cd ~/Music";       desc = "Goto ~/Music"; }
        { on = [ "c" "m" "i" ];  run = "cd ~/misc";       desc = "Goto ~/misc"; }
        { on = [ "c" "i" ];       run = "cd ~/Pictures";    desc = "Goto ~/Pictures"; }
        { on = [ "c" "t" ];       run = "cd ~/.local/share/Trash/files";    desc = "Goto Trash"; }
        { on = [ "c" "p" ];       run = "cd ~/projects";    desc = "Goto ~/projects"; }
        { on = [ "c" "v" ];       run = "cd ~/Videos";      desc = "Goto ~/Videos"; }
        { on = [ "c" "o" "r" ];  run = "cd ~/Documents/Obsidian_Vault/Rust/Book_notes";      desc = "Goto obsidian rust"; }
        { on = [ "c" "o" "n" ];  run = "cd ~/Documents/Obsidian_Vault/NixOS";      desc = "Goto obsidian nixos"; }
        { on = [ "c" "s" "t" ];  run = "cd ~/.local/share/Steam/steamapps/common"; desc = "Goto steamapps"; }
        { on = [ "c" "s" "i" ];  run = "cd ~/silly";       desc = "Goto silly"; }
        { on = [ "c" "g" ];       run = "cd ~/.local/share/Steam/steamapps/compatdata/322170/pfx/drive_c/users/steamuser/AppData/Local/GeometryDash/"; desc = "Goto GD songs"; }


        # Tabs
        { on = ","; run = "tab_create --current"; desc = "Create a new tab with CWD"; }

        { on = "1"; run = "tab_switch 0"; desc = "Switch to the first tab"; }
        { on = "2"; run = "tab_switch 1"; desc = "Switch to the second tab"; }
        { on = "3"; run = "tab_switch 2"; desc = "Switch to the third tab"; }
        { on = "4"; run = "tab_switch 3"; desc = "Switch to the fourth tab"; }
        { on = "5"; run = "tab_switch 4"; desc = "Switch to the fifth tab"; }
        { on = "6"; run = "tab_switch 5"; desc = "Switch to the sixth tab"; }
        { on = "7"; run = "tab_switch 6"; desc = "Switch to the seventh tab"; }
        { on = "8"; run = "tab_switch 7"; desc = "Switch to the eighth tab"; }
        { on = "9"; run = "tab_switch 8"; desc = "Switch to the ninth tab"; }

        { on = "["; run = "tab_switch -1 --relative"; desc = "Switch to the previous tab"; }
        { on = "]"; run = "tab_switch 1 --relative";  desc = "Switch to the next tab"; }

        { on = "{"; run = "tab_swap -1"; desc = "Swap current tab with previous tab"; }
        { on = "}"; run = "tab_swap 1";  desc = "Swap current tab with next tab"; }

        # Tasks
        { on = "u"; run = "tasks_show"; desc = "Show task manager"; }

        # Help
        { on = "~";    run = "help"; desc = "Open help"; }
        { on = "<F1>"; run = "help"; desc = "Open help"; }


        # Projects
        # { on = [ "p" "s" ]; run = "plugin projects save", desc = "Save current projects"; }
        # { on = [ "p" "l" ]; run = "plugin projects load", desc = "Load project"; }
        # { on = [ "p" "p" ]; run = "plugin projects load_last", desc = "Load last project"; }
        # { on = [ "p" "o" ]; run = "plugin projects delete", desc = "Delete project"; }
        # { on = [ "p" "O" ]; run = "plugin projects delete_all", desc = "Delete all projects"; }
        # { on = [ "p" "m" ]; run = "plugin projects 'merge current'", desc = "Merge current tab to other projects"; }

        # Sudo
        # sudo cp/mv
        { on = ["R" "f" ]; run = "plugin sudo -- paste"; desc = "sudo paste"; }

        # sudo cp/mv --force
        # { on = ["R" "P"]; run = "plugin sudo -- paste --force"; desc = "sudo paste"; }

        # sudo mv
        { on = ["R" "r"]; run = "plugin sudo -- rename"; desc = "sudo rename"; }

        # sudo ln -s (absolute-path)
        { on = ["R" "s" "l"]; run = "plugin sudo -- link";desc = "sudo link"; }

        # sudo ln -s (relative-path)
        { on = ["R" "s" "r"]; run = "plugin sudo -- link --relative"; desc = "sudo link relative path"; }

        # sudo ln
        { on = ["R" "s" "h"]; run = "plugin sudo -- hardlink"; desc = "sudo hardlink"; }

        # sudo touch/mkdir
        { on = ["R" "t"]; run = "plugin sudo -- create"; desc = "sudo create"; }

        # sudo trash
        { on = ["R" "o"]; run = "plugin sudo -- remove"; desc = "sudo trash"; }

      ];
    };
  };
}
