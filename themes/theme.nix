{ lib, ... }: {
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

  config.theme = "macchiato";

}

