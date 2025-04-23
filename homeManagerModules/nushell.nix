{ config, pkgs, ... }: {

  programs.nushell = {
    enable = true;


    configFile.text = ''
      let color_scheme = {
          shape_garbage: { fg: "#000000" bg: "#FF0000" attr: b}
          shape_nothing: foreground
          shape_filepath: green
          shape_external: blue
      }


      $env.config = {
          color_config: $color_scheme
          show_banner: false
          table.mode: none
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
