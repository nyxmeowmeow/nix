{
  lib,
  theme,
  pkgs,
  config,
  ...
}: {
  config = lib.mkIf (lib.hasPrefix "everforest" theme) {

    gtk = {
      enable = true;
      theme = {
        name = "everforest-compact";
        package = pkgs.everforest-gtk-theme;
      };

      iconTheme = {
        # package = pkgs.gnome.adwaita-icon-theme;
        package = pkgs.fluent-icon-theme;
        name = "Tela-circle-dracula";
      };

      font = {
        name = config.stylix.fonts.monospace.name;
        size = 12;
      };

      # emacs keybinds for text fields
      gtk3.extraConfig.gtk-key-theme-name = "Emacs";
      gtk4.extraConfig.gtk-key-theme-name = "Emacs";
    };
  };
}
