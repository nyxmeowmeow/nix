{ lib, ... }: {

  config.theme = "black";
  config.wm = "niri";



  options.theme = lib.mkOption {
    type = lib.types.enum [
      "black"
      "lix"
      "macchiato"
      "ocean"
      "everforest_hard"
      "everforest_medium"
      "everforest_soft"
    ];
    default = "black"; # Set a default theme
  };

  options.wm = lib.mkOption {
    type = lib.types.enum [
      "niri"
      "hyprland"
    ];
    default = "niri"; # Set a default theme
  };

}

