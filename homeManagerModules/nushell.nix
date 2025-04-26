{ ... }: {

  programs.nushell = {
    enable = true;


    configFile.text = /* nu */ ''
      let color_scheme = {
          hints: "#5b6078"
          search_result: { bg: cyan fg: "#cad3f5" }
          shape_garbage: { fg: "#000000" bg: "#FF0000" attr: b}
          shape_filepath: green
          shape_directory: green
          shape_internalcall: blue
          shape_external: blue
          shape_externalarg: "#cad3f5"
          shape_flag: "#cad3f5"
          shape_keyword: blue
          shape_pipe: purple_bold
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

      def gcm [...msg: string] {
        git commit -m $msg
      }

      def timer [...msg: string] {
        let full_msg = ($msg | str join " ") + "m"
        termdown -s $full_msg
      }


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

    envFile.text = /* nu */ ''

      # ========= zoxide start ===============
      # Initialize hook to add new entries to the database.
      export-env {
        $env.config = (
          $env.config?
          | default {}
          | upsert hooks { default {} }
          | upsert hooks.env_change { default {} }
          | upsert hooks.env_change.PWD { default [] }
        )
        let __zoxide_hooked = (
          $env.config.hooks.env_change.PWD | any { try { get __zoxide_hook } catch { false } }
        )
        if not $__zoxide_hooked {
          $env.config.hooks.env_change.PWD = ($env.config.hooks.env_change.PWD | append {
            __zoxide_hook: true,
            code: {|_, dir| zoxide add -- $dir}
          })
        }
      }

      # =============================================================================
      #
      # When using zoxide with --no-cmd, alias these internal functions as desired.
      #

      # Jump to a directory using only keywords.
      def --env --wrapped __zoxide_z [...rest: string] {
        let path = match $rest {
          [] => {'~'},
          [ '-' ] => {'-'},
          [ $arg ] if ($arg | path type) == 'dir' => {$arg}
          _ => {
            zoxide query --exclude $env.PWD -- ...$rest | str trim -r -c "\n"
          }
        }
        cd $path
      }

      # Jump to a directory using interactive search.
      def --env --wrapped __zoxide_zi [...rest:string] {
        cd $'(zoxide query --interactive -- ...$rest | str trim -r -c "\n")'
      }
      alias b = __zoxide_z
      alias bi = __zoxide_zi

    # ========= zoxide end ===============

    '';

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
      FZF_DEFAULT_OPTS = "--color=fg:#cad3f5,hl:#8bd5ca,fg+:#cad3f5,bg+:#363a4f,hl+:#8bd5ca,info:#7f8c8d,prompt:#b7bdf8,spinner:#b7bdf8,pointer:#b7bdf8,gutter:-1,info:#939ab7,border:#494d64";
      NIXOS_OZONE_WL = "1"; # tell things to use wayland
      NIXPKGS_ALLOW_UNFREE = "1";
    };


  };


}
