{ lib, ... }: {
  options.theme = lib.mkOption {
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

  options.rounding = lib.mkOption {
    type = lib.types.boolean;
    default = true;
  };

  options.wm = lib.mkOption {
    type = lib.types.enum [
      "hyprland"
      "niri"
      # "mango" TODO
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

  options.palette.bg = lib.mkOption {
    type = lib.types.str;
    default = "#000000";
  };
  options.palette.fg = lib.mkOption {
    type = lib.types.str;
    default = "#ffffff";
  };
  options.palette.accent = lib.mkOption {
    type = lib.types.str;
    default = "#aa00ff";
  };
}
