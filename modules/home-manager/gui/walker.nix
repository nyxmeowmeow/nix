{ inputs, lib, importTOML, ... }: {

  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker = {
    enable = true;
    # runAsService = true;
    # theme = "nixos";
    config = importTOML ../../../stuff/config.toml;
  };
}
