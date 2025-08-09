{ inputs, lib, ... }: {

  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker = {
    enable = true;
    runAsService = true;
    # theme = "nixos";
    config = lib.trivial.importTOML ../../../stuff/walker/config.toml;
  };
}
