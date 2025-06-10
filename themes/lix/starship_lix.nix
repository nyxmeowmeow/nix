{ lib, theme, ... }: {
  config = lib.mkIf (theme == "lix") {

    programs.starship = {
      settings = {
        character = {
          success_symbol = "[󰘧](purple)";
          error_symbol = "[󰘧](red)";
        };

        nix_shell = {
          symbol = "";
        };

        directory = {
          style = "bold #DBBFEF";
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
  };
}
