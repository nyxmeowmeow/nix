{

  programs.starship = {
    settings = {
      character = {
        success_symbol = "[󰘧](blue)";
        error_symbol = "[󰘧](blue)";
      };

      nix_shell = {
        symbol = "";
      };

      directory = {
        style = "bold blue";
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
