{
  pkgs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.mononoki
      nerd-fonts.iosevka
      sn-pro
      noto-fonts-cjk-sans
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      subpixel.rgba = "none";
      hinting = {
        enable = true;
        style = "slight";

      };
    };
  };
}
