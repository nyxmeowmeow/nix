{
  flake_dir,
  host,
  wm,
  ...
}:
let
  wm_launch_command =
    if (wm == "hyprland") then "Hyprland"
    else if (wm == "niri") then "niri-session"
    else "echo config.wm is set incorrectly";
in {
  programs.nushell = {
    enable = true;

    configFile.text = /* nu */ ''
      # FIXME
      # def po [] {
      #   niri msg action switch-preset-window-width
      #   niri msg action toggle-column-tabbed-display
      #   let dir = pwd
      #   niri msg action spawn -- kitty -1 cd $dir -- &
      #   nvim . -- &
      #   sleep 0.1sec
      #   niri msg action consume-or-expel-window-left
      # }

      def rgb [ msg: string ] {
        pastel format rgb "$msg" | wl-copy
      }

      def gl [] {
        let selection = (git log --oneline | lines | fzf)
        let hash = ($selection | split row " " | get 0)
        wl-copy $hash
      }

      def hist [] {
        # let selected = (history | reverse | get command | uniq | fzf)
        # if ($selected | is-empty) == false {
        #   do $selected
        # }
        echo "use <C-r>"
      }

      def record [] { # simple screen record without obs
        cd ~/Videos
        let date = date now | format date "%Y-%m-%d %H:%M:%S"
        wf-recorder -r 60 -o DP-1 -f $"(date now | format date '%Y-%m-%d %H:%M:%S').mkv"
      }

      # convert .mp4 file to .mov for davinci resolve
      def movify [msg: string] {
          let input = $msg
          let base = (echo $msg | path parse | get stem)
          let output = ($base | str join "") + ".mov"
          ^ffmpeg -i $input -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le -pix_fmt yuv422p $output
      }

      def , [msg: string] {
        nix run nixpkgs#($msg)
      }

      def ,, [msg: string] {
        nix-shell -p ($msg)
      }


      def nr [...msg: string] {
        # sudo nixos-rebuild switch --flake ${flake_dir}#nixos
        sudo nh os switch -R ~/nix -H ${host}
        cd ~/nix
        git add .
        let timestamp = (date now | format date '%d/%m %H:%M:%S')
        let full_msg = if ($msg | is-empty) {
          $timestamp
        } else {
          $"($timestamp) ($msg | str join ' ')"
        }
        git commit -m $full_msg
      }


      # nix flake git commit
      def ngc [...msg: string] {
        cd ~/nix
        git add .
        let timestamp = (date now | format date '%d/%m %H:%M:%S')
        let full_msg = if ($msg | is-empty) {
          $timestamp
        } else {
          $"($timestamp) ($msg | str join ' ')"
        }
        git commit -m $full_msg
      }

      # nix flake git commit amend
      def nga [...msg: string] {
        cd ~/nix
        git add .
        let timestamp = (date now | format date '%d/%m %H:%M:%S')
        let full_msg = if ($msg | is-empty) {
          $timestamp
        } else {
          $"($timestamp) ($msg | str join ' ')"
        }
        git commit --amend -m $full_msg
      }

      def gcm [...msg: string] {
        git commit -m $msg
      }

      def timer [...msg: string] {
        let full_msg = ($msg | str join " ") + "m"
        termdown -s $full_msg
        notify-send -t 10000 timer up
      }

      # search for process
      def lsproc [msg: string] {
      ps | where name =~ $"($msg)"
      }

      # copy path
      def jj [] {
        let path = pwd | str trim | wl-copy
        echo $"copied (pwd)"
      }

      # copy file path
      def jf [...msg: string] {
        realpath ...$msg | str trim | wl-copy
        let path = realpath ...$msg
        echo $"copied ($path)"
      }

      # copy pwd relative to git root
      def jg [] {
        let root = (git rev-parse --show-toplevel | str trim)
        let rel = (realpath . | path relative-to $root)
        $rel | wl-copy
        echo $"copied ($rel)"
      }

      # goto git root
# FIXME
      def gr [] {
        cd $"(git rev-parse --show-toplevel)"
      }

      #  clear clipboard
      def cl [] {
        ${flake_dir}/stuff/scripts/clear.sh
      }


      # $env.path ++= ["/xyz/meow"]

      $env.config = {
          cursor_shape: {
              emacs: line
              vi_insert: line
              vi_normal: block
          }

          show_banner: false
          table: {
              mode: none
              index_mode: never
          }

          keybindings: [
              # {
              #     name: "fzf)"]))
              # }
          ]
      }
    '';

   #  envFile.text = /* nu */ ''
   #  '';

    loginFile.text = /* nu */ ''
      if (tty) == "/dev/tty1" {
        ${wm_launch_command}
      }
    '';


    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";
      "......." = "cd ../../../../../..";

      ffmpreg = "ffmpeg";

      woman = "man";


      q = "exit";
      ":q" = "exit";
      ":x" = "exit";

      # k = "pkill";
      back = "cd -";
      fg = "job unfreeze";

      sudo = "sudo -k"; # prompt every time
      # rm = "trash -i"; # prompt every time
      tr = "trash -i"; # prompt every time
      rm = "rm -i"; # prompt every time
      mv = "mv -i"; # prompt every time
      ln = "ln -i"; # prompt every time

      banish = "shred -u"; # shred and delete

      logout = "hyprctl dispatch exit 0";
      # l = "eza -lh  --icons=auto"; # long list
      ls = "eza -a1   --icons=auto"; # short list
      lsl = "eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
      # ld = "eza -lhD --icons=auto"; # long list dirs
      # lt = "eza --icons=auto --tree"; # list folder as tree
      # ff = "fastfetch --logo nixos_small --logo-color-2 magenta";
      meowfetch = "fastfetch -l ${flake_dir}/stuff/kitty_yarn";



      ga = "git add .";
      # gl = "git log --oneline | lines | fzf";
      gcl = "git clone";
      gd = "git diff HEAD^";
      gs = "git status";
      gsw = "git switch";
      gps = "git push";
      gpl = "git pull";
      gpr = "git pull --rebase";
      gb = "git branch";

      cr = "cargo run";

      # meow = "echo :3"; # so silly

      # na = "nvim ~/nix/packages.nix -c '/systemPackages'";
      ns = "nix-shell -p";

      n = "nvim";
      y = "yazi";

      "n," = "nvim";
      "bn" = "nvim";
      "nb" = "nvim";
      "t!ch" = "touch";
      mkidr = "mkdir";
      chomd = "chmod";
      dc = "cd";
      sl = "ls";
      igt = "git";
      gti = "git";


      # h = "!! --help";
      np = "${flake_dir}/stuff/scripts/nixpkgs.sh";

    };


    environmentVariables = {
      MANPAGER = "nvim +Man!"; # use nvim for man
      SUDO_TIMESTAMP_TIMEOUT = 0;
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "zen";
      NIXOS_OZONE_WL = "1"; # tell things to use wayland
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };
}
