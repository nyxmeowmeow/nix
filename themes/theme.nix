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
    default = "lix"; # Set a default theme
  };

  config.theme = "everforest_soft";

}

