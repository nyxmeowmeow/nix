{ config, pkgs, ... }: {

  programs.nushell = {
    enable = true;


    configFile.text = ''
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


      let zoxide_completer = {|spans|
          $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
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

    # envFile.text = ''
    # '';

    loginFile.text = ''
      if (tty) == "/dev/tty1" {
        Hyprland
      }
    '';


    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      sudo="sudo -k"; # prompt every time
      s="sudo -k"; # prompt every time
      rm="rm -i"; # prompt every time
      mv="mv -i"; # prompt every time
      ln="ln -i"; # prompt every time


      logout="hyprctl dispatch exit 0";
      c="clear"; # clear terminal
      l="eza -lh  --icons=auto"; # long list
      ls="eza -a1   --icons=auto"; # short list
      ll="eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
      ld="eza -lhD --icons=auto"; # long list dirs
      lt="eza --icons=auto --tree"; # list folder as tree
      ff="fastfetch --logo nixos_small --logo-color-2 magenta";
      cl="hyprctl clients";



      ga="git add .";
      gl="git log --pretty=oneline | lines | fzf";
      gd="git diff HEAD^";
      gs="git status";
      cr="cargo run";


      nr = ''
        do {
          sudo nixos-rebuild switch --flake /home/meow/nix#nixos
          cd ~/nix
          git add .
          git commit -m $"(date now | format date '%d/%m %H:%M:%S')"
        }
      '';
      na="nvim ~/nix/packages.nix -c '/systemPackages'";
      ns="nix-shell -p";

      n="nvim";
    };


    environmentVariables = {

      MANPAGER = "nvim +Man!"; # use nvim for man
      SUDO_TIMESTAMP_TIMEOUT = 0;
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "zen";
      FZF_DEFAULT_OPTS = "--color=fg:#cad3f5,hl:#8bd5ca,fg+:#cad3f5,bg+:#363a4f,hl+:#8bd5ca,info:#7f8c8d,prompt:#b7bdf8,spinner:#b7bdf8,pointer:#b7bdf8,gutter:-1,info:#939ab7,border:#494d64";


    };




  };



  programs.starship = {

    enable = true;
    enableFishIntegration = false;
    enableBashIntegration = false;
    enableZshIntegration = false;
    enableNushellIntegration = true;
    enableTransience = true;


    settings = {
      add_newline = true;

      character = {
        success_symbol = "[](blue)";
        error_symbol = "[](red)";
      };

      directory = {
        read_only = " ";
        truncation_length = 10;
        truncate_to_repo = true; # truncates directory to root folder if in github repo
        style = "bold blue";
      };

      nix_shell.symbol = "󱄅 ";

    };

  };
}
