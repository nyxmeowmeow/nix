{ lib, ... }:
let
  enumThemes = [
    "black"
    "lix"
    "macchiato"
    "ocean"
  ];
in {
  options.theme = lib.mkOption {
    type = lib.types.enum enumThemes;
    default = "lix"; # Set a default theme
    description = "Global theme selection for NixOS and Home Manager.";
  };

  config.theme = "ocean";

}

