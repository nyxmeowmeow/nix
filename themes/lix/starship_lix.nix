{ ... }: {

  programs.starship = {
    settings = {
      character = {
        success_symbol = "[󰘧](fg)";
        error_symbol = "[󰘧](red)";
      };

      directory = {
        style = "bold fg";
      };
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
