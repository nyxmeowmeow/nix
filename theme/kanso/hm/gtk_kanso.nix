{
  lib,
  theme,
  pkgs,
  config,
  ...
}: {
  config = lib.mkIf (lib.hasPrefix "kanso" theme) {

    gtk = {
      enable = true;
      # theme = {
      #   name = "catppuccin-macchiato-lavender-compact";
      #   package = pkgs.catppuccin-gtk.override {
      #     variant = "macchiato";
      #     accents = [ "lavender" ]; # can specify multiple accents
      #       size = "compact"; # compact, standard, large
      #       # tweaks = [ "rimless" "black" ];
      #   };
      # };

      iconTheme = {
        # package = pkgs.gnome.adwaita-icon-theme;
        name = "Tela-circle-dracula";
      };

      font = {
        name = config.stylix.fonts.monospace.name;
        size = 12;
      };

      gtk3.extraConfig.gtk-key-theme-name = "Emacs";
      gtk4.extraConfig.gtk-key-theme-name = "Emacs";
    };
  };
}
