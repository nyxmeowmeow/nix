{

  programs.nushell = {
    enable = true;


    configFile.text = /* nu */ ''
      let color_scheme = {
          hints: "#886C9C"
          search_result: { bg: cyan fg: "#cad3f5" }
          shape_garbage: { fg: "#24273a" bg: "#ed8796" attr: b}
          shape_filepath: green
          shape_directory: green
          shape_internalcall: purple
          shape_external: purple
          shape_externalarg: "#A4A0E8"
          shape_flag: "#A4A0E8"
          shape_keyword: "#A4A0E8"
          shape_pipe: purple
      }


      def gl [] {
        let selection = (git log --oneline | lines | fzf)
        let hash = ($selection | split row " " | get 0)
        $hash | wl-copy
      }

      def hist [] {
        let selected = (history | reverse | get command | uniq | fzf)
        if ($selected | is-empty) == false {
          do $selected
        }
      }

      # convert .mp4 file to .mov
      def movify [msg: string] {
          let input = $msg
          let base = (echo $msg | path parse | get stem)
          let output = ($base | str join "") + ".mov"
          ^ffmpeg -i $input -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le -pix_fmt yuv422p $output
      }

      def nr [...msg: string] {
        sudo nixos-rebuild switch --flake /home/meow/nix#nixos
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


      def ng [...msg: string] {
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

      def gcm [...msg: string] {
        git commit -m $msg
      }

      def timer [...msg: string] {
        let full_msg = ($msg | str join " ") + "m"
        termdown -s $full_msg
      }

      $env.path ++= ["~/go/bin"]

      $env.config = {
          cursor_shape: {
              emacs: line
              vi_insert: line
              vi_normal: block
          }

          color_config: $color_scheme
          show_banner: false
          table: {
              mode: none
              index_mode: never
          }

          keybindings: [
              # {
              #     name: "fzf_history"
              #     modifier: control
              #     keycode: char_s
              #     mode: emacs
              #     event: Send(EditCommand (ExternalCommand "bash" ["-c" "commandline edit (history | to text | lines | reverse | uniq | fzf)"]))
              # }
          ]
      }
    '';

   #  envFile.text = /* nu */ ''
   #  '';

    loginFile.text = /* nu */ ''
      if (tty) == "/dev/tty1" {
        Hyprland
      }
    '';


    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      # hist="history | lines | fzf | read -l command; eval $command";
      fg = "job unfreeze"; # prompt every time

      sudo = "sudo -k"; # prompt every time
      s = "sudo -k"; # prompt every time
      rm = "rm -i"; # prompt every time
      mv = "mv -i"; # prompt every time
      ln = "ln -i"; # prompt every time

      logout = "hyprctl dispatch exit 0";
      c = "clear"; # clear terminal
      l = "eza -lh  --icons=auto"; # long list
      ls = "eza -a1   --icons=auto"; # short list
      ll = "eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
      ld = "eza -lhD --icons=auto"; # long list dirs
      lt = "eza --icons=auto --tree"; # list folder as tree
      ff = "fastfetch --logo nixos_small --logo-color-2 magenta";
      cl = "hyprctl clients";



      ga = "git add .";
      # gl = "git log --oneline | lines | fzf";
      gcl = "git clone";
      gd = "git diff HEAD^";
      gs = "git status";

      cr = "cargo run";

      meow = "echo :3"; # so silly

      # nr = ''
      #   do {
      #     sudo nixos-rebuild switch --flake /home/meow/nix#nixos
      #     cd ~/nix
      #     git add .
      #     git commit -m $"(date now | format date '%d/%m %H:%M:%S')"
      #   }
      # '';
      na = "nvim ~/nix/packages.nix -c '/systemPackages'";
      ns = "nix-shell -p";

      n = "nvim";
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
