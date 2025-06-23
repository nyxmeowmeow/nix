{ lib, ... }: {
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;

      # TODO move this to themes/*
    colors = lib.mkForce {
      fg = "#A4A0E8";
      hl = "#DBBFEF";
      "fg+" = "#A4A0E8";
      "bg+" = "#5A3D6E";
      "hl+" = "#DBBFEF";
      info = "#886C9C";
      prompt = "#DBBFEF";
      spinner = "#3B224C";
      pointer = "#3B224C";
      gutter = "#3B224C";
      border = "#3B224C";
    };
  };
}

