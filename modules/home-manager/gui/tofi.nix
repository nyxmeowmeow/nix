{ config, ... }: {
  programs.tofi = {
    enable = true;
    settings = {
      border-width = 2;
      font = "${config.stylix.fonts.monospace.name}";
      font-size = 26;
      height = "50%";
      num-results = 5;
      outline-width = 0;
      # padding-left = "35%";
      # padding-top = "35%";
      result-spacing = 25;
      width = "20%";
    };

  };
}






















