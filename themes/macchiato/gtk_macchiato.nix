{ pkgs, ... }: {

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "macchiato";
        accents = [ "lavender" ]; # can specify multiple accents
        size = "standard"; # compact, standard, large
        # tweaks = [ "rimless" "black" ];
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

}
