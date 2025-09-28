{ lib, ... }: {
  config.theme = "kanso_zen";
  config.wm = "niri";
  config.font = "iosevka";
  config.font_size = "small";

  options.theme = lib.mkOption {
    type = lib.types.enum [
      "black"
      "lix"
      "macchiato"
      "ocean"
      "everforest_hard"
      "everforest_medium"
      "everforest_soft"
      "kanso_mist"
      "kanso_ink"
      "kanso_zen"
    ];
    default = "black";
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
