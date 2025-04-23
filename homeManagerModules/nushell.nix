{ config, pkgs, ... }: {

  programs.nushell = {
    enable = true;


    configFile.text = ''
      let color_scheme = {
          shape_garbage: { fg: "#000000" bg: "#FF0000" attr: b}
          shape_filepath: green
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
          # table.mode: "none"
      }
    '';

    # envFile.text = ''
    # '';

    loginFile.text = ''
      if (tty) == "/dev/tty1" {
        Hyprland
      }
    '';
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
