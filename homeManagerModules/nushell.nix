{ config, pkgs, ... }: {

  programs.nushell = {
    enable = true;


    configFile.text = ''
      let $config = {

        color_config: {
          separator: purple
          leading_trailing_space_bg: "#ffffff"
          header: gb
          date: wd
          filesize: c
          row_index: cb
          bool: red
          int: green
          duration: blue_bold
          range: purple
          float: red
          string: white
          nothing: red
          binary: red
          cellpath: cyan
          hints: dark_gray
        }
      }
    '';

    envFile.text = ''
      $env.config.show_banner = false
      $env.config.table.mode = "none"
    '';

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
        error_symbol = "[](blue)";
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
