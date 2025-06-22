{ lib, ... }: {

  config.theme = "everforest_soft";
  # config.wm = "niri";
  # TODO font



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
    default = "black";
  };

  # options.wm = lib.mkOption {
  #   type = lib.types.enum [
  #     "niri"
  #     "hyprland"
  #   ];
  #   default = "niri";
  # };

}

