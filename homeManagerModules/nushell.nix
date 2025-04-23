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
      gl="git log --oneline | fzf";
      gd="git diff HEAD^";
      gs="git status";
      cr="cargo run";



      nr="sudo nixos-rebuild switch --flake /home/meow/nix#nixos ; cd ~/nix ; git add . ; git commit -m $(date +'%d/%m %H:%M:%S')";
      nro="sudo nixos-rebuild switch --offline --flake /home/meow/nix#nixos ; cd ~/nix ; git add . ; git commit -m $(date now | format date '%d/%m %H:%M:%S')";
      na="nvim ~/nix/packages.nix -c '/systemPackages'";
      ns="nix-shell -p";

      n="nvim";
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
