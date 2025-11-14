{ lib, ... }: {
  options = {
    theme = lib.mkOption {
      type = lib.types.enum [
        "macchiato"
        "blacchiato"
        "lix"
        "everforest_hard"
        "everforest_medium"
        "everforest_soft"
        "kanso_mist"
        "kanso_ink"
        "kanso_zen"
        "kantsi"
      ];
      default = "blacchiato";
    };

    rounding = lib.mkOption {
      type = lib.types.boolean;
      default = true;
    };

    wm = lib.mkOption {
      type = lib.types.enum [
        "hyprland"
        "niri"
        # "mango" TODO
      ];
      default = "niri";
    };

    font = lib.mkOption {
      type = lib.types.enum [
        "mononoki"
        "iosevka"
      ];
      default = "mononoki";
    };

    font_size = lib.mkOption {
      type = lib.types.enum [
        "small"
        "medium"
        "large"
      ];
      default = "medium";
    };
  };
}
