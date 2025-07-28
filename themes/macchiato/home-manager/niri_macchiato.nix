{ lib, theme, ... }: {
  config = lib.mkIf (theme == "macchiato" || theme == "black") {

    programs.niri.settings.layout = {
      focus-ring = {
        enable = true;
        width = 2;
        active.color = "#B7BDF8";
      };
      tab-indicator = {
        enable = true;
        active.color = "#B7BDF8";
        inactive.color = "#5b6078";
        hide-when-single-tab = false;
      };
    };
  };
}
