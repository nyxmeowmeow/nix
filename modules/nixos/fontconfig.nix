{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.mononoki
        nerd-fonts.iosevka
        spleen
        sn-pro
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      subpixel.rgba = "none";
      hinting = {
        enable = true;
        style = "full";

      };
    };
  };
}
