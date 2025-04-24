{ config, pkgs, ... }: {

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
        read_only = " ";
        truncation_length = 10;
        truncate_to_repo = true; # truncates directory to root folder if in github repo
        style = "bold blue";
      };

      nix_shell.symbol = "󱄅 ";
      git_branch.symbol = "";
      rust.symbol = " ";

    };

  };

}
