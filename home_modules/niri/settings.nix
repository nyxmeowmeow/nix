{
  programs.niri.settings = {
    prefer-no-csd = true;
    screenshot-path = "~/Pictures/Screenshots/%d/%m/%Y_%H-%M-%S.png";
    hotkey-overlay.skip-at-startup = true;

    workspaces = {
      "1" = {
        name = "one";
        open-on-output = "DP-1";
      };
      "2" = {
        name = "browser";
        open-on-output = "DP-1";
      };
      "7" = {
        name = "game";
        open-on-output = "DP-1";
      };
      "8" = {
        name = "discord";
        open-on-output = "DP-1";
      };
      "3" = {
        name = "three";
        open-on-output = "DP-1";
      };
      "4" = {
        name = "browser_2";
        open-on-output = "DP-1";
      };
      "9" = {
        name = "alt";
        open-on-output = "DP-3";
      };
    };

  };
}
