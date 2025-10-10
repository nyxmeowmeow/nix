{ lib, theme, pkgs, ... }: {
  config = lib.mkIf (theme == "kantsi") {

    gtk = {
      enable = true;
      theme = {
        name = "catppuccin-macchiato-lavender-compact";
        package = pkgs.catppuccin-gtk.override {
          variant = "macchiato";
          accents = [ "lavender" ]; # can specify multiple accents
            size = "compact"; # compact, standard, large
            tweaks = [ /* "rimless" */ "black" ];
        };
      };

      iconTheme = {
        # package = pkgs.gnome.adwaita-icon-theme;
        name = "Tela-circle-dracula";
      };

      font = {
        name = "sn pro";
        size = 11;
      };

      gtk3.extraConfig.gtk-key-theme-name = "Emacs";
      gtk4.extraConfig.gtk-key-theme-name = "Emacs";
    };
  };
}
