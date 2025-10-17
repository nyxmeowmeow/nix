{ lib, ... }: {
  config.theme = "lix";
  config.wm = "niri";
  config.font = "iosevka";
  config.font_size = "small";
  config.rounding = true;

  options.theme = lib.mkOption {
    type = lib.types.enum [
      "blacchiato"
      "lix"
      "macchiato"
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

  options.rounding = lib.mkOption {
    type = lib.types.boolean;
    default = true;
  };

  options.wm = lib.mkOption {
    type = lib.types.enum [
      "niri"
      "hyprland"
    ];
    default = "niri";
  };

  options.font = lib.mkOption {
    type = lib.types.enum [
      "mononoki"
      "iosevka"
    ];
    default = "mononoki";
  };

  options.font_size = lib.mkOption {
    type = lib.types.enum [
      "small"
      "medium"
      "large"
    ];
    default = "medium";
  };
}
