{ ... }: {

  programs.starship = {
    enable = true;
    enableFishIntegration = false;
    enableBashIntegration = false;
    enableZshIntegration = false;
    enableNushellIntegration = true;

    enableTransience = true;


    settings = {
      add_newline = true;
      continuation_prompt = "  ";


      directory = {
        read_only = " ";
        truncation_length = 10;
        truncate_to_repo = true; # truncates directory to root folder if in github repo
      };

      cmd_duration = {
        min_time = 999999; # 5000
        format = "[$duration]($style) ";
      };

      hostname.ssh_only = true;

      nix_shell.symbol = "󱄅 ";
      # rust.symbol = " ";
      rust.disabled = true;

      git_branch.symbol = "";
      git_metrics.disabled = false;
      git_status = {
        format = "(\[$all_status$ahead_behind\]($style) )";
        ahead = "\${count}";
        behind = "\${count}";
        diverged = "\${ahead_count}\${behind_count}";
      };

    };

  };

}
