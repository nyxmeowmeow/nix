{ lib, ... }: {
  options.mrrp.theme = lib.mkOption {
    default = lib.mkDefault "black";
    type = lib.types.enum [
      "black"
      "lix"
      "macchiato"
    ];
  };
}
