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
      theme = {
        name = "fluent-compact";
        package = pkgs.fluent-gtk-theme.override {
          themeVariants = [ "purple" ];
          colorVariants = [ "dark" ];
          sizeVariants = [ "compact" ];
          tweaks = [
            # "solid"
            "float"
            # "round"
            # "blur"
            # "noborder"
            # "square"
          ];
        };
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
