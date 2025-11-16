{ lib, config, pkgs, ... }: {
  config = lib.mkMerge [
    (lib.mkIf (config.font == "mononoki") {
      stylix.fonts.monospace = {
        package = pkgs.nerd-fonts.mononoki;
        name = "Mononoki Nerd Font Mono";
      };

      font_path = "${pkgs.nerd-fonts.mononoki}/share/fonts/truetype/NerdFonts/Mononoki/MononokiNerdFontMono-Regular.ttf";
      font_path_bold = "${pkgs.nerd-fonts.mononoki}/share/fonts/truetype/NerdFonts/Mononoki/MononokiNerdFontMono-Bold.ttf";
    })

    (lib.mkIf (config.font == "iosevka") {
      stylix.fonts.monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font Mono";
      };
      font_path = "${pkgs.nerd-fonts.iosevka}/share/fonts/truetype/NerdFonts/Iosevka/IosevkaNerdFontMono-Regular.ttf";
      font_path_bold = "${pkgs.nerd-fonts.iosevka}/share/fonts/truetype/NerdFonts/Iosevka/IosevkaNerdFontMono-Bold.ttf";
    })
  ];
}
